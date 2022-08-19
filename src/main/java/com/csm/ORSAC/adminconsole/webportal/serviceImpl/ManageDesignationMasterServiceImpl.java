package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.csm.ORSAC.adminconsole.webportal.bean.DesignationBean;
import com.csm.ORSAC.adminconsole.webportal.entity.Designation;
import com.csm.ORSAC.adminconsole.webportal.entity.User;
import com.csm.ORSAC.adminconsole.webportal.repository.ManageDesignationMasterRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.UserRepository;
import com.csm.ORSAC.adminconsole.webportal.service.ManageDesignationMasterService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Component
//@Service
public class ManageDesignationMasterServiceImpl implements ManageDesignationMasterService {

	public static final Logger LOG = LoggerFactory.getLogger(ManageDesignationMasterServiceImpl.class);

	@Autowired
	ManageDesignationMasterRepository manageDesignationMasterRepository;
	@Autowired
	UserRepository userRepository;

	@Transactional
	@Override
	public String addDesignation(DesignationBean des) {
		String result = "";
		Designation desigObj = new Designation();
		try {

			if (des.getId() == null) {
				List<Object[]> desName = manageDesignationMasterRepository.getDesName(des.getDesignation());
				if (!desName.isEmpty()) {
					return OrsacPortalConstant.EXIST;
				}
				desigObj.setDesignation(des.getDesignation());
				desigObj.setDescription(des.getDescription());
				desigObj.setStatus(Boolean.valueOf(des.getStatus()));
				desigObj.setUserTypeId(0);
				manageDesignationMasterRepository.saveAndFlush(desigObj);
				result = OrsacPortalConstant.SUCCESS;

			} else {
				List<Object[]> desName = manageDesignationMasterRepository.getDesName(des.getId(),
						des.getDesignation());
				if (!desName.isEmpty()) {
					return OrsacPortalConstant.EXIST;
				}
				Designation exitid = manageDesignationMasterRepository.findByDesignationId(des.getId());
				if (exitid != null) {
					List<User> list = userRepository.findIntdesigidByIntdesigid(des.getId());
					if (des.getStatus() == "false") {
						exitid.setDesignation(des.getDesignation());
						exitid.setDescription(des.getDescription());
						exitid.setStatus(Boolean.valueOf(des.getStatus()));
						manageDesignationMasterRepository.saveAndFlush(exitid);
						result = OrsacPortalConstant.UPDATE;
					} else {
						if (list.isEmpty()) {
							exitid.setDesignation(des.getDesignation());
							exitid.setDescription(des.getDescription());
							exitid.setStatus(Boolean.valueOf(des.getStatus()));
							manageDesignationMasterRepository.saveAndFlush(exitid);
							result = OrsacPortalConstant.UPDATE;
						} else {
							return OrsacPortalConstant.DEPENDENT;
						}
					}

				}

			}

		} catch (Exception e) {
			result = OrsacPortalConstant.FAILURE;
			LOG.error("ManageDesignationMasterServiceImpl::addDesignation():" + e);

		}

		return result;
	}

	@Override
	public List<Designation> viewALlDesignation() {

		return manageDesignationMasterRepository.findAll();
	}

	@Override
	public Designation getDesignationById(Integer id) {
		Designation designation = null;
		try {
			designation = manageDesignationMasterRepository.getOne(id);
			if (designation != null) {
				LOG.info("ManageDesignationMasterServiceImpl::" + designation.getId());
				LOG.info("ManageDesignationMasterServiceImpl::" + designation.getDesignation());
				LOG.info("ManageDesignationMasterServiceImpl::" + designation.getDescription());
			} else {
				LOG.info("getDesignationById else");
			}
		} catch (Exception e) {
			LOG.error("ManageDesignationMasterServiceImpl::getDesignationById():" + e);

		}

		return designation;
	}

	@Override
	public List<Designation> viewAllActiveDesignations() {
		
		return manageDesignationMasterRepository.findByStatusOrderByDesignationAsc(false);
	}

}
