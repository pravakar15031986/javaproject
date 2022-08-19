package com.csm.ORSAC.adminconsole.webportal.controller;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.ORSAC.adminconsole.webportal.bean.FunctionMasterVo;
import com.csm.ORSAC.adminconsole.webportal.bean.SearchVo;
import com.csm.ORSAC.adminconsole.webportal.service.ManageFunctionMasterService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;
import com.csm.ORSAC.webportal.util.Validation;

@Controller
@SessionAttributes("FunctionMasterVo")
public class ManageFunctionMasterController extends OrsacPortalAbstractController {

	public static final Logger LOG = LoggerFactory.getLogger(ManageFunctionMasterController.class);

	@Autowired
	private ManageFunctionMasterService functionMasterService; /* Bean creation for ManageFunctionMasterService */

	@GetMapping(value = { "/addFunctionMaster" }) /* To load Function Master add page */
	public String loadFunctionMaster(Model model) {

		model.addAttribute(OrsacPortalConstant.FUNCTION_VO, new FunctionMasterVo());

		return "addFunctionMaster";
	}

	@PostMapping(value = { "/registerFunctionMaster" })
	public String addFunctionMaster(@Valid @ModelAttribute(OrsacPortalConstant.FUNCTION_VO) FunctionMasterVo functionVo,
			BindingResult binding, Model model, RedirectAttributes redircts) {
		String result = OrsacPortalConstant.FAILURE;

		try {
			model.addAttribute(OrsacPortalConstant.FUNCTION_VO, functionVo);
			LOG.info("Result has error:" + binding.hasErrors());
			if (binding.hasErrors()) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Please enter valid data");
				return "addFunctionMaster";
			}
			if (!functionVo.getFunctionName().isEmpty()) {
				if (functionMasterService.checkDuplicateFunctionNameByName(functionVo.getFunctionName())
						.equalsIgnoreCase(OrsacPortalConstant.EXIST)) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Function Name already exists");
					return "addFunctionMaster";
				}
				if (!Validation.validateAlphabatesOnly(functionVo.getFunctionName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Function Name accept only alphabets");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "functionName");
					return "addFunctionMaster";
				}
				if (!Validation.validateFirstBlankSpace(functionVo.getFunctionName())
						|| !Validation.validateLastBlankSpace(functionVo.getFunctionName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Function Name");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "functionName");
					return "addFunctionMaster";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(functionVo.getFunctionName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"Function Name should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "functionName");
					return "addFunctionMaster";
				}
			}
			if (!functionVo.getFileName().isEmpty()) {
				if (functionMasterService.checkDuplicateFileNameByName(functionVo.getFileName())
						.equalsIgnoreCase(OrsacPortalConstant.EXIST)) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "File Name already exists");
					return "addFunctionMaster";
				}
				if (!Validation.validateFileName(functionVo.getFileName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "File Name accept only alphabets");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.FILE_NAME);
					return "addFunctionMaster";
				}
				if (!Validation.validateFirstBlankSpace(functionVo.getFileName())
						|| !Validation.validateLastBlankSpace(functionVo.getFileName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in File Name");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.FILE_NAME);
					return "addFunctionMaster";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(functionVo.getFileName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"File Name should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.FILE_NAME);
					return "addFunctionMaster";
				}
			}
			if (!functionVo.getDescription().isEmpty()) {
				if (!Validation.validateFirstBlankSpace(functionVo.getDescription())
						|| !Validation.validateLastBlankSpace(functionVo.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Description");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.TEXT_DESC);
					return "addFunctionMaster";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(functionVo.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"Description should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.TEXT_DESC);
					return "addFunctionMaster";
				}
				if (!Validation.validateSpecialCharAtFirstAndLast(functionVo.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"!@#$&*() characters are not allowed at initial and last place in Description");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.TEXT_DESC);
					return "addFunctionMaster";
				}
				if (!Validation.validateUserAddress(functionVo.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"Description accept only alphabets,numbers and (:)#;/,.-\\ characters");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.TEXT_DESC);
					return "addFunctionMaster";
				}
			}
			if (!functionVo.getVchPortletFile().isEmpty()) {
				if (!Validation.validateAlphabatesOnly(functionVo.getVchPortletFile())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Portlet File Name accept only alphabets");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.PORTLET_FILE);
					return "addFunctionMaster";
				}
				if (!Validation.validateFirstBlankSpace(functionVo.getVchPortletFile())
						|| !Validation.validateLastBlankSpace(functionVo.getVchPortletFile())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Portlet File Name");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.PORTLET_FILE);
					return "addFunctionMaster";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(functionVo.getVchPortletFile())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"Portlet File Name should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.PORTLET_FILE);
					return "addFunctionMaster";
				}
			}

			result = functionMasterService
					.addFunctionMaster(functionVo); /* Save Entered Data of Function Master to Data Base */

			LOG.info("result" + result);
			if (OrsacPortalConstant.SUCCESS.equals(result)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Function Master Added Successfully.");

			} else {
				redircts.addFlashAttribute(OrsacPortalConstant.FUNCTION_VO, functionVo);
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "Function Master Not Added.");
			}

		} catch (Exception e) {
			LOG.error("ManageFunctionMasterController::addFunctionMaster():" + e);
		}

