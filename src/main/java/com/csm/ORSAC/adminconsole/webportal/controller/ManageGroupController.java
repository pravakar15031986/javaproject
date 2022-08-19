package com.csm.ORSAC.adminconsole.webportal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.ORSAC.adminconsole.responsedto.AdminGroupRequestDto;
import com.csm.ORSAC.adminconsole.webportal.api.ApiUrl;
import com.csm.ORSAC.adminconsole.webportal.service.ManageAdminRoleService;
import com.csm.ORSAC.adminconsole.webportal.util.Pagination;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;
import com.csm.ORSAC.webportal.util.Validation;

@Controller
public class ManageGroupController {

	public static final Logger LOG = LoggerFactory.getLogger(ManageGroupController.class);

	@Autowired
	ManageAdminRoleService adminRoleService;

	@GetMapping("addRoleMaster")
	String addRoleMaster(Model model) {
		model.addAttribute("admRol", new AdminGroupRequestDto());
		return "addRole";

	}
	

	@GetMapping("editRoleMaster")
	String editRoleMaster(Model model, HttpServletRequest request) {
		model.addAttribute("admRol", request.getSession().getAttribute(OrsacPortalConstant.DATA));
		return "editRole";

	}

	@RequestMapping(value = ApiUrl.Group.ADD_ROLE, method = RequestMethod.POST)
	public String createRole(@Valid @ModelAttribute("admRol") AdminGroupRequestDto adm_role_req, Model model,
			BindingResult bindingResult, RedirectAttributes redirect) {

		LOG.info("Recieve customer data is  :: " + adm_role_req.toString());
		if (bindingResult.hasErrors()) {
			model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Please enter valid details");
			return "addRole";
		}

		if (!adm_role_req.getName().isEmpty()) {
			if (!Validation.validateRoleName(adm_role_req.getName()) ) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Role Name accept only alphabets and _");
				model.addAttribute(OrsacPortalConstant.FIELD_ID, "name");
				return "addRole";
			}
		}
		if (!adm_role_req.getAliasName().isEmpty()) {
			if (!Validation.validateFirstBlankSpace(adm_role_req.getAliasName())
					|| !Validation.validateLastBlankSpace(adm_role_req.getAliasName())) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG,
						"White space is not allowed at initial and last place in Alias Name");
				model.addAttribute(OrsacPortalConstant.FIELD_ID, "alias");
				return "addRole";
			}
			if (!Validation.validateConsecutiveBlankSpacesInString(adm_role_req.getAliasName())) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Alias name should not contain consecutive blank spaces");
				model.addAttribute(OrsacPortalConstant.FIELD_ID, "alias");
				return "addRole";
			}
			if (!Validation.validateRoleAlias(adm_role_req.getAliasName()) ) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Alias name accept only alphabets and_");
				model.addAttribute(OrsacPortalConstant.FIELD_ID, "alias");
				return "addRole";
			}
		}
		if (!adm_role_req.getDesc().isEmpty()) {
			if (!Validation.validateFirstBlankSpace(adm_role_req.getDesc())
					|| !Validation.validateLastBlankSpace(adm_role_req.getDesc())) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG,
						"White space is not allowed at initial and last place in Description");
				model.addAttribute(OrsacPortalConstant.FIELD_ID, "desc");
				return "addRole";
			}
			if (!Validation.validateConsecutiveBlankSpacesInString(adm_role_req.getDesc())) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Description should not contain consecutive blank spaces");
				model.addAttribute(OrsacPortalConstant.FIELD_ID, "desc");
				return "addRole";
			}
			if (!Validation.validateSpecialCharAtFirstAndLast(adm_role_req.getDesc())) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG,
						"!@#$&*() characters are not allowed at initial and last place in Description");
				model.addAttribute(OrsacPortalConstant.FIELD_ID, "desc");
				return "addRole";
			}
			if (!Validation.validateUserAddress(adm_role_req.getDesc())) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG,
						"Description accept only alphabets,numbers and (:)#;/,.-\\ characters");
				model.addAttribute(OrsacPortalConstant.FIELD_ID, "desc");
				return "addRole";
			}
		}
		

		// Check Exisitng Role Name

		String status = adminRoleService.addAdminRole(adm_role_req);
		if ("roleexists".equalsIgnoreCase(status)) {
			model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Role Name already exists");
			return "addRole";
		}
		if ("aliasexists".equalsIgnoreCase(status)) {
			model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Alias Name already exists");
			return "addRole";
		}
		if (OrsacPortalConstant.SUCCESS.equalsIgnoreCase(status)) {
			redirect.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Role added successfully");
		}
		if (OrsacPortalConstant.FAILURE.equalsIgnoreCase(status)) {
			model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Role not added");
			return "addRole";
		}
		
		return "redirect:" + ApiUrl.Group.GET_ROLES;
	}

	@RequestMapping(value = ApiUrl.Group.GET_ROLES, method = { RequestMethod.POST, RequestMethod.GET })
	public String getAdminRoles(@ModelAttribute("pagination") Pagination pagination, Model model) {
		
		try {
			LOG.info("::>>>>" + pagination);
			
			Pageable pageable = null;
			if (pagination == null) {
				List<String> li = new ArrayList<>();
				li.add("aliasName");
				pagination = new Pagination(li, "asc");
				pagination.setSize(100);
			}
			if (pagination.getPage() > 0)
				pagination.setPage(pagination.getPage() - 1);
			pagination.setSize(100);
			pageable = pagination.getPageable();

			Page<com.csm.ORSAC.adminconsole.webportal.entity.AdminRole> adm_roles = adminRoleService.getAdmRoles(pageable);

			
			Map<String, Object> map = new HashMap<>();
			
			map.put("currentPage", adm_roles.getNumber());
			map.put("total", adm_roles.getTotalPages());
			map.put("listRoles", adm_roles.getContent());
			model.addAttribute(OrsacPortalConstant.DATA, map);

		} catch (Exception e) {
			LOG.error("ManageGroupController::getAdminRoles():" + e);
		}
		return "viewRoles";
	}

	@GetMapping(value = ApiUrl.Group.EDIT_ROLE)
	public String editRoleMaster(@PathVariable("id") Integer id, Model model, HttpServletRequest resquest) {

		try {

			com.csm.ORSAC.adminconsole.webportal.entity.AdminRole admrole = adminRoleService.getAdmRoleById(id);

			resquest.getSession().setAttribute(OrsacPortalConstant.DATA, admrole);
		} catch (Exception e) {
			LOG.error("ManageGroupController::editRoleMaster():" + e);
		}
		return "redirect:/editRoleMaster";
	}

	@RequestMapping(value = ApiUrl.Group.UPDATE_ROLE, method = RequestMethod.POST)
	public String updateAdminRole(
			@Valid @ModelAttribute("admRol") com.csm.ORSAC.adminconsole.webportal.entity.AdminRole adm_reqRoleUpdate,
			BindingResult bindingResult, Model model, RedirectAttributes redircts) {

		try {
			if (bindingResult.hasErrors()) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Please enter valid details");
				return "editRole";
			}
			
			if (!adm_reqRoleUpdate.getRoleName().isEmpty()) {
				if (Validation.validateRoleName(adm_reqRoleUpdate.getRoleName()) == false) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Role Name accept only alphabets and _");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "name");
					return "editRole";
				}
			}
			if (!adm_reqRoleUpdate.getAliasName().isEmpty()) {
				if (!Validation.validateFirstBlankSpace(adm_reqRoleUpdate.getAliasName())
						|| !Validation.validateLastBlankSpace(adm_reqRoleUpdate.getAliasName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Alias Name");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "alias");
					return "editRole";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(adm_reqRoleUpdate.getAliasName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Alias name should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "alias");
					return "editRole";
				}
				if (Validation.validateRoleAlias(adm_reqRoleUpdate.getAliasName()) == false) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Alias name accept only alphabets and _.");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "alias");
					return "editRole";
				}
			}
			if (!adm_reqRoleUpdate.getDescription().isEmpty()) {
				if (!Validation.validateFirstBlankSpace(adm_reqRoleUpdate.getDescription())
						|| !Validation.validateLastBlankSpace(adm_reqRoleUpdate.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Description");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "desc");
					return "editRole";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(adm_reqRoleUpdate.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Description should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "desc");
					return "editRole";
				}
				if (!Validation.validateSpecialCharAtFirstAndLast(adm_reqRoleUpdate.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"!@#$&*() characters are not allowed at initial and last place in Description");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "desc");
					return "editRole";
				}
				if (!Validation.validateUserAddress(adm_reqRoleUpdate.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"Description accept only alphabets,numbers and (:)#;/,.-\\ characters");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "desc");
					return "editRole";
				}
			}
		

			// Check existing Role Name
			String status = adminRoleService.updateRole(adm_reqRoleUpdate);
			if (status.equalsIgnoreCase("roleexists")) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Role Name already exists");
				return "editRole";
			}
			if (status.equalsIgnoreCase("aliasexists")) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Alias Name already exists");
				return "editRole";
			}
			if (status.equalsIgnoreCase(OrsacPortalConstant.SUCCESS)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Role updated successfully");
			}
			if (status.equalsIgnoreCase(OrsacPortalConstant.FAILURE)) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Role not added");
				return "editRole";
			}
		} catch (Exception e) {
			LOG.error("ManageGroupController::updateAdminRole():" + e);
		}
		return "redirect:" + ApiUrl.Group.GET_ROLES;
	}

	@RequestMapping(value = ApiUrl.Group.DEACTIVE_ROLE, method = RequestMethod.GET)
	public String deactiveAdminRole(@PathVariable("role_id") Integer role_id, @PathVariable("status") Integer status,
			Model model, RedirectAttributes redircts) {
		try {
			LOG.info("role_id :: " + role_id);
			
			String isDeactive = "";
			isDeactive = adminRoleService.deactiveAdminRole(role_id, status);
			if ((OrsacPortalConstant.DEPENDENT).equalsIgnoreCase(isDeactive)) {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "This Role cannot be deactive. Already in use somewhere.");

			} else if ((OrsacPortalConstant.SUCCESS).equalsIgnoreCase(isDeactive)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Data updated successfully");
			} else {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "Data not updated");
			}

			

		} catch (Exception e) {
			LOG.error("ManageGroupController::deactivateAdminRole():" + e);
		}
		return "redirect:" + ApiUrl.Group.GET_ROLES;
	}

	

}
