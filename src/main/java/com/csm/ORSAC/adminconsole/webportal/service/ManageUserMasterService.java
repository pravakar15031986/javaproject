package com.csm.ORSAC.adminconsole.webportal.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.csm.ORSAC.adminconsole.responsedto.UpdatePermissionResponseDto;
import com.csm.ORSAC.adminconsole.webportal.entity.AdminRole;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLink;
import com.csm.ORSAC.adminconsole.webportal.entity.User;

public interface ManageUserMasterService {

	List<User> getUserList();

	List<GlobalLink> getglobalList();

	List<User> getUnassignedPrimaryLinkUserList();

	List<AdminRole> viewPermissions();

	Page<User> getPermissionAssignedUserList(Pageable pageable);

	Page<User> getSearchUsers(User usr, Pageable pageable);

	List<UpdatePermissionResponseDto> getUserLinksAccessByUserId(int userId);

	String getUserPrimaryLnkActionByUsrIdAndPlnkId(int userId, int getpLinkId);

}
