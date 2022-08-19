package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.sql.Timestamp;
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
import com.csm.ORSAC.adminconsole.webportal.bean.PrimaryLinkReqDto;
import com.csm.ORSAC.adminconsole.webportal.bean.SetPermissionReqDto;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLink;
import com.csm.ORSAC.adminconsole.webportal.entity.PrimaryLink;
import com.csm.ORSAC.adminconsole.webportal.entity.User;
import com.csm.ORSAC.adminconsole.webportal.entity.UserLinkAccess;
import com.csm.ORSAC.adminconsole.webportal.repository.AdminRoleRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.GroupLinkAccessRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.UserLinkAccessRepository;
import com.csm.ORSAC.adminconsole.webportal.service.ManageGlobalLinkService;
import com.csm.ORSAC.adminconsole.webportal.service.UserPLinkAccessService;

@Service("userPLinkAccessService")
public class ManageUserPlinkPermission implements UserPLinkAccessService {

	public static final Logger LOG = LoggerFactory.getLogger(ManageUserPlinkPermission.class);

	@Autowired
	@Qualifier("userLinkAccessRepository")
	UserLinkAccessRepository userLinkAccessRepository;

	@Autowired
	@Qualifier("groupLinkAccessRepository")
	GroupLinkAccessRepository groupLinkAccessRepository;

	@Autowired
	@Qualifier("globalLinkservice")
	ManageGlobalLinkService globalLinkService;

	@Autowired
	AdminRoleRepository adminRoleRepository;

	@Override
	public boolean addPLinkPermissions(List<UserLinkAccess> usersPermissions) {
		boolean isSaved = false;
		List<UserLinkAccess> list = null;
		try {
			list = userLinkAccessRepository.saveAll(usersPermissions);
		} catch (Exception e) {
			LOG.error("ManageUserPlinkPermission::addLinkPermissions():" + e);
		}
		if (list != null && !list.isEmpty())
			isSaved = true;
		return isSaved;
	}

	@Override
	public UserLinkAccess getAccessLinkByUserIdAndPLinkId(int userID, int primaryLinkID) {
		try {
			return userLinkAccessRepository.getAccessLinkByUserIdAndPLinkId(userID, primaryLinkID);
		} catch (Exception e) {
			LOG.error("ManageUserPlinkPermission::getAccessLinkByUserIdAndPLinkId():" + e);
		}
		return null;
	}

	@Override
	public UserLinkAccess updateAccessLink(UserLinkAccess userLinkaccess) {
		UserLinkAccess updatedUserLink = null;
		try {
			updatedUserLink = userLinkAccessRepository.saveAndFlush(userLinkaccess);
		} catch (Exception e) {
			LOG.error("ManageUserPlinkPermission::updateAccessLink():" + e);
		}
		return updatedUserLink;
	}

	@Override
	public Page<User> getPermissionAssignedUsers(Pageable pageable) {
		Page<User> listUser = null;
		try {
			listUser = userLinkAccessRepository.getPermissionAssignedUser(pageable);
		} catch (Exception e) {
			LOG.error("ManageUserPlinkPermission::getPermissionAssignedUsers():" + e);
		}
		return listUser;
	}

