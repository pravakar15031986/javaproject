package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.adminconsole.responsedto.AdminGroupRequestDto;
import com.csm.ORSAC.adminconsole.webportal.bean.PrimaryLinkBean;
import com.csm.ORSAC.adminconsole.webportal.entity.AdminRole;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLinkAccess;
import com.csm.ORSAC.adminconsole.webportal.entity.UserRole;
import com.csm.ORSAC.adminconsole.webportal.repository.AdminRoleRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.ManagePrimaryLinkRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.UserRoleRepository;
import com.csm.ORSAC.adminconsole.webportal.service.ManageAdminRoleService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Service("adminRoleService")
public class AdminRoleServiceImpl implements ManageAdminRoleService {

	public static final Logger LOG = LoggerFactory.getLogger(AdminRoleServiceImpl.class);

	@Autowired
	@Qualifier("adminRoleRepository")
	AdminRoleRepository adminRoleRepository;

	@Autowired
	ManagePrimaryLinkRepository primaryLinkRepository;

	@Autowired
	UserRoleRepository userRoleRepository;

	@Override
	public String addRole(AdminRole adm_role) {
		try {
			adm_role.setCreated_on(new Timestamp(new java.util.Date().getTime()));
			adm_role.setBitStatus(false);
			adm_role.setCreated_by(1);// setting a default super admin id 1
			adm_role = adminRoleRepository.saveAndFlush(adm_role);
			LOG.info("The saved data is :: " + adm_role.toString());
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::addRole():" + e);
		}
		
			return "addRole";
	}

	@Override
	public String updateRole(AdminRole adm_role) {
		String status = OrsacPortalConstant.FAILURE;
		try {
			List<Object[]> roleList = adminRoleRepository.checkRoleExist(adm_role.getRoleId(),
					adm_role.getRoleName().toUpperCase());
			if (!roleList.isEmpty()) {
				return "roleexists";
			}
			List<Object[]> alias = adminRoleRepository.checkAlias(adm_role.getRoleId(),
					adm_role.getAliasName().toUpperCase());
			if (!alias.isEmpty()) {
				return "aliasexists";
			}
			AdminRole adm_role_opt = adminRoleRepository.getOne(adm_role.getRoleId());
			Set<GlobalLinkAccess> updatedParms = new HashSet<>();
			adm_role_opt.setRoleName(adm_role.getRoleName().trim().toUpperCase());
			adm_role_opt.setAliasName(adm_role.getAliasName());
			adm_role_opt.setDescription(adm_role.getDescription());
			adm_role_opt.setLocationTagged(adm_role.getLocationTagged());

			adm_role_opt.setAdminRolePermissions(updatedParms);

			adminRoleRepository.saveAndFlush(adm_role_opt);
			status = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::updateRole():" + e);
		}
		return status;
	}

	@Override
	public AdminRole getAdmRoleById(Integer role_id) {
		try {
			Optional<AdminRole> adminRole = adminRoleRepository.findById(role_id);
			if(adminRole.isPresent())
				return adminRole.get();
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::getAdmRoleById():" + e);
		}
		return null;
	}

	@Override
	public String deleteAdmRole(Integer role_id) {
		try {
			adminRoleRepository.deleteById(role_id);
			;
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::deleteAdmRole():" + e);
		}
		return "addRole";
	}

	@Override
	public String deactiveAdminRole(Integer role_id, int status) {

		String sts = "";
		try {
			AdminRole adm_role = new AdminRole();
			adm_role = getAdmRoleById(role_id);

			if (status == 0) {
				adm_role.setBitStatus(false);
			} else {
				if (checkBitstatusByRoleId(role_id)) {
					adm_role.setBitStatus(true);

				} else {
					return OrsacPortalConstant.DEPENDENT;
				}
			}

			adm_role.setUpdated_on(new Timestamp(new java.util.Date().getTime()));
			adm_role.setUpdated_by(1);// setting a default super admin id 1
			adm_role = adminRoleRepository.saveAndFlush(adm_role);
			LOG.info("The updated data is :: " + adm_role.toString());
			sts = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::deactiveAdminRole():" + e);
			sts = OrsacPortalConstant.FAILURE;
		}
		return sts;
	}

