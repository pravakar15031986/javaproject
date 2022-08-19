package com.csm.ORSAC.adminconsole.webportal.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.ORSAC.adminconsole.webportal.bean.GlobalLinkVo;
import com.csm.ORSAC.adminconsole.webportal.bean.SearchVo;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLink;
import com.csm.ORSAC.adminconsole.webportal.service.ManageGlobalLinkService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;
import com.csm.ORSAC.webportal.util.Validation;

@Controller
public class ManageGlobalLinkController extends OrsacPortalAbstractController {

	public static final Logger LOG = LoggerFactory.getLogger(ManageGlobalLinkController.class);

	@Autowired
	private ManageGlobalLinkService globalLinkservice; /* Bean creation for ManageGlobalLinkService */

	@GetMapping(value = "/addGlobalLink") /* To load Global Link add page */
	public String loadFunctionMaster(Model model) {
		int maxSlNumber = 0;

		try {

			maxSlNumber = globalLinkservice.getMaxSlNumber();

			model.addAttribute(OrsacPortalConstant.MAX_SL_NO, maxSlNumber);// for serial no.
			model.addAttribute(OrsacPortalConstant.GLOBAL_VO, new GlobalLinkVo());

		} catch (Exception e) {
			LOG.error("ManageGlobalLinkController::loadFunctionMaster():" + e);
		}

		return "addGlobalLink";
	}

	@PostMapping({ "/registerGlobalLink" })
	public String addGlobalLink(@Valid @ModelAttribute(OrsacPortalConstant.GLOBAL_VO) GlobalLink globalVo, BindingResult binding,
			Model model, HttpServletRequest request) {
		
		String result = "";
		try {
			

			globalVo.setIntCreatedBy(1);
			globalVo.setDtmCreatedOn(new Timestamp(new java.util.Date().getTime()));
			LOG.info("=======>>>" + globalVo.toString());
			LOG.info("Global link binding" + binding.hasErrors());
			model.addAttribute(OrsacPortalConstant.GLOBAL_VO, globalVo);

			if (binding.hasErrors()) {
				model.addAttribute(OrsacPortalConstant.MAX_SL_NO, globalLinkservice.getMaxSlNumber());
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Please enter valid data");
				return "addGlobalLink";
			}
			if (!globalVo.getGlobalLinkName().isEmpty()) {
				if (globalLinkservice.chkGlobalLinkName(globalVo.getGlobalLinkName()).equalsIgnoreCase(OrsacPortalConstant.EXIST)) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Global Link already exists");
					return "addGlobalLink";
				}
				if (!Validation.validateAlphabatesOnly(globalVo.getGlobalLinkName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Global Link accept only alphabets");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "globalLinkName");
					return "addGlobalLink";
				}
				if (!Validation.validateFirstBlankSpace(globalVo.getGlobalLinkName())
						|| !Validation.validateLastBlankSpace(globalVo.getGlobalLinkName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Global Link");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "globalLinkName");
					return "addGlobalLink";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(globalVo.getGlobalLinkName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Global Link should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "globalLinkName");
					return "addGlobalLink";
				}
			}
			String sl = String.valueOf(globalVo.getIntSortNum());

			if (!sl.isEmpty()) {
				
				if (!Validation.validateFirstBlankSpace(sl) || !Validation.validateLastBlankSpace(sl)) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Serial Number");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "intSortNum");
					return "addGlobalLink";
				}
				if (!Validation.validateNumberOnly(sl)) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Serial Number accept only numbers.");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "intSortNum");
					return "addGlobalLink";
				}
			}
			if (!globalVo.getVchicon().isEmpty()) {
				if (!Validation.validateLinkIcon(globalVo.getVchicon())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Link Icon accept only alphabets,numers and -");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "iconId");
					return "addGlobalLink";
				}
			}
			LOG.info("Global link Homa page value" + globalVo.getBitHomePage());
			result = globalLinkservice.addGlobalLink(globalVo); /* Save Entered Data of Global Link to Data Base */
			model.addAttribute(OrsacPortalConstant.MAX_SL_NO, globalLinkservice.getMaxSlNumber());
			LOG.info("Global link result" + result);
			if (OrsacPortalConstant.SUCCESS.equals(result)) {
				model.addAttribute(OrsacPortalConstant.GLOBAL_VO, new GlobalLinkVo());
				model.addAttribute(OrsacPortalConstant.SUCCESS_MSG, "Global Link Added Successfully.");
				
			} else {
				model.addAttribute(OrsacPortalConstant.GLOBAL_VO, new GlobalLinkVo());
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Global Link Not Added.");
			}

		} catch (Exception e) {
			LOG.error("ManageGlobalLinkController::addGlobalLink():" + e);
		}