	@Override
	public boolean updateUserPermisson(SetPermissionReqDto setPermissionDto) {
		boolean isUpdated = false;
		try {
			int usrId = setPermissionDto.getUid();
			List<PrimaryLinkReqDto> primaryLinksdto = setPermissionDto.getPrimaryLink();
			List<UserLinkAccess> primaryLinks = new ArrayList<>();
			primaryLinks = userLinkAccessRepository.getPrimaryLinkAccessListByUserId(usrId);
			List<UserLinkAccess> newPlinks = new ArrayList<>();
			for (PrimaryLinkReqDto plinkdto : primaryLinksdto) {
				int plinkId = plinkdto.getpLinkId();
				String action = plinkdto.getAction() + "";
				UserLinkAccess linkAcc = new UserLinkAccess();
				linkAcc.setPrimaryLinkID(plinkId);
				linkAcc.setUserID(usrId);
				// for update condition
				if (primaryLinks.contains(linkAcc)) {
					int index = primaryLinks.indexOf(linkAcc);
					primaryLinks.get(index).setAction(action);
					primaryLinks.get(index).setUpdateBy(8); // putting default admin user id.
					primaryLinks.get(index).setUpdateOn(new Timestamp(new java.util.Date().getTime()));
					primaryLinks.get(index).setStatus(false);
					isUpdated = true;
				} else
				// for insert condition
				{
					linkAcc.setUserID(usrId);
					linkAcc.setCreatedBy(8); // putting default admin user id.
					linkAcc.setCreateOn(new Timestamp(new java.util.Date().getTime()));
					linkAcc.setAction(action);
					linkAcc.setUpdateBy(8); // putting default admin user id.
					linkAcc.setUpdateOn(new Timestamp(new java.util.Date().getTime()));
					linkAcc.setStatus(false);
					newPlinks.add(linkAcc);
				}
			}
			if (!newPlinks.isEmpty()) {
				List<UserLinkAccess> newRec = userLinkAccessRepository.saveAll(newPlinks);
				if (!newRec.isEmpty() && newRec.size() > 0)
					isUpdated = true;
			}
			userLinkAccessRepository.flush();
			/* filter unchecked primary link ids to change status */
			List<Integer> plinkIds = primaryLinks.stream().map(p -> p.getPrimaryLinkID()).collect(Collectors.toList()); // Existing
																														// primary
																														// links
																														// id.
			List<Integer> plinkIdsDto = primaryLinksdto.stream().map(pdto -> pdto.getpLinkId())
					.collect(Collectors.toList()); // requested primary links id.
			if (plinkIdsDto != null)
				plinkIds.removeAll(plinkIdsDto);

			/* deactive unchecked primary links */
			primaryLinks = primaryLinks.stream().filter(p -> plinkIds.contains(p.getPrimaryLinkID()))
					.collect(Collectors.toList());
			for (UserLinkAccess userLink : primaryLinks) {
				
				userLink.setStatus(true);
			}
			userLinkAccessRepository.flush();

		} catch (Exception e) {
			LOG.error("ManageUserPlinkPermission::updateUserPermission():" + e);
		}
		return isUpdated;
	}

	public List<UpdatePermissionResponseDto> editGroupPermission(int groupID) {
		List<UpdatePermissionResponseDto> res = new ArrayList<>();
		try {
			/* result map */
			Map<Integer, UpdatePermissionResponseDto> result = new LinkedHashMap<>();
			/* global list and primary list map */
			List<GlobalLink> globalLinkMapPlnk = globalLinkService.getGlobalLinkMapPrimaryLink();

			/* list allowed links */
			List<GlobalLinkResponseDto> userPermissions = new ArrayList<>();
			/* allowed links per role from "m_adm_grouplink_access" */
			Object[] userPlinks = groupLinkAccessRepository.getGroupLinkAccessByGroupId(groupID);
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
				// add to list
				userPermissions.add(glresDto);
			}
			/* iterating allowed links list */
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
				// if global link already assigned to group.
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
							PrimaryLink plink = plinks.stream().filter(p -> p.getPrimaryLinkId() == id)
									.collect(Collectors.toList()).get(0);
							pobj.setPrimaryLinkName(plink.getPrimaryLinkName());
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
				} else {// if global link not assigned to group.
					UpdatePermissionResponseDto newResDto = new UpdatePermissionResponseDto();
					newResDto.setGlobalLinkId(globaLink.getGlobalLinkId());
					newResDto.setGlobalLinkName(globaLink.getGlobalLinkName());
					Set<PrimaryLink> primaryLinks = globaLink.getPrimarylinks();
					Set<PrimaryLinkResponseDto> primaryLinksDto = primaryLinks.stream()
							.map(plink -> new PrimaryLinkResponseDto(plink.getPrimaryLinkId(),
									plink.getPrimaryLinkName(), plink.getBitStatus()))
							.collect(Collectors.toSet());
					newResDto.setPrimarylinks(primaryLinksDto);
					res.add(newResDto);
				}
			}
			LOG.info("ManageUserPlinkPermission::Pemission list : " + res);
		} catch (Exception e) {
			LOG.error("ManageUserPlinkPermission::editGroupPermission():" + e);
		}
		// sort global link.
		Collections.sort(res);

		return res;
	}

}
