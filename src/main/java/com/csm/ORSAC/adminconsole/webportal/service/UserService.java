package com.csm.ORSAC.adminconsole.webportal.service;

import java.util.List;

import org.json.JSONArray;
import org.springframework.data.domain.Pageable;

import com.csm.ORSAC.adminconsole.webportal.bean.UserRoleDto;
import com.csm.ORSAC.adminconsole.webportal.entity.AdmLevelDetails;
import com.csm.ORSAC.adminconsole.webportal.entity.User;
import com.csm.ORSAC.adminconsole.webportal.entity.UserResearchCenterMapping;
import com.csm.ORSAC.webportal.bean.UserBean;

public interface UserService {

	User saveUser(User u);

	User getUserById(Integer userId);

	List<User> viewUserList();

	boolean isEmailExist(String email);

	List<UserBean> viewAllUserByPage(String mobileNo, String email, String name, String oname, String role,
			String center, String desig, String status);

	String searchUserByAjax(Integer pageSize, Integer pageNumber, Pageable pageable, String fullName, Integer orgName,
			String mobile, String email, Boolean status, Integer intdesigid); // ,Integer roleVal

	String saveUserMaster(UserBean user);

	List<UserRoleDto> getAllRoleIds(UserRoleDto udto);

	boolean isMobileNoExist(String MobileNo);

	Integer existEmail(String email, int userId);

	Integer existMobileNo(String mobile, int userId);

	List<AdmLevelDetails> getOrganizationList();

	UserResearchCenterMapping getUserResearchCenterMapping(Integer userId);

	List<User> getUsersByOrganizationId(Integer userId, Integer orgId);

	String getUserByRoleAndOrgId(int roleId, int intLevelDetailId);

	List<UserBean> viewUserDetails(int start, int len);

	Integer viewUserDetailsCount();

	List<UserBean> viewUserSearch(int start, int len, String email);

	String unlockUserMaster(UserBean userBean);

	String getNotificationUserByRoleAndOrgId(int roleId, int intLevelDetailId, int rcId, int userId);

	List<UserBean> viewUserDataPagination(String mobile, String email, String fullName, String organizationId,
			String roleId, String researchCenterId, String intdesigid, String status, Integer pstart, Integer plength);

	Integer viewUserDataPaginationCount(String mobile, String email, String fullName, String organizationId,
			String roleId, String researchCenterId, String intdesigid, String status, Integer pstart, Integer plength);

	//password reset
	String resetPassword(UserBean userBean);

	JSONArray getUserRolesByUserId(int userId);

}
