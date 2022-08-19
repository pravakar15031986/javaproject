
package com.csm.ORSAC.adminconsole.webportal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.ORSAC.adminconsole.webportal.bean.ButtonMasterVo;
import com.csm.ORSAC.adminconsole.webportal.bean.FunctionMasterVo;
import com.csm.ORSAC.adminconsole.webportal.bean.SearchVo;
import com.csm.ORSAC.adminconsole.webportal.bean.TabMasterVo;
import com.csm.ORSAC.adminconsole.webportal.service.ManageTabMasterService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Controller
public class ManageTabController extends OrsacPortalAbstractController {

	public static final Logger LOG = LoggerFactory.getLogger(ManageTabController.class);

	@Autowired
	private ManageTabMasterService tabMasterService; /* Bean creation for ManageTabMasterService */

	@GetMapping(value = { "/addTabMaster" })
	public String viewAddGlobalLink(Model model) {
		List<FunctionMasterVo> functionList = new ArrayList<>(); // to fetch function Master list list
		int maxSlNo = 0;
		try {

			maxSlNo = tabMasterService.getMaxSlNo();

			model.addAttribute("maxSlNo", maxSlNo);
			functionList = tabMasterService.getFunctionList(); // Retrieve function Master list
			model.addAttribute("tabMasterVo", new TabMasterVo());
			model.addAttribute("functionList", functionList);

		} catch (Exception e) {
			LOG.error("ManageTabController::viewAddGlobalLink():" + e);
		}
		return "addTabMaster";
	}

	@PostMapping({ "/registerTabMaster" })
	public String addPrimaryLink(@Valid @ModelAttribute("tabMasterVo") TabMasterVo tabMasterVo, BindingResult binding,
			Model model) {
		List<FunctionMasterVo> functionList = new ArrayList<>();// to fetch function Master list list
		
		String result = "";
		try {
			functionList = tabMasterService.getFunctionList();
			model.addAttribute("functionList", functionList);

			model.addAttribute("tabMasterVo", tabMasterVo);
			LOG.info("ManageTabController::Result has error:" + binding.hasErrors());
			if (binding.hasErrors()) {
				return "addTabMaster";
			}
			result = tabMasterService.addTabMaster(tabMasterVo); /* Save Entered Data of Tab Master to Data Base */

			// buttonList=tabMasterService.getButtonList(); //Retrieve function Master list
			LOG.info("ManageTabController::Tab Master result" + result);

			if (OrsacPortalConstant.SUCCESS.equals(result)) {
				model.addAttribute("tabMasterVo", new TabMasterVo());
				model.addAttribute(OrsacPortalConstant.SUCCESS_MSG, "Tab Master Added Successfully.");

			} else {
				model.addAttribute("tabMasterVo", new TabMasterVo());
				model.addAttribute(OrsacPortalConstant.ERROR_MSG, "Tab Master Not Added.");
			}

		} catch (Exception e) {
			LOG.error("ManageTabController::addPrimaryLink():" + e);
		}

		return "addTabMaster";
	}

	@PostMapping({ "/getButtonId" })
	@ResponseBody
	public List<ButtonMasterVo> getButtonId(@RequestParam(value = "funId", required = true) int funId, Model model) {

		List<ButtonMasterVo> buttonList = new ArrayList<>();// to fetch Button Master list list
		try {
			LOG.info("ManageTabController::In ajax drop button master" + funId);
			buttonList = tabMasterService.getButtonList(funId);
			model.addAttribute("buttonList", buttonList);
		} catch (Exception e) {
			LOG.error("ManageTabController::getButtonId():" + e);
		}

		return buttonList;
	}

	@RequestMapping({ "/viewTabMaster" })
	public String viewTabMasterList(@ModelAttribute SearchVo searchVo, Model model) {
		try {
			model.addAttribute("statusList", getStatus());
			model.addAttribute("tabListData", tabMasterService.viewTabMasterList(searchVo));
		} catch (Exception e) {
			LOG.error("ManageTabController::viewTabMasterList():" + e);
		}

		return "viewTabMaster";
	}