		return "redirect:addFunctionMaster";
	}

	@RequestMapping(value = { "/viewFunctionMaster" }) /* To view Function Master data */
	public String viewFunctionMaster(@ModelAttribute SearchVo searchVo,
			Model model) { /* @PathVariable Integer pageNumber, */
		List<FunctionMasterVo> functionList = new ArrayList<>();
		

		long totalFunctionmaster = 0;

		try {
			functionList = functionMasterService.retriveFunctionMasterList(searchVo);
			LOG.info("view Function Controller list size" + functionList.size());

			totalFunctionmaster = functionList.size();

			model.addAttribute("intTotalRec", totalFunctionmaster);
			model.addAttribute("searchVo", searchVo);
			model.addAttribute("statusList", getStatus());
			model.addAttribute("functionList", functionList);

		} catch (Exception e) {
			LOG.error("ManageFunctionMasterController::viewFunctionMaster():" + e);
		}

		return "viewFunctionMaster";
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
			LOG.error("ManageFunctionMasterController::getStatus():" + e);
		}

		return statusList;
	}

	@RequestMapping(value = { "/editFunctionMaster" }) /* To load Function Master edit page */
	public String editFunctionMaster(@RequestParam(value = "functionId", required = true) int functionId, Model model) {
		FunctionMasterVo functionList = new FunctionMasterVo();
		try {

			model.addAttribute(OrsacPortalConstant.FUNCTION_VO, new FunctionMasterVo());
			functionList = functionMasterService.editFunctionMaster(functionId);
			functionList.setFunctionId(functionId);
			model.addAttribute(OrsacPortalConstant.FUNCTION_VO, functionList);
		} catch (Exception e) {
			LOG.error("ManageFunctionMasterController::editFunctionMaster():" + e);
		}

		return "editFunctionMaster";
	}

	@RequestMapping(value = { "/updateFunctionMaster" })
	public String updateFunctionMaster(@Valid @ModelAttribute(OrsacPortalConstant.FUNCTION_VO) FunctionMasterVo functionVo,
			BindingResult binding, Model model, RedirectAttributes redircts) {
		String result = OrsacPortalConstant.FAILURE;
		try {
			model.addAttribute(OrsacPortalConstant.FUNCTION_VO, functionVo);
			LOG.info("Result has error:" + binding.hasErrors());
			if (binding.hasErrors()) {
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Please enter valid data");
				return "editFunctionMaster";
			}
			if (!functionVo.getFunctionName().isEmpty()) {
				if (functionMasterService
						.checkDuplicateFunctionNameByName(functionVo.getFunctionId(), functionVo.getFunctionName())
						.equalsIgnoreCase(OrsacPortalConstant.EXIST)) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Function Name already exists");
					return "editFunctionMaster";
				}
				if (!Validation.validateAlphabatesOnly(functionVo.getFunctionName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Function Name accept only alphabets");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "functionName");
					return "editFunctionMaster";
				}
				if (!Validation.validateFirstBlankSpace(functionVo.getFunctionName())
						|| !Validation.validateLastBlankSpace(functionVo.getFunctionName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Function Name");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "functionName");
					return "editFunctionMaster";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(functionVo.getFunctionName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"Function Name should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, "functionName");
					return "editFunctionMaster";
				}
			}
			if (!functionVo.getFileName().isEmpty()) {
				if (functionMasterService
						.checkDuplicateFileNameByName(functionVo.getFunctionId(), functionVo.getFileName())
						.equalsIgnoreCase(OrsacPortalConstant.EXIST)) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Function Name already exists");
					return "editFunctionMaster";
				}
				if (!Validation.validateFileName(functionVo.getFileName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "File Name accept only alphabets");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.FILE_NAME);
					return "editFunctionMaster";
				}
				if (!Validation.validateFirstBlankSpace(functionVo.getFileName())
						|| !Validation.validateLastBlankSpace(functionVo.getFileName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in File Name");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.FILE_NAME);
					return "editFunctionMaster";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(functionVo.getFileName())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"File Name should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.FILE_NAME);
					return "editFunctionMaster";
				}
			}
			if (!functionVo.getDescription().isEmpty()) {
				if (!Validation.validateFirstBlankSpace(functionVo.getDescription())
						|| !Validation.validateLastBlankSpace(functionVo.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Description");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.TEXT_DESC);
					return "editFunctionMaster";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(functionVo.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"Description should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.TEXT_DESC);
					return "editFunctionMaster";
				}
				if (!Validation.validateSpecialCharAtFirstAndLast(functionVo.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"!@#$&*() characters are not allowed at initial and last place in Description");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.TEXT_DESC);
					return "editFunctionMaster";
				}
				if (!Validation.validateUserAddress(functionVo.getDescription())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"Description accept only alphabets,numbers and (:)#;/,.-\\ characters");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.TEXT_DESC);
					return "editFunctionMaster";
				}
			}
			if (!functionVo.getVchPortletFile().isEmpty()) {
				if (!Validation.validateAlphabatesOnly(functionVo.getVchPortletFile())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Portlet File Name accept only alphabets");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.PORTLET_FILE);
					return "editFunctionMaster";
				}
				if (!Validation.validateFirstBlankSpace(functionVo.getVchPortletFile())
						|| !Validation.validateLastBlankSpace(functionVo.getVchPortletFile())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"White space is not allowed at initial and last place in Portlet File Name");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.PORTLET_FILE);
					return "editFunctionMaster";
				}
				if (!Validation.validateConsecutiveBlankSpacesInString(functionVo.getVchPortletFile())) {
					model.addAttribute(OrsacPortalConstant.ERROR_MSG,
							"Portlet File Name should not contain consecutive blank spaces");
					model.addAttribute(OrsacPortalConstant.FIELD_ID, OrsacPortalConstant.PORTLET_FILE);
					return "editFunctionMaster";
				}
			}

			result = functionMasterService.updateFunctionMaster(functionVo);
			if (OrsacPortalConstant.SUCCESS.equals(result)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Function Master Updated Successfully.");

			} else {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "Function Master Not Updated.");
			}
		} catch (Exception e) {
			LOG.error("ManageFunctionMasterController::updateFunctionMaster():" + e);
		}

		return "redirect:viewFunctionMaster";
	}

	@RequestMapping(value = { "/deleteFunctionMaster" }) /* To load Function Master delete page */
	public String deleteFunctionMaster(@RequestParam(value = "functionId", required = true) String functionId,
			@RequestParam(value = "status", required = true) int status, Model model, RedirectAttributes redircts) {

		String result = OrsacPortalConstant.FAILURE;
		try {
			LOG.info("In Function delete --->" + status + "<---");
			if (status == 0) {
				result = functionMasterService.deleteFunctionMaster(functionId);
			}

			if (OrsacPortalConstant.SUCCESS.equals(result)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Function Master Deleted Successfully.");

			} else {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "Function Master Not Deleted.");
			}

		} catch (Exception e) {
			LOG.error("ManageFunctionMasterController::deleteFunctionMaster():" + e);
		}

		return "redirect:viewFunctionMaster";
	}

	@RequestMapping(value = { "/checkFunctionName" })
	public @ResponseBody String checkDuplicateFunctionName(
			@RequestParam(value = "fun_name", required = true) String Name, Model model) {
		String result = OrsacPortalConstant.NOT_EXIST;

		try {

			result = functionMasterService.checkDuplicateFunctionNameByName(Name);
			if (OrsacPortalConstant.EXIST.equals(result)) {
				result = OrsacPortalConstant.EXIST;
			}
		} catch (Exception e) {
			LOG.error("ManageFunctionMasterController::checkDuplicateFunctionName():" + e);
		}

		return result;
	}

	@RequestMapping(value = { "/chkFileName" })
	public @ResponseBody String checkDuplicateFileName(@RequestParam(value = "name", required = true) String name) {
		String result = OrsacPortalConstant.NOT_EXIST;
		try {

			result = functionMasterService.checkDuplicateFileNameByName(name);
			if (OrsacPortalConstant.EXIST.equals(result)) {
				result = OrsacPortalConstant.EXIST;
			}
		} catch (Exception e) {
			LOG.error("ManageFunctionMasterController::checkDuplicateFileName():" + e);

		}

		return result;
	}

	@RequestMapping(value = "/deactiveFunction/{functn_id}/{status}", method = RequestMethod.GET)
	public String deactiveAdminRole(@PathVariable("functn_id") Integer functn_id,
			@PathVariable("status") Integer status, Model model, RedirectAttributes redircts) {
		try {
			String isDeactive = "";
			isDeactive = functionMasterService.changeFunctionMasterStatus(functn_id, status);

			if (OrsacPortalConstant.DEPENDENT.equalsIgnoreCase(isDeactive)) {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG,
						"This Function Master cannot be deactive. Already in use somewhere.");

			} else if (OrsacPortalConstant.SUCCESS.equalsIgnoreCase(isDeactive)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, " Data updated successfully.");

			} else {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "Data not updated.");
			}

		} catch (Exception e) {
			LOG.error("ManageFunctionMasterController::deactiveAdminRole():" + e);

		}
		return "redirect:/viewFunctionMaster";
	}

}
