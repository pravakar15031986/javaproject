package com.csm.ORSAC.adminconsole.webportal.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csm.ORSAC.adminconsole.responsedto.UpdatePermissionResponseDto;
import com.csm.ORSAC.adminconsole.webportal.api.ApiUrl;
import com.csm.ORSAC.adminconsole.webportal.bean.PrimaryLinkReqDto;
import com.csm.ORSAC.adminconsole.webportal.bean.SetPermissionReqDto;
import com.csm.ORSAC.adminconsole.webportal.bean.User;
import com.csm.ORSAC.adminconsole.webportal.bean.UserSearchReqDto;
import com.csm.ORSAC.adminconsole.webportal.entity.UserLinkAccess;
import com.csm.ORSAC.adminconsole.webportal.response.RestResponse;
import com.csm.ORSAC.adminconsole.webportal.service.GroupLinkAccessService;
import com.csm.ORSAC.adminconsole.webportal.service.ManageAdminRoleService;
import com.csm.ORSAC.adminconsole.webportal.service.ManageGlobalLinkService;
import com.csm.ORSAC.adminconsole.webportal.service.ManagePrimaryLinkService;
import com.csm.ORSAC.adminconsole.webportal.service.ManageUserMasterService;
import com.csm.ORSAC.adminconsole.webportal.service.UserPLinkAccessService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;
import com.csm.ORSAC.adminconsole.webportal.util.Pagination;
import com.csm.ORSAC.webportal.service.QueryBuilderLogService;
import com.csm.ORSAC.webportal.util.OrsacQueryBuilder;

@Controller
public class AdminUserController extends OrsacPortalAbstractController {

	public static final Logger LOG = LoggerFactory.getLogger(AdminUserController.class);

	@Autowired
	@Qualifier("userPLinkAccessService")
	UserPLinkAccessService userPLinkAccessService;

	@Autowired
	@Qualifier("userMasterService")
	ManageUserMasterService userMasterService;

	@Autowired
	@Qualifier("adminRoleService")
	ManageAdminRoleService adminRoleService;

	@Autowired
	@Qualifier("globalLinkservice")
	ManageGlobalLinkService globalLinkService;

	@Autowired
	@Qualifier("primaryLinkservice")
	ManagePrimaryLinkService managePrimaryLinkService;

	@Autowired
	@Qualifier("groupLinkAccessService")
	GroupLinkAccessService groupLinkAccessService;
	
	@Autowired
	QueryBuilderLogService qbLogService;

	@GetMapping(value = ApiUrl.AdminUser.ADD_PERMISSION)
	public String addUserPermission(Model model) {
		try {

			List<com.csm.ORSAC.adminconsole.webportal.entity.User> list = userMasterService
					.getUnassignedPrimaryLinkUserList();
			model.addAttribute(OrsacPortalConstant.USERS, list);

			List<com.csm.ORSAC.adminconsole.webportal.entity.GlobalLink> globalList = globalLinkService
					.getGlobalLinkMapPrimaryLink();
			model.addAttribute("globalinkList", globalList);

			List<com.csm.ORSAC.adminconsole.webportal.entity.AdminRole> newRoles = adminRoleService.getNewAdmRoles();
			model.addAttribute("groupList", newRoles);

			

		} catch (Exception e) {
			LOG.error("AdminUserController::addUserPermission():" + e);
		}
		return "addUserPermission";
	}