	public List<SearchVo> getStatus() {
		SearchVo vo = null;
		String rNames[] = { "Active", "Inactive" };
		List<SearchVo> statusList = new ArrayList<>();
		try {
			for (int i = 0; i < rNames.length; i++) {
				vo = new SearchVo();
				vo.setDataId(i + 1);
				vo.setDataName(rNames[i]);
				statusList.add(vo);
			}

		} catch (Exception e) {
			LOG.error("ManageTabController::getStatus():" + e);
		}

		return statusList;
	}

	@PostMapping(value = { "/editTabMaster" }) /* To load Tab Master edit page */
	public String getTabMasterData(@RequestParam(value = "tabId", required = true) int tabId, Model model) {
		List<FunctionMasterVo> functionList = new ArrayList<>();
		List<ButtonMasterVo> buttonList = new ArrayList<>();
		TabMasterVo tabObject = new TabMasterVo();
		try {
			LOG.info("ManageTabController::In Tab Master edit" + tabId);
			functionList = tabMasterService.getFunctionList();

			tabObject = tabMasterService.getTabMasterDataById(tabId);

			buttonList = tabMasterService.getButtonList(tabObject.getFunctionId());

			model.addAttribute("tabMasterVo", tabObject);
			model.addAttribute("functionList", functionList);
			model.addAttribute("buttonList", buttonList);

		} catch (Exception e) {
			LOG.error("ManageTabController::editTabMaster():" + e);
		}

		return "editTabMaster";
	}

	@RequestMapping(value = { "/updateTabMaster" })
	public String updateTabMaster(@Valid @ModelAttribute("tabMasterVo") TabMasterVo tabMasterVo, BindingResult binding,
			Model model, RedirectAttributes redircts) {
		List<FunctionMasterVo> functionList = new ArrayList<>();
		String result = OrsacPortalConstant.FAILURE;
		try {
			functionList = tabMasterService.getFunctionList();
			model.addAttribute("functionList", functionList);

			model.addAttribute("buttonList", tabMasterService.getButtonList(tabMasterVo.getFunctionId()));

			model.addAttribute("tabMasterVo", tabMasterVo);
			LOG.info("ManageTabController::Result has error:" + binding.hasErrors());
			if (binding.hasErrors()) {
				return "editTabMaster";
			}

			result = tabMasterService.updateTabMaster(tabMasterVo);
			if (OrsacPortalConstant.SUCCESS.equals(result)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Tab Master Updated Successfully.");

			} else {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "Tab Master Not Updated.");
			}
		} catch (Exception e) {
			LOG.error("ManageTabController::updateTabMaster():" + e);
		}

		return "redirect:viewTabMaster";
	}

	@RequestMapping(value = { "/deleteTabMaster" }) /* To load Tab Master delete page */
	public String deleteTabMaster(@RequestParam(value = "tabId", required = true) int tabId,
			@RequestParam(value = "status", required = true) int status, Model model, RedirectAttributes redircts) {

		String result = OrsacPortalConstant.FAILURE;
		try {
			LOG.info("ManageTabController::In Tab delete --->" + tabId + "<---");
			if (status == 0) {
				result = tabMasterService.deleteTabMaster(tabId);
			}
			if (OrsacPortalConstant.SUCCESS.equals(result)) {
				redircts.addFlashAttribute(OrsacPortalConstant.SUCCESS_MSG, "Tab Master Deleted Successfully.");

			} else {
				redircts.addFlashAttribute(OrsacPortalConstant.ERROR_MSG, "Tab Master Not Deleted.");
			}

		} catch (Exception e) {
			LOG.error("ManageTabController::deleteTabMaster():" + e);
		}

		return "redirect:viewTabMaster";
	}

	@RequestMapping(value = { "/chkTabMasterName" })
	public @ResponseBody String chkDuplicateTabMasterName(
			@RequestParam(value = "tab_name", required = true) String tabName) {
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			result = tabMasterService.chkTabMasterNameByName(tabName);

		} catch (Exception e) {
			LOG.error("ManageTabController::chkDuplicateTabMasterName():" + e);
		}
		return result;

	}

	@RequestMapping(value = { "/chkTabFileName" })
	public @ResponseBody String chkDuplicateTabFileName(
			@RequestParam(value = "tab_file_name", required = true) String tab_file_name) {
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			result = tabMasterService.chkTabFileNameByFileName(tab_file_name);

		} catch (Exception e) {
			LOG.error("ManageTabController::chkDuplicateTabFileName():" + e);

		}
		return result;

	}

}

