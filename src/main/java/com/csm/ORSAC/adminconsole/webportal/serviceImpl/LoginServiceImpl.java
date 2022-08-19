
package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import java.security.SecureRandom;

import org.apache.commons.io.FilenameUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.csm.ORSAC.adminconsole.webportal.config.MD5PasswordEncoder;
import com.csm.ORSAC.adminconsole.webportal.entity.AdminRole;
import com.csm.ORSAC.adminconsole.webportal.entity.IpTrack;
import com.csm.ORSAC.adminconsole.webportal.entity.PrimaryLink;
import com.csm.ORSAC.adminconsole.webportal.entity.User;
import com.csm.ORSAC.adminconsole.webportal.entity.UserPermission;
import com.csm.ORSAC.adminconsole.webportal.entity.UserType;
import com.csm.ORSAC.adminconsole.webportal.repository.IPTrackingRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.LoginRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.UserRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.UserTypeRepository;
import com.csm.ORSAC.adminconsole.webportal.service.LoginService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacUtillity;
import com.csm.ORSAC.webportal.bean.PasswordBean;
import com.csm.ORSAC.webportal.bean.ProfileBean;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	public static final Logger LOG = LoggerFactory.getLogger(LoginServiceImpl.class);

	

	@Autowired
	@Qualifier("loginRepository")
	private LoginRepository loginRepository;

	@Autowired
	@Qualifier("ipTrackingRepository")
	private IPTrackingRepository ipTrackingRepository;

	@Autowired
	@Qualifier("userRepository")
	UserRepository userRepository;

	@Autowired
	@Qualifier("userTypeRepository")
	UserTypeRepository userTypeRepository;

	@Override
	public User findByUserName(String userName) {
		User loginVo = null;
		try {
			

			loginVo = loginRepository.findByUserNameAndBitStatus(userName, false);

			
		} catch (Exception e) {
			LOG.error("LoginServiceImpl::findByUserName():" + e);
		}
		return loginVo;
	}

	@Override
	public List<UserPermission> findByUserId(int userId) {
		List<UserPermission> permissionList = new ArrayList<>();
		
		UserPermission permissionVo = null;

		try {
			List<Object[]> userPermissionList = loginRepository.findByUserId(userId);

			for (Object[] obj : userPermissionList) {
				permissionVo = new UserPermission();
				permissionVo.setGlobalName(String.valueOf(obj[0]));
				permissionVo.setPrimaryLinks(getDataFromUserPermission(String.valueOf(obj[0]), userId));
				permissionVo.setGlobalId(Integer.parseInt(String.valueOf(obj[1])));
				permissionList.add(permissionVo);
			}
		} catch (Exception e) {
			LOG.error("LoginServiceImpl::findByUserId():" + e);
		}
		return permissionList;
	}

	private List<PrimaryLink> getDataFromUserPermission(String valueOf, int userId) {
		PrimaryLink link = null;
		List<PrimaryLink> primaryLinks = new ArrayList<>();
		try {
			List<Object[]> userPrimaryList = loginRepository.findByGlobalNameAndUserId(valueOf, userId);
			for (Object[] obj : userPrimaryList) {
				link = new PrimaryLink();
				link.setPrimaryLinkName(String.valueOf(obj[0]));
				link.setFileName(String.valueOf(obj[1]));
				primaryLinks.add(link);
			}
		} catch (Exception e) {
			LOG.error("LoginServiceImpl::getDataFromUserPermission():" + e);
		}
		return primaryLinks;
	}

	@Override
	public AdminRole getRolByUserId(int userId) {
		String roleName = null;
		Integer roleId = 0;
		AdminRole role = null;
		String aliasName = null;
		try {

			List<Object[]> objs = loginRepository.findRoleByUserId(userId);
			for (Object[] obj : objs) {
				roleName = String.valueOf(obj[0]);
				

				aliasName = String.valueOf(obj[1]);
				roleId = Integer.parseInt(String.valueOf(obj[2]));
			}

			role = new AdminRole();
			role.setRoleId(roleId);
			
			role.setAliasName(aliasName);
			
			LOG.info("roleName"+roleName);
		} catch (Exception e) {
			LOG.error("LoginServiceImpl::getRoleByUserId():" + e);
		}
		return role;
	}

	@Override
	public IpTrack saveUserTrackInfo(IpTrack ipinfo) {
		IpTrack info = null;
		try {
			LOG.info("LoginServiceImpl::ipTrack info ::: >>>>>>" + ipinfo);
			info = ipTrackingRepository.save(ipinfo);
		} catch (Exception e) {
			LOG.error("LoginServiceImpl::saveUserTrackInfo():" + e);
		}
		return info;
	}

	@Override
	public int countFailAttempt(int userId) {
		int failCount = 0;
		try {
			DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			failCount = ipTrackingRepository.countFailAttemptByUserIdDate(userId,
					new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").parse(df.format(new Date()) + " 00:00:00"));
		} catch (Exception e) {
			LOG.error("LoginServiceImpl::countFailAttempt():" + e);
		}
		return failCount;
	}

	@Override
	public UserType getUserTypeById(int userId) {
		UserType userType = null;
		try {
			userType = userTypeRepository.findById(userId).get();
		} catch (Exception e) {
			LOG.error("LoginServiceImpl::getUserTypeById():" + e);
		}
		return userType;
	}

	@Override
	public String updatePassword(PasswordBean userDetails) {
		String sts = OrsacPortalConstant.FAILURE;
		try {
			User obj = userRepository.findByUserId(userDetails.getUserId());
			if (obj != null) {
				obj.setPassword(userDetails.getNewPassword());
				obj.setFirstLogin('N');

				obj.setUpdatedBy(userDetails.getUserId());
				obj.setUpdatedOn(new java.sql.Timestamp(new Date().getTime()));

				userRepository.save(obj);
				sts = OrsacPortalConstant.SUCCESS;
			}

		} catch (Exception e) {
			LOG.error("LoginServiceImpl::updatePassword():" + e);
		}
		return sts;
	}

	@Override
	public String updateProfile(ProfileBean profileDetails) {
		String result = OrsacPortalConstant.FAILURE;
		String profileImgName = null;
		try {
			
			if (profileDetails.getProfileImg() != null && !profileDetails.getProfileImg().isEmpty()) {

				profileImgName = createProfileImgName(profileDetails);
				File file = new File(OrsacPortalConstant.wrsisPropertiesFileConstants.USER_PROFILE_IMG_UPLOAD_PATH);
				if (!file.exists()) {
					file.mkdirs();
				}
				if (!file.exists()) {
					Path path = Paths
							.get(OrsacPortalConstant.wrsisPropertiesFileConstants.USER_PROFILE_IMG_UPLOAD_PATH);
					Files.createDirectories(path);
				}
				FileCopyUtils.copy(profileDetails.getProfileImg().getBytes(),
						new File(OrsacPortalConstant.wrsisPropertiesFileConstants.USER_PROFILE_IMG_UPLOAD_PATH
								+ File.separator + profileImgName));
			}

			User userDetails = userRepository.getOne(profileDetails.getUserId());
			userDetails.setFullName(profileDetails.getFullName());
			userDetails.setMobile(profileDetails.getMobile());
			userDetails.setEmail(profileDetails.getEmail());
			if (profileDetails.getGender() != 0)
				userDetails.setGender(profileDetails.getGender());
			if (profileImgName != null) {
				if (userDetails.getPhotoFileName() != null && !userDetails.getPhotoFileName().isEmpty()) {
					File file = new File(OrsacPortalConstant.wrsisPropertiesFileConstants.USER_PROFILE_IMG_UPLOAD_PATH
							+ File.separator + userDetails.getPhotoFileName());
					if (file.exists()) {
						if (!file.delete()) {
							LOG.info("LoginServiceImpl::updateProfile(): + FILE CAN'T DELETED");
							   // file delete failed take appropriate action 
							  }
					}
				}
				userDetails.setPhotoFileName(profileImgName);
			}
			userDetails.setUpdatedBy(profileDetails.getUserId());
			userDetails.setUpdatedOn(new java.sql.Timestamp(new Date().getTime()));

			userRepository.save(userDetails);
			result = OrsacPortalConstant.SUCCESS;

		} catch (Exception e) {
			LOG.error("LoginServiceImpl::updateProfile():" + e);
			result = OrsacPortalConstant.FAILURE;
		}

		return result;
	}

	private String createProfileImgName(ProfileBean profileDetails) {
		String fileName = null;
		try {
			SecureRandom random = new SecureRandom();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd");
			SimpleDateFormat monthFormat = new SimpleDateFormat("MM");
			Date datee = new Date();
			String date = dateFormat.format(datee);
			String month = monthFormat.format(datee);
			int	randomNo = random.ints(1001, 9999).findFirst().getAsInt();
			

			String extensionName = FilenameUtils.getExtension(profileDetails.getProfileImg().getOriginalFilename());
			fileName = "img_" + month + date + profileDetails.getUserId() + randomNo + "." + extensionName;

		} catch (Exception e) {
			LOG.error("LoginServiceImpl::createProfileImgName():" + e);
		}
		return fileName;
	}

	@Override
	public String updateforgottenPassword(PasswordBean paswdResetDetails) {
		String sts = OrsacPortalConstant.FAILURE;
		try {
			User obj = userRepository.findByUserId(paswdResetDetails.getUserId());
			if (obj != null) {
				String password = OrsacUtillity.generatePassword();
				obj.setPassword(new MD5PasswordEncoder().encode(password));
				obj.setFirstLogin('Y');

				obj.setUpdatedBy(paswdResetDetails.getUserId());
				obj.setUpdatedOn(new java.sql.Timestamp(new Date().getTime()));

				userRepository.save(obj);
				sts = password;
			}

		} catch (Exception e) {
			LOG.error("LoginServiceImpl::updateforgottenPassword():" + e);
		}
		return sts;
	}

	@Override
	public JSONObject mUserDetails(String userName) {
		JSONObject rowsData = new JSONObject();
		JSONArray roleArray = new JSONArray();

		try {
			List<Object[]> objList = userRepository.mUserDetails(userName);
			JSONObject userProfileData = null;
			JSONObject roleObj = null;
			if (!objList.isEmpty()) {
				for (Object[] obj : objList) {
					userProfileData = new JSONObject();
					userProfileData.put("userName", String.valueOf(obj[0]));
					userProfileData.put("designation", String.valueOf(obj[1]));
					userProfileData.put("mobileNumber", String.valueOf(obj[2]));
					userProfileData.put("userId", String.valueOf(Integer.valueOf((Short) (obj[3]))));
					userProfileData.put("mailid", String.valueOf(obj[4]));
					if (obj[5] != null)
						userProfileData.put("gender", getGender(String.valueOf(Integer.valueOf((Short) (obj[5])))));
					userProfileData.put("image", String.valueOf(obj[6]));
					userProfileData.put("firstlogin", String.valueOf(obj[7]));
					Integer userId = Integer.valueOf(String.valueOf(Integer.valueOf((Short) (obj[3]))));

					List<Object[]> roleList = userRepository.getRoleByUserId(userId);
					if (!roleList.isEmpty()) {
						for (Object[] optobj : roleList) {
							roleObj = new JSONObject();
							roleObj.put("rolId", String.valueOf(optobj[0]));
							roleObj.put("rolName", String.valueOf(optobj[1]));
							roleObj.put("role", String.valueOf(optobj[2]));
							
							roleArray.put(roleObj);

						}
						userProfileData.put("roleData", roleArray);
					}
					

				}
			}
			rowsData.put("userProfileData", userProfileData);
			
		} catch (Exception e) {
			LOG.error("LoginServiceImpl::mUserDetails():" + e);
		}
		return rowsData;

	}

	private String getGender(String gendervalue) {
		String gender = "";
		if (gendervalue.equals("1")) {
			return gender = OrsacPortalConstant.MALE;
		} else {
			gender = OrsacPortalConstant.FEMALE;
		}
		return gender;
	}

	@Override
	public String validateMobileNumberByUserId(String mobile, Integer userId) {
		LOG.info("LoginServiceImpl::id==" + userId);
		JSONObject jobj = new JSONObject();
		;
		try {

			List<Object[]> moblieList = null;
			moblieList = userRepository.getMobileByUserId(mobile.trim(), userId);

			if (moblieList == null || moblieList.isEmpty()) {
				jobj.put("mob", "Yes");

			} else {
				jobj.put("mob", "Exit");
			}
			

		} catch (Exception e) {
			LOG.error("LoginServiceImpl::validateMobileNumberByUserId():" + e);
		}
		return jobj.toString();
	}

}
