package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.adminconsole.webportal.entity.UserType;
import com.csm.ORSAC.adminconsole.webportal.repository.UserTypeRepository;
import com.csm.ORSAC.adminconsole.webportal.service.ManageUserTypeMasterService;

@Service
public class ManageUserTypeMasterServiceImpl implements ManageUserTypeMasterService {

	@Autowired
	UserTypeRepository userTypeRepository;

	@Override
	public UserType addUserType(UserType u) {

		return userTypeRepository.save(u);
	}

	@Override
	public List<UserType> viewALlUserType() {
		return userTypeRepository.findAll();
	}

	@Override
	public UserType getUserTypeById(Integer id) {
		return userTypeRepository.getOne(id);
	}

}