		return "addGlobalLink";
	}

	@RequestMapping(value = { "/viewGlobalLink" })
	public String viewGlobalLinks(@ModelAttribute SearchVo searchVo, Model model) {
		try {
			model.addAttribute("globalList", globalLinkservice.retrieveGloballist(searchVo));
			model.addAttribute("statusList", getStatus());
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkController::viewGlobalLinks():" + e);
		}

		return "viewGlobalLink";
	}

	public List<SearchVo> getStatus() {
		SearchVo vo = null;
		String rNames[] = { OrsacPortalConstant.ACTIVE, OrsacPortalConstant.IN_ACTIVE };
		List<SearchVo> statusList = new ArrayList<>();
		try {
			for (int i = 0; i < rNames.length; i++) {
				vo = new SearchVo();
				vo.setDataId(i + 1);
				vo.setDataName(rNames[i]);
				statusList.add(vo);
			}

		} catch (Exception e) {
			LOG.error("ManageGlobalLinkController::getStatus():" + e);
		}

		return statusList;
	}

	@RequestMapping(value = { "/editGlobalLink" }) /* To load Function Master edit page */
	public String editGlobalLink(@RequestParam(value = "globalLinkId", required = true) int globalLinkId, Model model) {
		GlobalLink globalList = new GlobalLink();
		try {
			LOG.info("In Global Link edit" + globalLinkId);
			model.addAttribute(OrsacPortalConstant.GLOBAL_VO, new GlobalLinkVo());
			globalList = globalLinkservice.editGlobalLink(globalLinkId);
			globalList.setGlobalLinkId(globalLinkId);
			model.addAttribute(OrsacPortalConstant.GLOBAL_VO, globalList);
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkController::editGlobalLink():" + e);
		}
		return "editGlobalLink";
	}

	@RequestMapping(value = { "/updateGlobalLink" })
	public String updateGlobalLink(@Valid @ModelAttribute(OrsacPortalConstant.GLOBAL_VO) GlobalLink globalVo, BindingResult binding,
			Model model, RedirectAttributes redircts) {
		String result = OrsacPortalConstant.FAILURE;
		try {
			LOG.info("Global link binding" + binding.hasErrors());
			model.addAttribute(OrsacPortalConstant.GLOBAL_VO, globalVo);
			if (binding.hasErrors()) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Please enter valid data");
				return "editGlobalLink";
			}
			if (!globalVo.getGlobalLinkName().isEmpty()) {
				if (globalLinkservice.chkGlobalLinkName(globalVo.getGlobalLinkName(), globalVo.getGlobalLinkId())
						.equalsIgnoreCase(OrsacPortalConstant.EXIST)) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Global Link already exists");
					return "editGlobalLink";
				}
				if (!Validation.validateAlphabatesOnly(globalVo.getGlobalLinkName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Global Link accept only alphabets");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "globalLinkName");
					return "editGlobalLink";
				}
				if (!Validation.validateFirstBlankSpace(globalVo.getGlobalLinkName())
						|| !Validation.validateLastBlankSpace(globalVo.getGlobalLinkName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Global Link");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "globalLinkName");
					return "editGlobalLink";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(globalVo.getGlobalLinkName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Global Link should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "globalLinkName");
					return "editGlobalLink";
				}
			}
			String sl = String.valueOf(globalVo.getIntSortNum());
			if (!sl.isEmpty()) {
				
				if (!Validation.validateFirstBlankSpace(sl) || !Validation.validateLastBlankSpace(sl)) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Serial Number");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "intSortNum");
					return "editGlobalLink";
				}
				if (!Validation.validateNumberOnly(sl)) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Serial Number accept only numbers.");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "intSortNum");
					return "editGlobalLink";
				}
			}
			if (!globalVo.getVchicon().isEmpty()) {
				if (!Validation.validateLinkIcon(globalVo.getVchicon())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Link Icon accept only alphabets,numers and -");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "iconId");
					return "editGlobalLink";
				}
			}
			LOG.info("In update Global Link Id" + globalVo.getGlobalLinkId());
			result = globalLinkservice.updateGlobalLink(globalVo);
			if (OrsacPortalConstant.SUCCESS.equals(result)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Global Link Updated Successfully.");

			} else {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "Global link Not Updated.");
			}
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkController::updateGlobalLink():" + e);
		}

		return "redirect:viewGlobalLink";
	}

	@RequestMapping(value = { "/deleteGlobalLink" }) /* To load Global link delete page */
	public String deleteGlobalLink(@RequestParam(value = "globalLinkId", required = true) int globalLinkId,
			@RequestParam(value = "status", required = true) int status, Model model, RedirectAttributes redircts) {

		String result = OrsacPortalConstant.FAILURE;
		try {
			LOG.info("In Global link delete --->" + globalLinkId + "<---");
			if (status == 0) {
				result = globalLinkservice.deleteGlobalLink(globalLinkId);
			}

			if (OrsacPortalConstant.SUCCESS.equals(result)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Global Link Deleted Successfully.");

			} else {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "Global Link Not Deleted.");
			}

		} catch (Exception e) {
			LOG.error("ManageGlobalLinkController::deleteGlobalLink():" + e);
		}

		return "redirect:viewGlobalLink";
	}

	@RequestMapping(value = { "/chkGlobalLinkName" })
	public @ResponseBody String chkGlobalLinkName(@RequestParam(value = "name") String glinkName, Model model) {
		String result = OrsacPortalConstant.NOT_EXIST;
		try {

			result = globalLinkservice.chkGlobalLinkName(glinkName);
			if (OrsacPortalConstant.EXIST.equals(result)) {
				result = OrsacPortalConstant.EXIST;
			}
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkController::chkGlobalLinkName():" + e);
		}
		return result;

	}

	//
	@RequestMapping(value = "/deactiveGLink/{gl_id}/{status}", method = RequestMethod.GET)
	public String deactiveAdminRole(@PathVariable("gl_id") Integer gl_id, @PathVariable("status") Integer status,
			Model model, RedirectAttributes redircts) {
		try {
			String isDeactive = "";
			isDeactive = globalLinkservice.changeGlobalLinkStatus(gl_id, status);
			if (OrsacPortalConstant.DEPENDENT.equalsIgnoreCase(isDeactive)) {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "This Global Link cannot be deactive. Already in use somewhere.");

			} else if (OrsacPortalConstant.SUCCESS.equalsIgnoreCase(isDeactive)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, " Data updated successfully.");

			} else {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "Data not updated.");
			}

		} catch (Exception e) {
			LOG.error("ManageGlobalLinkController::deactiveAdminRole():" + e);
		}
		return "redirect:/viewGlobalLink";
	}

}
