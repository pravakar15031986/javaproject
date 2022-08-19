package com.csm.ORSAC.adminconsole.webportal.service;

import java.util.List;

import com.csm.ORSAC.adminconsole.webportal.bean.DesignationBean;
import com.csm.ORSAC.adminconsole.webportal.entity.Designation;

public interface ManageDesignationMasterService {

	String addDesignation(DesignationBean des);

	List<Designation> viewALlDesignation();

	Designation getDesignationById(Integer id);

	List<Designation> viewAllActiveDesignations();

}