	@RequestMapping(value = ApiUrl.AdminUser.SET_PERMISSION_TO_USER, method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	@ResponseBody
	public RestResponse setPermission(@RequestBody SetPermissionReqDto permissionDto, Model model) {
		
		RestResponse<String> response = new RestResponse<>();
		try {

			List<Integer> userIds = permissionDto.getUserId();
			List<PrimaryLinkReqDto> plinkDtos = permissionDto.getPrimaryLink();
			List<UserLinkAccess> plinks = new ArrayList<>();
			List<UserLinkAccess> insertPlinks = new ArrayList<>();

			for (Integer userId : userIds) {
				for (PrimaryLinkReqDto plinkdto : plinkDtos) {
					UserLinkAccess plinkAcc = new UserLinkAccess();
					if (plinkdto != null) {
						plinkAcc.setPrimaryLinkID(plinkdto.getpLinkId());
						plinkAcc.setAction(plinkdto.getAction() + "");
						plinkAcc.setUserID(userId);
						plinkAcc.setCreateOn(new Timestamp(new Date().getTime()));
						plinkAcc.setCreatedBy(8); // setting default create user
						plinkAcc.setUpdateBy(8);
						plinkAcc.setUpdateOn(new Timestamp(new Date().getTime()));
						plinks.add(plinkAcc);
					}
				}
			}

			boolean isUpdated = false;
			for (UserLinkAccess plink : plinks) {
				UserLinkAccess userLinkaccess = userPLinkAccessService
						.getAccessLinkByUserIdAndPLinkId(plink.getUserID(), plink.getPrimaryLinkID());
				if (userLinkaccess != null) {
					userLinkaccess.setAction(plink.getAction());
					userLinkaccess.setUpdateOn(new Timestamp(new Date().getTime()));
					userLinkaccess.setStatus(false);
					userLinkaccess.setUpdateBy(8); // setting default create user
					userLinkaccess = userPLinkAccessService.updateAccessLink(userLinkaccess);
					if (userLinkaccess != null)
						isUpdated = true;
				} else {
					insertPlinks.add(plink);
				}
			}
			boolean isSaved = userPLinkAccessService.addPLinkPermissions(insertPlinks);
			if (isSaved || isUpdated) {
				response.setData("Success");
			} else {
				
			}

			
		} catch (Exception e) {
			LOG.error("AdminUserController::setPermission():" + e);
		}
		return response;
	}

	@RequestMapping(value = ApiUrl.AdminUser.GET_PERMISSION_ASSIGNED_USERS, method = RequestMethod.GET)
	public String getPermissionAssignedUsers(Model model) {
		try {

			Pagination pagination = new Pagination();
			pagination.setSortOrder("asc");
			pagination.setSize(100);
			List<String> properties = new ArrayList<>();
			
			properties.add("fullName");
			pagination.setSortProperties(properties);
			Page<com.csm.ORSAC.adminconsole.webportal.entity.User> userList = userPLinkAccessService
					.getPermissionAssignedUsers(pagination.getPageable());
			properties.clear();
			properties.add("aliasName");
			pagination.setSortProperties(properties);
			Page<com.csm.ORSAC.adminconsole.webportal.entity.AdminRole> groupList = adminRoleService
					.getAdmRoles(pagination.getPageable());
			Map<String, Object> map = new HashMap<>();
			if (userList != null && userList.getContent() != null) {

				map.put(OrsacPortalConstant.USERS, userList.getContent());
				map.put("currentPage1", userList.getNumber());
				map.put("total1", userList.getTotalPages());
			} else {
				map.put(OrsacPortalConstant.USERS, new ArrayList<User>());
				map.put("currentPage1", 0);
				map.put("total1", 0);
			}

			map.put("groupList", groupList.getContent());
			map.put("currentPage2", groupList.getNumber());
			map.put("total2", groupList.getTotalPages());

			
			map.put("groups", groupList.getContent());
			
			model.addAttribute(OrsacPortalConstant.DATA, map);
		} catch (Exception e) {
			LOG.error("AdminUserController::getPermissionAssignedUsers():" + e);
		}
		return "viewUsers";
	}

	@RequestMapping(value = ApiUrl.AdminUser.GET_GROUPS, method = RequestMethod.POST)
	@ResponseBody
	public RestResponse<List<com.csm.ORSAC.adminconsole.webportal.entity.AdminRole>> getGroups(
			@RequestBody Pagination pagination, Model model) {
		RestResponse<List<com.csm.ORSAC.adminconsole.webportal.entity.AdminRole>> responsedata = new RestResponse();
		try {

			List<String> properties = new ArrayList<>();
			properties.add("aliasName");
			pagination.setSortProperties(properties);
			pagination.setSortOrder("asc");

			Page<com.csm.ORSAC.adminconsole.webportal.entity.AdminRole> adm_roles = adminRoleService
					.getAdmRoles(pagination.getPageable());

			responsedata.setCurrentPage(adm_roles.getNumber());
			responsedata.setData(adm_roles.getContent());
			responsedata.setResultCode("200");
			responsedata.setTotal(adm_roles.getTotalPages());

		} catch (Exception e) {
			LOG.error("AdminUserController::getGroups():" + e);
		}
		return responsedata;
	}

	@RequestMapping(value = ApiUrl.AdminUser.GET_USERS, method = RequestMethod.POST)
	@ResponseBody
	public RestResponse<List<com.csm.ORSAC.adminconsole.webportal.entity.User>> getUsers(@RequestBody Pagination pagination,
			Model model) {
		RestResponse<List<com.csm.ORSAC.adminconsole.webportal.entity.User>> responsedata = new RestResponse();
		try {

			Page<com.csm.ORSAC.adminconsole.webportal.entity.User> users = userMasterService
					.getPermissionAssignedUserList(pagination.getPageable());
			responsedata.setTotal(users.getTotalPages());
			responsedata.setCurrentPage(users.getNumber());
			responsedata.setData(users.getContent());

		} catch (Exception e) {
			LOG.error("AdminUserController::getUsers():" + e);
		}
		return responsedata;
	}

	@RequestMapping(value = ApiUrl.AdminUser.EDIT_USER_PERMISSION, method = RequestMethod.POST)
	public String editUserPermission(@ModelAttribute UserSearchReqDto userReqDto, Model model) {

		try {

			List<UpdatePermissionResponseDto> users = userMasterService
					.getUserLinksAccessByUserId(userReqDto.getUserId());
			Map<String, Object> map = new HashMap<>();
			map.put("userName", userReqDto.getName());
			map.put("userid", userReqDto.getUserId());
			map.put("permissions", users);
			model.addAttribute(OrsacPortalConstant.DATA, map);
		} catch (Exception e) {
			LOG.error("AdminUserController::editUserPermission():" + e);
		}
		return "editUserPermission";
	}

	@RequestMapping(value = ApiUrl.AdminUser.UPDATE_USER_PERMISSION, method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	@ResponseBody
	public RestResponse<String> updateUserPermission(@RequestBody SetPermissionReqDto setPermissionDto, Model model) {

		
		RestResponse<String> response = new RestResponse<>();
		try {

			boolean isupdated = userPLinkAccessService.updateUserPermisson(setPermissionDto);
			if (isupdated) {
				response.setData("Success");
				response.setStatus("SUCCESS");
			}

			

		} catch (Exception e) {
			LOG.error("AdminUserController::updateUserPermission():" + e);
		}
		return response;
	}

	@RequestMapping(value = ApiUrl.AdminUser.EDIT_GROUP_PERMISSION, method = RequestMethod.POST)
	public String editGroupPermission(@ModelAttribute UserSearchReqDto userReqDto, Model model) {

		try {

			List<UpdatePermissionResponseDto> permissions = userPLinkAccessService
					.editGroupPermission(userReqDto.getGroupId());
			Map<String, Object> map = new HashMap<>();
			map.put("groupName", userReqDto.getName());
			map.put("groupId", userReqDto.getGroupId());
			map.put("permissions", permissions);

			model.addAttribute(OrsacPortalConstant.DATA, map);
		} catch (Exception e) {
			LOG.error("AdminUserController::editGroupPermission():" + e);
		}
		return "editGroupPermission";
	}

	@RequestMapping(value = ApiUrl.AdminUser.UPDATE_GROUP_PERMISSION, method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	@ResponseBody
	public RestResponse<String> updateGroupPermission(@RequestBody SetPermissionReqDto setPermissionDto, Model model) {

		RestResponse<String> response = new RestResponse<>();
		try {

			boolean isupdated = groupLinkAccessService.updateGroupLinkAccess(setPermissionDto);
			if (isupdated) {
				response.setData("Success");
				response.setStatus("SUCCESS");

			}
		} catch (Exception e) {
			LOG.error("AdminUserController::updateGroupPermission():" + e);
		}
		return response;
	}

	@RequestMapping(value = "/searchUser", method = RequestMethod.POST)
	public @ResponseBody RestResponse<List<com.csm.ORSAC.adminconsole.webportal.entity.User>> searchUsers(
			@RequestBody UserSearchReqDto searchReqdto) {
		RestResponse<List<com.csm.ORSAC.adminconsole.webportal.entity.User>> response = new RestResponse<>();
		try {
			Pagination pagination = null;
			Pageable pageable = null;
			com.csm.ORSAC.adminconsole.webportal.entity.User usr = new com.csm.ORSAC.adminconsole.webportal.entity.User();
			usr.setFullName(searchReqdto.getName());
			usr.setGroupId(searchReqdto.getGroupId());
			Page<com.csm.ORSAC.adminconsole.webportal.entity.User> users = null;
			if (searchReqdto.getPagination() == null) {
				List<String> properties = new ArrayList<>();
				properties.add("fullName");
				pagination = new Pagination();
				pagination.setSortProperties(properties);
				pagination.setSortOrder("asc");
				pageable = pagination.getPageable();
			} else {
				pageable = searchReqdto.getPagination().getPageable();
			}
			users = userMasterService.getSearchUsers(usr, pageable);
			response.setTotal(users.getTotalPages());
			response.setCurrentPage(users.getNumber());
			response.setData(users.getContent());

		} catch (Exception e) {
			LOG.error("AdminUserController::searchUsers():" + e);
		}
		return response;
	}
	
	@RequestMapping(value = "/manageQueryBuilder", method = RequestMethod.GET)
	public String getQueryBuilder(Model model) {
		model.addAttribute("query", "");
		return OrsacPortalConstant.QUERY_BUILDER;
	}

	@Autowired
	OrsacQueryBuilder queryBuilder;

	@RequestMapping(value = "/manageQueryBuilder", method = RequestMethod.POST)
	public String queryBuilderPost(@RequestParam("query") String query, @RequestParam("password") String rawPassword,
			Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String ipaddress = request.getParameter("ipaddress");
		int userId = (Integer) session.getAttribute(OrsacPortalConstant.USER_ID);//

		try {
			if (rawPassword == null || rawPassword.isEmpty()) {
				return OrsacPortalConstant.QUERY_BUILDER;
			}
			if (query == null || query.isEmpty()) {
				return OrsacPortalConstant.QUERY_BUILDER;
			}
			//qbLogService.addQueryBuilderLog(query, ipaddress, userId);
			queryBuilder.queryBuilder(query, model, rawPassword);
			model.addAttribute("query", query);
		} catch (Exception e) {

			LOG.error("AdminUserController::queryBuilderPost():" + e);

		}
		return OrsacPortalConstant.QUERY_BUILDER;
	}

}
