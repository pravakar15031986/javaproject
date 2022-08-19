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

import com.csm.ORSAC.adminconsole.webportal.entity.UserType;
import com.csm.ORSAC.adminconsole.webportal.service.ManageUserTypeMasterService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Controller
public class UserTypeController extends OrsacPortalAbstractController {

	@Autowired
	ManageUserTypeMasterService userTypeMasterService;

	private static final Logger LOG = LoggerFactory.getLogger(UserTypeController.class);

	@RequestMapping(value = "/addusertype", method = RequestMethod.GET)
	public String addUserType(@ModelAttribute("userT") UserType u) {
		return "addUserTypeMaster";
	}

	@RequestMapping(value = "/add-userType", method = RequestMethod.POST)
	public String saveUserType(Model model, @ModelAttribute("userT") UserType u) {
		try {
			int uId = u.getId();
			if (uId == 0) {
				userTypeMasterService.addUserType(u);
				model.addAttribute(OrsacPortalConstant.SUCCESS_MSG, "Data Saved successfully");
			} else {
				UserType uType = userTypeMasterService.getUserTypeById(uId);
				if (uType != null) {
					u.setId(uType.getId());
					userTypeMasterService.addUserType(u);
					model.addAttribute(OrsacPortalConstant.SUCCESS_MSG, "Data Update successfully");
				}
			}
			model.addAttribute("userT", new UserType());
		} catch (Exception e) {
			LOG.error("UserTypeController::saveUserType():" + e);
		}
		return "addUserTypeMaster";
	}

	@RequestMapping(value = "/viewusertype", method = RequestMethod.GET)
	public String viewUserType(Model model) {
		try {
			List<UserType> list = null;
			list = userTypeMasterService.viewALlUserType();
			if (list != null)
				model.addAttribute("userTypeList", list);
			else
				model.addAttribute(OrsacPortalConstant.SUCCESS_MSG, "No Record Found");
		} catch (Exception e) {
			LOG.error("UserTypeController::viewUserType():" + e);
		}
		return "viewUserTypeMaster";
	}

	@RequestMapping(value = "/editUserType.htm", method = RequestMethod.POST)
	public String editUserType(@RequestParam("userId") Integer id, Model model) {
		try {

			UserType user = null;
			user = userTypeMasterService.getUserTypeById(id);
			LOG.info("UserTypeController::User :" + user);
			model.addAttribute("userT", user);
		} catch (Exception e) {
			LOG.error("UserTypeController::editUserType():" + e);
		}
		return "editUserTypeMaster";
	}
}
