package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.adminconsole.responsedto.GlobalLinkResponseDto;
import com.csm.ORSAC.adminconsole.responsedto.PrimaryLinkResponseDto;
import com.csm.ORSAC.adminconsole.responsedto.UpdatePermissionResponseDto;
import com.csm.ORSAC.adminconsole.webportal.entity.AdminRole;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLink;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLinkAccess;
import com.csm.ORSAC.adminconsole.webportal.entity.PrimaryLink;
import com.csm.ORSAC.adminconsole.webportal.entity.User;
import com.csm.ORSAC.adminconsole.webportal.entity.UserLinkAccess;
import com.csm.ORSAC.adminconsole.webportal.repository.AdminRoleRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.UserLinkAccessRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.UserRepository;
import com.csm.ORSAC.adminconsole.webportal.service.ManageGlobalLinkService;
import com.csm.ORSAC.adminconsole.webportal.service.ManageUserMasterService;

@Service("userMasterService")
public class ManageUserMasterServiceImpl implements ManageUserMasterService {

	public static final Logger LOG = LoggerFactory.getLogger(ManageUserMasterServiceImpl.class);

	@Autowired
	@Qualifier("userRepository")
	private UserRepository userRepository;

	@Autowired
	@Qualifier("userLinkAccessRepository")
	private UserLinkAccessRepository userLinkAccessRepository;

	@Autowired
	@Qualifier("adminRoleRepository")
	private AdminRoleRepository adminRoleRepository;

	@Autowired
	@Qualifier("globalLinkservice")
	ManageGlobalLinkService globalLinkService;

	public List<User> getUserList() {
		List<User> userList = new ArrayList<>();
	
		try {
			userList = userRepository.getUserList(); // Retrieve User list from Data Base using HQL
			LOG.info("ManageUserMasterServiceImpl::userList============" + userList);
		} catch (Exception e) {
			LOG.error("ManageUserMasterServiceImpl::getUserList():" + e);
		}
		return userList;
	}

	@Override
	public List<GlobalLink> getglobalList() {
		List<GlobalLink> globalList = new ArrayList<>();
	
		try {
			
		} catch (Exception e) {
			LOG.error("ManageUserMasterServiceImpl::getglobalList():" + e);
		}
		return globalList;
	}

	@Override
	public List<User> getUnassignedPrimaryLinkUserList() {
		List<User> listUser = new ArrayList<>();
		try {
			Object[] usrs = userRepository.getUnassignedPrimryLinkUserList();
			for (int i = 0; i < usrs.length; i++) {
				Object[] arr = (Object[]) usrs[i];
				int userId = (Integer) arr[0];
				String userName = (String) arr[1];
				String fullName = (String) arr[2];
				User usr = new User(userId, userName, fullName);
				listUser.add(usr);
			}

			LOG.info("ManageUserMasterServiceImpl::Unassigned user list." + listUser);
		} catch (Exception e) {
			LOG.error("ManageUserMasterServiceImpl::getUnassignedPrimaryLinkUserList():" + e);
		}
		return listUser;
	}

	@Override
	public List<AdminRole> viewPermissions() {
		List<AdminRole> roleList = null;
		try {
			roleList = adminRoleRepository.findAll();
			LOG.info("ManageUserMasterServiceImpl::" + roleList);
		} catch (Exception e) {
			LOG.error("ManageUserMasterServiceImpl::viewPermissions():" + e);

		}
		return roleList;
	}

	@Override
	public Page<User> getPermissionAssignedUserList(Pageable pageable) {
		Page<User> users = null;
		try {
			users = userRepository.getPermissionAssignedUserList(pageable);
		} catch (Exception e) {
			LOG.error("ManageUserMasterServiceImpl::getPermissionAssignedUserList():" + e);

		}
		return users;
	}

