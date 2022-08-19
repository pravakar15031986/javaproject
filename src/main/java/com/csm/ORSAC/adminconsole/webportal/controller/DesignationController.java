package com.csm.ORSAC.adminconsole.webportal.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.ORSAC.adminconsole.webportal.bean.DesignationBean;
import com.csm.ORSAC.adminconsole.webportal.entity.Designation;
import com.csm.ORSAC.adminconsole.webportal.service.ManageDesignationMasterService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;
import com.csm.ORSAC.webportal.util.Validation;

@Controller
public class DesignationController extends OrsacPortalAbstractController {

	public static final Logger LOG = LoggerFactory.getLogger(DesignationController.class);

	@Autowired
	ManageDesignationMasterService designationMasterService;

	@RequestMapping(value = "/adddesignation", method = RequestMethod.GET)
	public String addDesignation(Model model) {

		model.addAttribute("designation", new DesignationBean());

		return "adddesignation";
	}

	@RequestMapping(value = "/saveDesignation", method = RequestMethod.POST)
	public String addDesignation(@ModelAttribute("designation") DesignationBean designation, Model model,
			RedirectAttributes redirectAttrs) {
		String returnPage = "adddesignation";
		if (designation.getId() != null) {
			returnPage = "editdesignation";
		}
		try {

			// Server Side Validation Start

			if (designation.getDesignation() == null || designation.getDesignation().isEmpty()
					|| "".equalsIgnoreCase(designation.getDesignation())) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Please enter the Designation");
				return returnPage;
			}

			
			if (!designation.getDesignation().isEmpty()) {
				if (!Validation.validateFirstBlankSpace(designation.getDesignation())
						|| !Validation.validateLastBlankSpace(designation.getDesignation())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "White space is not allowed at initial and last place in Designation");
					return returnPage;
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(designation.getDesignation())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Designation should not contain consecutive blank spaces");
					return returnPage;
				}
				if (!Validation.validateAlphabatesOnly(designation.getDesignation()) ) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Designation accept only alphabets.");
					return returnPage;
				}
			}
			if (!designation.getDescription().isEmpty()) {
				if (!Validation.validateFirstBlankSpace(designation.getDescription())
						|| !Validation.validateLastBlankSpace(designation.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "White space is not allowed at initial and last place in description");
					return returnPage;
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(designation.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Description should not contain consecutive blank spaces");
					return returnPage;
				}
				if (!Validation.validateSpecialCharAtFirstAndLast(designation.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"!@#$&*() characters are not allowed at initial and last place in description");
					return returnPage;
				}
				if (!Validation.validateUserAddress(designation.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"Description accept only alphabets,numbers and (:)#;/,.-\\\\ characters");
					return returnPage;
				}
			}

			

			// Server Side Validation End

			String result = designationMasterService.addDesignation(designation);
			if (OrsacPortalConstant.EXIST.equalsIgnoreCase(result)) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Designation already exists");
			}
			if (OrsacPortalConstant.DEPENDENT.equalsIgnoreCase(result)) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "This Designation cannot be deactive. Already in use somewhere.");
			}
			if (OrsacPortalConstant.SUCCESS.equalsIgnoreCase(result)) {
				model.addAttribute("designation", new DesignationBean());
				model.addAttribute(OrsacPortalConstant.SUCCESS_MSG, "Designation added successfully");

			}
			if (OrsacPortalConstant.UPDATE.equalsIgnoreCase(result)) {
				redirectAttrs.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Designation updated successfully");
				returnPage = "redirect:viewdesignation";
			}
			if (OrsacPortalConstant.FAILURE.equalsIgnoreCase(result)) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Try again");
			}

		} catch (Exception e) {
			LOG.error("DesignationController::addDesignation():" + e);

		}
		return returnPage;
	}

	@RequestMapping(value = "/viewdesignation", method = RequestMethod.GET)
	public String viewDesignation(Model model) {
		try {
			List<Designation> list = null;
			list = designationMasterService.viewALlDesignation();
			if (list != null)
				model.addAttribute("allDesignationList", list);
			else
				model.addAttribute(OrsacPortalConstant.SUCCESS_MSG, "No Record Found");
		} catch (Exception e) {
			LOG.error("DesignationController::viewDesignation():" + e);
		}
		model.addAttribute("show", false);
		return "viewdesignation";
	}

	@RequestMapping(value = "/editdesignation", method = RequestMethod.POST)
	public String editdesignation(@RequestParam("userId") Integer id, Model model) {
		try {

			Designation desigObj = null;
			desigObj = designationMasterService.getDesignationById(id);

			model.addAttribute("designation", desigObj);

		} catch (Exception e) {
			LOG.error("DesignationController::editDesignation():" + e);
		}
		return "editdesignation";
	}

}