	private boolean checkBitstatusByRoleId(Integer role_id) {
		boolean result = false;
		try {
			List<UserRole> list = userRoleRepository.findByRoleId(role_id);
			if (list.isEmpty()) {
				result = true;
			} else {
				List<UserRole> list1 = userRoleRepository.findByRoleIdAndBitstatus(role_id, true);
				if (!list1.isEmpty()) {
					result = true;
				}
			}
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::checkBitstatusByRoleId():" + e);
		}
		return result;
	}

	@Transactional
	@Override
	public AdminRole saveAdminRole(AdminGroupRequestDto admRoleReqDto) {

		AdminRole adm_role = new AdminRole();
		try {
			adm_role.setRoleName(admRoleReqDto.getName().toUpperCase());
			adm_role.setAliasName(admRoleReqDto.getAliasName());
			adm_role.setDescription(admRoleReqDto.getDesc());
			adm_role.setCreated_on(new Timestamp(new java.util.Date().getTime()));
			adm_role.setBitStatus(false);
			adm_role.setCreated_by(1);// setting a default super admin id 1
			adm_role.setLocationTagged(admRoleReqDto.getLocationTagged());
			adm_role = adminRoleRepository.save(adm_role);
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::saveAdminRole():" + e);
		}

		return adm_role;
	}

	@Override
	public Page<AdminRole> getAdmRoles(Pageable pageable) {
		Page<AdminRole> list_roles = null;
		try {
			list_roles = adminRoleRepository.findAll(pageable);
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::getAdmRoles():" + e);
		}
		return list_roles;
	}

	@Override
	public Page<PrimaryLinkBean> getAdmPrimaryLinks(Pageable pageable) {
		return primaryLinkRepository.findAll(pageable);
	}

	@Override
	public List<AdminRole> getAdmRoles() {
		try {
			return adminRoleRepository.findAll();
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::getAdmRoles():" + e);
		}
		return Collections.emptyList(); 
	}

	@Override
	public List<AdminRole> getNewAdmRoles() {
		List<AdminRole> list = new ArrayList<>();
		try {
			list = adminRoleRepository.findNewAdmRoles();
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::getNewAdmRoles():" + e);
		}
		return list;
	}

	@Override
	public List<AdminRole> viewAllRoles() {

		return adminRoleRepository.findByBitStatusOrderByRoleNameAsc(false);
	}

	@Override
	public String addAdminRole(AdminGroupRequestDto admRoleReqDto) {
		String status = OrsacPortalConstant.FAILURE;
		AdminRole adm_role = new AdminRole();

		try {
			List<Object[]> roleList = adminRoleRepository.checkRoleExist(admRoleReqDto.getName().toUpperCase());
			if (!roleList.isEmpty()) {
				return "roleexists";
			}
			List<Object[]> alias = adminRoleRepository.checkExistingAlias(admRoleReqDto.getAliasName().toUpperCase());
			if (!alias.isEmpty()) {
				return "aliasexists";
			}
			adm_role.setRoleName(admRoleReqDto.getName().toUpperCase());
			adm_role.setAliasName(admRoleReqDto.getAliasName());
			adm_role.setDescription(admRoleReqDto.getDesc());
			adm_role.setCreated_on(new Timestamp(new java.util.Date().getTime()));
			adm_role.setBitStatus(false);
			adm_role.setCreated_by(1);// setting a default super admin id 1
			adm_role.setLocationTagged(admRoleReqDto.getLocationTagged());
			adm_role = adminRoleRepository.save(adm_role);
			status = OrsacPortalConstant.SUCCESS;
			
			LOG.info("adm_role"+adm_role);
		} catch (Exception e) {
			LOG.error("AdminRoleServiceImpl::addAdminRole():" + e);
		}

		
		return status;
	}

}
