package com.csm.ORSAC.adminconsole.webportal.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.csm.ORSAC.adminconsole.responsedto.AdminGroupRequestDto;
import com.csm.ORSAC.adminconsole.webportal.bean.PrimaryLinkBean;
import com.csm.ORSAC.adminconsole.webportal.entity.AdminRole;

public interface ManageAdminRoleService {

	public String addRole(AdminRole adm_role);

	String updateRole(AdminRole adm_reqRoleUpdate);

	public AdminRole getAdmRoleById(Integer role_id);

	public String deleteAdmRole(Integer role_id);

	String deactiveAdminRole(Integer role_id, int status);

	AdminRole saveAdminRole(AdminGroupRequestDto admRoleReqDto);

	Page<AdminRole> getAdmRoles(Pageable pageable);

	List<AdminRole> getAdmRoles();

	Page<PrimaryLinkBean> getAdmPrimaryLinks(Pageable pageable);

	List<AdminRole> getNewAdmRoles();

	List<AdminRole> viewAllRoles();

	String addAdminRole(AdminGroupRequestDto adm_role_req);

}
