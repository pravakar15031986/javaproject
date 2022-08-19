package com.csm.ORSAC.webportal.service.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.csm.ORSAC.adminconsole.webportal.repository.UserRepository;
import com.csm.ORSAC.webportal.bean.OtpBean;
import com.csm.ORSAC.webportal.bean.RegistrationBean;
import com.csm.ORSAC.webportal.bean.UserResponseBean;
import com.csm.ORSAC.webportal.entity.PacsInspectorDto;
import com.csm.ORSAC.webportal.repository.PacsInspectorRepository;
import com.csm.ORSAC.webportal.service.RegistrationService;
import com.csm.ORSAC.webportal.util.DateUtil;
import com.csm.ORSAC.webportal.util.FileUploadUtil;
import com.csm.ORSAC.webportal.util.MSDGSMSAPI;
import com.csm.ORSAC.webportal.util.RandomDigitGenerator;

@Service
public class RegistrationServiceImpl implements RegistrationService {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	UserRepository userRepo;

	@Autowired
	PacsInspectorRepository pacsInspRepo;

	@Autowired
	MSDGSMSAPI msdgsmsApi;

	@Value("${msdgusername}")
	String userName;
	@Value("${msdgpassword}")
	String password;
	@Value("${msdgsenderId}")
	String senderId;
	@Value("${msdgapikey}")
	String apiKey;

	@Value("${profileimage.upload.path}")
	String profileImageUploadPath;

	@Autowired
	HttpSession session;

	/**
	 * @param RegistrationBean 
	 * This method will save PACS inspector Sign up data
	 * @return save PACS inspector sign up status
	 */
	@Override
	public String savePacsInspectorData(RegistrationBean registrationBean) {

		String status = "";

		try {
			PacsInspectorDto pacsInspDto = new PacsInspectorDto();
			pacsInspDto.setMobile(registrationBean.getMobileNumber());
			pacsInspDto.setDesgid(Integer.parseInt(registrationBean.getDesginationId()));
			pacsInspDto.setStateid(Integer.parseInt(registrationBean.getStateId()));
			pacsInspDto.setDistrictId(registrationBean.getDistrictId());
			pacsInspDto.setBlockId(registrationBean.getBlockId());
			pacsInspDto.setGpid(0);
			pacsInspDto.setVillageid(0);
			pacsInspDto.setStatus(0);
			pacsInspDto.setUsername(registrationBean.getName());
			pacsInspDto.setPacsId(registrationBean.getPacsId());
			pacsInspDto.setVchEmail(registrationBean.getEmail());
			pacsInspDto.setCreated_on(Timestamp.valueOf(LocalDateTime.now()));
			PacsInspectorDto responseDto = pacsInspRepo.save(pacsInspDto);
			Predicate<PacsInspectorDto> chkResponse = o -> o != null;

			if (chkResponse.test(responseDto)) {
				status = "200"; //success
			} else {
				status = "500"; //failuer
			}

		} catch (Exception e) {
			status = "500";
			e.printStackTrace();
		}
		return status;

	}

