package com.csm.ORSAC.adminconsole.webportal.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.csm.ORSAC.adminconsole.responsedto.UpdatePermissionResponseDto;
import com.csm.ORSAC.adminconsole.webportal.bean.SetPermissionReqDto;
import com.csm.ORSAC.adminconsole.webportal.entity.User;
import com.csm.ORSAC.adminconsole.webportal.entity.UserLinkAccess;

public interface UserPLinkAccessService {

	public boolean addPLinkPermissions(List<UserLinkAccess> usersPermissions);

	public UserLinkAccess getAccessLinkByUserIdAndPLinkId(int userID, int primaryLinkID);

	public UserLinkAccess updateAccessLink(UserLinkAccess userLinkaccess);

	public Page<User> getPermissionAssignedUsers(Pageable pageable);

	public boolean updateUserPermisson(SetPermissionReqDto setPermissionDto);

	public List<UpdatePermissionResponseDto> editGroupPermission(int userID);

}