	@Override
	public Page<User> getSearchUsers(User usr, Pageable pageable) {
		Page<User> users = null;
		try {
			if (usr.getFullName() != null && !usr.getFullName().isEmpty())
				users = userRepository.searchuserByName(usr.getFullName().toLowerCase(), pageable);

			else if (usr.getGroupId() > 0)
				users = userRepository.searchuserByGroupId(usr.getGroupId(), pageable);
			else
				users = userRepository.findAll(pageable);
		} catch (Exception e) {
			LOG.error("ManageUserMasterServiceImpl::getSearchUsers():" + e);

		}
		return users;
	}

	@Override
	public List<UpdatePermissionResponseDto> getUserLinksAccessByUserId(int userId) {
		List<UpdatePermissionResponseDto> res = new ArrayList<>();
		LOG.info("ManageUserMasterServiceImpl::Fetching user details by user id :: >>>>> " + userId);
		try {
			// Global link primary link map.
			List<GlobalLink> globalLinkMapPlnk = globalLinkService.getGlobalLinkMapPrimaryLink();

			Map<Integer, UpdatePermissionResponseDto> result = new LinkedHashMap<>();
			List<GlobalLinkResponseDto> userPermissions = new ArrayList<>();
	
			Object[] userPlinks = userLinkAccessRepository.getLinksAccessPermissionByUserId(userId);
			for (Object list : userPlinks) {
				Object[] list1 = (Object[]) list;
				int globalLinkId = (Integer) list1[0];
				String globalLinkName = (String) list1[1];
				int primaryLinkId = (Integer) list1[2];
				String primaryLinkName = (String) list1[3];
				String action = (String) list1[4];

				GlobalLinkResponseDto glresDto = new GlobalLinkResponseDto();
				glresDto.setGlobalLinkId(globalLinkId);
				glresDto.setGlobalLinkName(globalLinkName);
				glresDto.setpLinkId(primaryLinkId);
				glresDto.setPrimaryLinkName(primaryLinkName);
				glresDto.setAction(action);
				userPermissions.add(glresDto);
			}
			/* converting List<> to "result" Map<> */
			for (GlobalLinkResponseDto resdto : userPermissions) {
				Integer globalLnId = resdto.getGlobalLinkId();
				if (result.containsKey(globalLnId)) {
					UpdatePermissionResponseDto glnk = result.get(globalLnId);
					PrimaryLinkResponseDto plnk = new PrimaryLinkResponseDto();
					plnk.setpLinkId(resdto.getpLinkId());
					plnk.setPrimaryLinkName(resdto.getPrimaryLinkName());
					plnk.setAction(resdto.getAction());
					glnk.getPrimarylinks().add(plnk);
				} else if (!result.containsKey(globalLnId)) {
					UpdatePermissionResponseDto glnkdto = new UpdatePermissionResponseDto();
					glnkdto.setGlobalLinkId(globalLnId);
					glnkdto.setGlobalLinkName(resdto.getGlobalLinkName());
					Set<PrimaryLinkResponseDto> plnks = new LinkedHashSet<>();
					PrimaryLinkResponseDto plnk = new PrimaryLinkResponseDto();
					plnk.setpLinkId(resdto.getpLinkId());
					plnk.setPrimaryLinkName(resdto.getPrimaryLinkName());
					plnk.setAction(resdto.getAction());
					plnks.add(plnk);
					glnkdto.setPrimarylinks(plnks);
					result.put(globalLnId, glnkdto);
				}
			}
			// adding user permissions from access per user
			res.addAll(result.values());
			for (GlobalLink globaLink : globalLinkMapPlnk) {
				int glinkId = globaLink.getGlobalLinkId();
				/* exist global links. */
				UpdatePermissionResponseDto existDtoGlink = null; 
				/* check if global link already exist or not. */
				List<UpdatePermissionResponseDto> li = res.stream().filter(r -> r.getGlobalLinkId() == glinkId)
						.collect(Collectors.toList());
				if (li != null && !li.isEmpty())
					existDtoGlink = li.get(0);
				if (existDtoGlink != null) {
					Set<PrimaryLink> plinks = globaLink.getPrimarylinks();
					Set<PrimaryLinkResponseDto> existDtoplinks = existDtoGlink.getPrimarylinks();
					List<Integer> dtoPlinkIds = existDtoplinks.stream()
							.map(dtoLink -> new Integer(dtoLink.getpLinkId())).collect(Collectors.toList());
					List<Integer> plinkIds = plinks.stream().map(plink -> new Integer(plink.getPrimaryLinkId()))
							.collect(Collectors.toList());
					/* eliminate exist primary link id from plinkIds */
					plinkIds.removeAll(dtoPlinkIds);

					if (!plinkIds.isEmpty()) {
						UpdatePermissionResponseDto obj = new UpdatePermissionResponseDto();
						obj.setGlobalLinkId(glinkId);
						obj.setGlobalLinkName(globaLink.getGlobalLinkName());
						Set<PrimaryLinkResponseDto> primarylinks = new LinkedHashSet<>();
						for (Integer id : plinkIds) {
							PrimaryLinkResponseDto pobj = new PrimaryLinkResponseDto();
							pobj.setpLinkId(id);
							/* filter Primary link matching "id" */
							PrimaryLink plink = plinks.stream().filter(p -> p.getPrimaryLinkId() == id)
									.collect(Collectors.toList()).get(0);
							pobj.setPrimaryLinkName(plink.getPrimaryLinkName());
							pobj.setIntSlNo(plink.getSlNo());
							primarylinks.add(pobj);
						}
						obj.setPrimarylinks(primarylinks);
						// add global list to response dto.
						if (res.contains(obj)) {
							int index = res.indexOf(obj);
							UpdatePermissionResponseDto obj1 = res.get(index);
							primarylinks.addAll(obj1.getPrimarylinks());
							obj1.setPrimarylinks(primarylinks);
							res.remove(index);
							res.add(obj1);
						}
					}
				} else {
					UpdatePermissionResponseDto newResDto = new UpdatePermissionResponseDto();
					newResDto.setGlobalLinkId(globaLink.getGlobalLinkId());
					newResDto.setGlobalLinkName(globaLink.getGlobalLinkName());
					Set<PrimaryLink> primaryLinks = globaLink.getPrimarylinks();
					Set<PrimaryLinkResponseDto> primaryLinksDto = primaryLinks.stream().map(
							plink -> new PrimaryLinkResponseDto(plink.getPrimaryLinkId(), plink.getPrimaryLinkName()))
							.collect(Collectors.toSet());
					newResDto.setPrimarylinks(primaryLinksDto);
					res.add(newResDto);
				}
			}
			LOG.info("ManageUserMasterServiceImpl::Pemission list :: " + res);
		} catch (Exception e) {
			LOG.error("ManageUserMasterServiceImpl::getUserLinksAccessByUserId():" + e);
		}
		// sorting primary links
		
		Collections.sort(res);
		return res;
	}

	@Override
	public String getUserPrimaryLnkActionByUsrIdAndPlnkId(int userId, int getpLinkId) {
		try {
			GlobalLinkAccess gblnkacc = null;
			UserLinkAccess userLnkaccess = userLinkAccessRepository.getAccessLinkByUserIdAndPLinkId(userId, getpLinkId);
			if (userLnkaccess != null)
				return userLnkaccess.getAction();
			if (userLnkaccess == null)
				gblnkacc = userLinkAccessRepository.getGroupLinkAccessByUserIdAndPlnkId(userId, getpLinkId);
			if (gblnkacc != null)
				return gblnkacc.getAction();
		} catch (Exception e) {
			LOG.error("ManageUserMasterServiceImpl::getUserPrimaryLnkActionByUsrIdAndPlnkId():" + e);
		}

		return null;
	}

}