	/**
	 * @param mobile number 
	 * This method is used for check if the mobile number is
	 *  already exist or not
	 * @return count of provided mobile number
	 */
	@Override
	public String checkUserSignUp(String mobileNumber) {
		String status = "";
		List<PacsInspectorDto> pacsInspDto = null;
		try {

			pacsInspDto = pacsInspRepo.findByMobileAndDeletedflag(mobileNumber, false);
			if (pacsInspDto.size() > 0) {
				if (pacsInspDto.get(0).getStatus() == 0 || pacsInspDto.get(0).getStatus() == 1) {
					status = "SIGNUP_INCOMPLETE";
				} else {
					status = "FOUND"; // if user data already present against this mobile number
				}
			} else {
				status = "NOT_FOUND"; // No data Found
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	/**
	 * @param mobile number
	 * @param otp    
	 * This Method will update otp against the provided mobile number
	 * @return update otp status
	 */
	@Override
	public String saveOtp(String mobNum, int otp) {
		String status = "";
		PacsInspectorDto pacsInspDto = null;

		try {

			pacsInspDto = pacsInspRepo.findByMobileAndDeletedflag(mobNum, false).get(0);
			pacsInspDto.setOtp(String.valueOf(otp));

			pacsInspDto.setStatus(1);
			pacsInspDto.setOtpgenerated_on(Timestamp.valueOf(LocalDateTime.now()));
			pacsInspDto.setOtpexpiry_on(Timestamp.valueOf(LocalDateTime.now().plusMinutes(5)));
			PacsInspectorDto responseDto = pacsInspRepo.save(pacsInspDto);
			Predicate<PacsInspectorDto> chkResponse = o -> o != null;

			if (chkResponse.test(responseDto)) {
				status = "200"; //success
			} else {
				status = "500"; //failure
			}

		} catch (Exception e) {
			status = "500";
			e.printStackTrace();
		}
		return status;
	}

	/**
	 * @param OtpBean 
	 * This method will validate otp provided
	 *  by user and the otp
	 *   generated
	 * @return validate status of otp
	 */
	@Override
	public String validateOtp(OtpBean otpBean) {

		String generatedOtp = "";
		String OtpSentMobNo = "";
		String otpSendTime = "";
		String otpExpiryTime = "";
		String cuurentTime = "";
		String status = "";
		try {

			List<Object[]> objList = pacsInspRepo.fetchOtpDetails(otpBean.getMobNumber(), false);
			System.err.println(objList.get(0)[0] + " " + objList.get(0)[1] + " " + objList.get(0)[2] + " "
					+ objList.get(0)[3] + " " + objList.get(0)[4]);
			generatedOtp = String.valueOf(objList.get(0)[0]);
			OtpSentMobNo = String.valueOf(objList.get(0)[1]);
			otpSendTime = String.valueOf(objList.get(0)[2]);
			otpExpiryTime = String.valueOf(objList.get(0)[3]);
			cuurentTime = String.valueOf(objList.get(0)[4]);

			Date OTpSendLocalTime = DateUtil.StringToDate(otpSendTime, "yyyy-MM-dd HH:mm:ss");
			Date otpExpiryLocalTime = DateUtil.StringToDate(otpExpiryTime, "yyyy-MM-dd HH:mm:ss");
			Date cuurentLocalTime = DateUtil.StringToDate(cuurentTime, "yyyy-MM-dd HH:mm:ss");

			long diff = otpExpiryLocalTime.getTime() - OTpSendLocalTime.getTime();
			long diff1 = cuurentLocalTime.getTime() - OTpSendLocalTime.getTime();

			long minutes = diff / (60 * 1000) % 60;
			long curMinutes = diff1 / (60 * 1000) % 60;

			if (!otpBean.getMobNumber().equals(OtpSentMobNo)) {
				status = "300";// Mobile Number Mismatched
			} else if (!otpBean.getOtp().equals(generatedOtp)) {
				status = "301"; // Otp Mismatched
			} else if (minutes > 5 || curMinutes > 5) {
				status = "302"; // Otp Expired
			} else {
				status = "200"; // successfully Verified
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return status;
	}

	/**
	 * @param OtpBean 
	 * This method will update OTP status after OTP is validated
	 * @param OTP Status
	 * 
	 */
	@Override
	public void updateOtpStatus(OtpBean otpBean, int i) {

		PacsInspectorDto pacsInspDto = null;
		try {

			pacsInspDto = pacsInspRepo.findByMobileAndDeletedflag(otpBean.getMobNumber(), false).get(0);
			pacsInspDto.setStatus(i);
			pacsInspRepo.save(pacsInspDto);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	@Override
	public String verifySignUpStatus(String mobNumber) {
		String status = "";
		PacsInspectorDto pacsInspDto = null;
		try {
			pacsInspDto = pacsInspRepo.findByMobileAndDeletedflag(mobNumber, false).get(0);
			status = String.valueOf(pacsInspDto.getStatus());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	/**
	 * @param mobile number
	 * @param OTP    
	 * This method will send otp to registered
	 *  mobile number and save
	 *  otp response
	 * @return send otp status
	 */
	@Override
	public String sendOtp(String mobNumber, int otp) {
		String smsContent = "";
		String templateId = "";
		String msgStatus = "";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			// SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			// Date newDate= new Date();
			// String otpDate = sdf.format(newDate);
			System.err.println("OTP Auth:" + otp);
			smsContent = "Your OTP to login in (Paddy verification Mobile App) is " + otp + " and valid for " + 5
					+ " minutes. Do not share it with anyone. FS&CW Deptt., GoO.";
			templateId = "1007829866953067659";
			msgStatus = msdgsmsApi.sendSingleSMS(userName, password, smsContent, senderId, mobNumber, apiKey,
					templateId);
			String respCode = msgStatus.substring(0, 3);

			con = jdbcTemplate.getDataSource().getConnection();
			pstmt = con.prepareCall("update t_ppasgis_pacsinspector set vch_otp_rescode=? where vchmobile=?");
			pstmt.setString(1, msgStatus);
			pstmt.setString(2, mobNumber);

			int updatestatus = pstmt.executeUpdate();

			System.err.println(respCode);
			System.err.println(updatestatus);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}

		return msgStatus;
	}

	/**
	 * @param mobileNumber
	 * @param distId
	 * @param blockId
	 * @param pacsId       
	 * This method will check user is already sign up or not
	 */
	@Override
	public String checkUserSignUp(String mobileNumber, boolean deletedfalg) {
		String status = "";
		List<Object[]> objList = null;
		try {

			objList = pacsInspRepo.checkSignup(mobileNumber);

			if (objList.size() > 0) {
				if (String.valueOf(objList.get(0)[1]).equals("1") || String.valueOf(objList.get(0)[1]).equals("0")) {
					status = "SIGNUP_INCOMPLTE"; // sign up is not completed
				} else if (String.valueOf(objList.get(0)[1]).equals("3")) {
					status = "FOUND"; // if user data already present against this mobile number
				} else if (String.valueOf(objList.get(0)[1]).equals("2")) {
					status = "APPROVAL_PENDING"; // pending at ARCS/DRCS Approval
				} else {
					status = "REJECTED"; // application rejected
				}

			} else {
				status = "NOT_FOUND"; // No data Found
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	/**
	 * @param mobile number 
	 * This method will provide user details against the
	 * registered mobile number
	 */
	@Override
	public UserResponseBean fetchUserDetails(String mobNumber) {
		PacsInspectorDto pacsInspDto = null;
		UserResponseBean userResponseBean = null;
		List<Object[]> objList = null;
		try {
			pacsInspDto = pacsInspRepo.findByMobileAndDeletedflag(mobNumber, false).get(0);
			userResponseBean = new UserResponseBean();
			userResponseBean.setUserId(String.valueOf(pacsInspDto.getIntpacsinpsid()));
			userResponseBean.setUserMobile(pacsInspDto.getMobile());
			userResponseBean.setUserName(pacsInspDto.getUsername());
			userResponseBean.setUserDesignation("Society Member");

			objList = pacsInspRepo.fetchLocationDetails(mobNumber);
			userResponseBean.setDistrict(String.valueOf(objList.get(0)[0]));
			userResponseBean.setBlock(String.valueOf(objList.get(0)[1]));
			userResponseBean.setPacs(String.valueOf(objList.get(0)[2]));

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return userResponseBean;
	}
	
	/**
	 * @param user id
	 * @param selfie image object
	 * @param image name
	 * This method will save the image name
	 * in the specified directory and save the 
	 * image name into database
	 */
	@Override
	public String saveProfileImage(String userId, MultipartFile profileImage, String profileImageName) {
		String status = "";
		boolean saveStatus = false;

		try {
			String fileNameWithoutExt = profileImageName.trim().substring(0, profileImageName.lastIndexOf(".")); // Extract
																													// the
																													// file
																													// name
																													// without
																													// extension
			String ext = StringUtils.getFilenameExtension(profileImageName);// Extract only extension
			profileImageName = fileNameWithoutExt + RandomDigitGenerator.numberGenerator() + "." + ext; // make a unique
																										// File name
			saveStatus = FileUploadUtil.saveFile(profileImageUploadPath, profileImageName, profileImage);

			if (saveStatus) {
				Optional<PacsInspectorDto> optionalDto = pacsInspRepo.findById(Integer.parseInt(userId));
				PacsInspectorDto existDto = optionalDto.get();
				existDto.setProfileImageName(profileImageName);
				PacsInspectorDto statusDto = pacsInspRepo.save(existDto);
				Predicate<PacsInspectorDto> checkStatus = o -> o != null;
				if (checkStatus.test(statusDto)) {
					status = "200"; // update Profile Image name
				} else {
					status = "500"; // failure
				}

			} else {
				status = "500"; // failure
			}
		} catch (IOException e) {
			// TODO: handle exception
			status = "500";
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			status = "500";
			e.printStackTrace();
		}
		return status;
	}
	
    /**
     * @param  RegistrationBean
     * This method will give List of
     * new registered pacs inspectors
     */
	@Override
	public List<RegistrationBean> fetchRegisteredPacsInspectorNew(RegistrationBean regBean) {
		List<Object[]> objList = null;
		RegistrationBean resBean = null;
		List<RegistrationBean> dataList = new ArrayList<>();
		try {

			if (!Optional.ofNullable(regBean.getDistrictId()).isPresent() || "0".equals(regBean.getDistrictId())) {
				regBean.setDistrictId("");
			}
			if (!Optional.ofNullable(regBean.getBlockId()).isPresent() || "0".equals(regBean.getBlockId())) {
				regBean.setBlockId("");
			}
			if (!Optional.ofNullable(regBean.getPacsId()).isPresent() || "0".equals(regBean.getPacsId())) {
				regBean.setPacsId("");
			}

			objList = pacsInspRepo.fetchRegisteredPacsInspector(regBean.getDistrictId(), regBean.getBlockId(),
					regBean.getPacsId(), 2);

			for (Object[] obj : objList) {
				resBean = new RegistrationBean();
				resBean.setDistrictName(String.valueOf(obj[0]));
				resBean.setBlockName(String.valueOf(obj[1]));
				resBean.setPacsName(String.valueOf(obj[2]));
				resBean.setPacsInsId(String.valueOf(obj[3]));
				resBean.setName(String.valueOf(obj[4]));
				resBean.setMobileNumber(String.valueOf(obj[5]));
				resBean.setStatus(String.valueOf(obj[6]));
				resBean.setCreatedOn(String.valueOf(obj[7]));
				dataList.add(resBean);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return dataList;
	}
	
	  /**
     * @param  RegistrationBean
     * This method will give List of
     * approved pacs inspectors
     */
	@Override
	public List<RegistrationBean> fetchRegisteredPacsInspectorApprove(RegistrationBean regBean) {
		List<Object[]> objList = null;
		RegistrationBean resBean = null;
		List<RegistrationBean> dataList = new ArrayList<>();
		try {

			if (!Optional.ofNullable(regBean.getDistrictId()).isPresent() || "0".equals(regBean.getDistrictId())) {
				regBean.setDistrictId("");
			}
			if (!Optional.ofNullable(regBean.getBlockId()).isPresent() || "0".equals(regBean.getBlockId())) {
				regBean.setBlockId("");
			}
			if (!Optional.ofNullable(regBean.getPacsId()).isPresent() || "0".equals(regBean.getPacsId())) {
				regBean.setPacsId("");
			}

			objList = pacsInspRepo.fetchRegisteredPacsInspector(regBean.getDistrictId(), regBean.getBlockId(),
					regBean.getPacsId(), 3);

			for (Object[] obj : objList) {
				resBean = new RegistrationBean();
				resBean.setDistrictName(String.valueOf(obj[0]));
				resBean.setBlockName(String.valueOf(obj[1]));
				resBean.setPacsName(String.valueOf(obj[2]));
				resBean.setPacsInsId(String.valueOf(obj[3]));
				resBean.setName(String.valueOf(obj[4]));
				resBean.setMobileNumber(String.valueOf(obj[5]));
				resBean.setStatus(String.valueOf(obj[6]));
				resBean.setCreatedOn(String.valueOf(obj[7]));
				dataList.add(resBean);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return dataList;
	}
	
	  /**
     * @param  RegistrationBean
     * This method will give List of
     * rejected pacs inspectors
     */
	@Override
	public List<RegistrationBean> fetchRegisteredPacsInspectorReject(RegistrationBean regBean) {
		List<Object[]> objList = null;
		RegistrationBean resBean = null;
		List<RegistrationBean> dataList = new ArrayList<>();
		try {

			if (!Optional.ofNullable(regBean.getDistrictId()).isPresent() || "0".equals(regBean.getDistrictId())) {
				regBean.setDistrictId("");
			}
			if (!Optional.ofNullable(regBean.getBlockId()).isPresent() || "0".equals(regBean.getBlockId())) {
				regBean.setBlockId("");
			}
			if (!Optional.ofNullable(regBean.getPacsId()).isPresent() || "0".equals(regBean.getPacsId())) {
				regBean.setPacsId("");
			}

			objList = pacsInspRepo.fetchRegisteredPacsInspector(regBean.getDistrictId(), regBean.getBlockId(),
					regBean.getPacsId(), 4);

			for (Object[] obj : objList) {
				resBean = new RegistrationBean();
				resBean.setDistrictName(String.valueOf(obj[0]));
				resBean.setBlockName(String.valueOf(obj[1]));
				resBean.setPacsName(String.valueOf(obj[2]));
				resBean.setPacsInsId(String.valueOf(obj[3]));
				resBean.setName(String.valueOf(obj[4]));
				resBean.setMobileNumber(String.valueOf(obj[5]));
				resBean.setStatus(String.valueOf(obj[6]));
				resBean.setCreatedOn(String.valueOf(obj[7]));
				dataList.add(resBean);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return dataList;
	}
	
	  /**
     * @param  RegistrationBean
     * This method will save the 
     * status(Approve/Reject) of pacs inspector
     */
	@Override
	public String actionOnPacsInspector(RegistrationBean regBean) {
		String status = "";
		int userId = 0;
		try {
			Optional<PacsInspectorDto> optionalDto = pacsInspRepo.findById(Integer.parseInt(regBean.getPacsInsId()));
			PacsInspectorDto existDto = optionalDto.get();
			existDto.setStatus(Integer.parseInt(regBean.getStatus()));
			userId = Integer.parseInt(String.valueOf(session.getAttribute("USER_ID")));
			existDto.setApprovedby(userId);
			if ("4".equals(regBean.getStatus())) {

				existDto.setRejRemark(regBean.getRejRemark());
			}
			PacsInspectorDto statusDto = pacsInspRepo.save(existDto);

			Predicate<PacsInspectorDto> checkStatus = o -> o != null;
			System.err.println("3".equals(regBean.getStatus()) && checkStatus.test(statusDto));
			if (checkStatus.test(statusDto) && "3".equals(regBean.getStatus())) {
				status = "200"; // aproved
			} else if (checkStatus.test(statusDto) && "4".equals(regBean.getStatus())) {
				status = "201"; // Rejected
			} else {
				status = "500"; // failure
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return status;
	}
	
	 /**
     * @param  mobile number
     * @param otp
     * @param device id
     * This method will save the 
     * otp and device id against the 
     * registered mobile number
     */
	@Override
	public String saveOtpMobile(String mobNum, int otp, String device_id) {
		String status = "";
		PacsInspectorDto pacsInspDto = null;

		try {

			pacsInspDto = pacsInspRepo.findByMobileAndDeletedflag(mobNum, false).get(0);
			pacsInspDto.setOtp(String.valueOf(otp));
			pacsInspDto.setDeviceId(device_id);

			pacsInspDto.setOtpgenerated_on(Timestamp.valueOf(LocalDateTime.now()));
			pacsInspDto.setOtpexpiry_on(Timestamp.valueOf(LocalDateTime.now().plusMinutes(5)));
			PacsInspectorDto responseDto = pacsInspRepo.save(pacsInspDto);
			Predicate<PacsInspectorDto> chkResponse = o -> o != null;

			if (chkResponse.test(responseDto)) {
				status = "200"; //success
			} else {
				status = "500"; //error
			}

		} catch (Exception e) {
			status = "500";
			e.printStackTrace();
		}
		return status;
	}

}
