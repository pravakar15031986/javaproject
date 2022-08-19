package com.csm.ORSAC.adminconsole.webportal.service;

import java.util.List;

import com.csm.ORSAC.adminconsole.webportal.entity.UserType;

public interface ManageUserTypeMasterService {

	UserType addUserType(UserType u);

	List<UserType> viewALlUserType();

	UserType getUserTypeById(Integer id);

}
