package com.csm.ORSAC.webportal.report.control;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.ORSAC.adminconsole.webportal.entity.AdmLevelDetails;
import com.csm.ORSAC.adminconsole.webportal.repository.AdminLevelRepository;
import com.csm.ORSAC.webportal.bean.DistrictDataBean;
import com.csm.ORSAC.webportal.bean.RegistrationBean;
import com.csm.ORSAC.webportal.bean.SurveyReportBean;
import com.csm.ORSAC.webportal.report.service.MISReportService;
import com.csm.ORSAC.webportal.repository.LevelDetailsRepository;
import com.csm.ORSAC.webportal.service.CommonService;

@Controller
public class MISReportController {
	
	@Autowired
	HttpSession session;

	@Autowired
	CommonService commonService;
	
	
	@Autowired
	AdminLevelRepository admRepo;
	
	@Autowired
	LevelDetailsRepository levelrepo;
	
	@Autowired
	MISReportService reportService;
	
	/**
	 * 
	 * @param model
	 * @param request
	 * This method is used to fetch
	 * View Survey report details
	 * @return list of view survey report
	 */
	@RequestMapping("/viewSurveyReport")
	public ModelAndView viewSurveyReport(@ModelAttribute("viewSurveyreport") RegistrationBean regBean,Model model,HttpServletRequest request) {
		int intlevelDetailId=0;
		int distId=0;
		List<DistrictDataBean> districtList=null;
		
		Object distCode=null;
		Object distname=null;
		int roleId=0;
		ModelAndView mv=new ModelAndView("viewSurveyReport");
		
		List<SurveyReportBean> dataList=new ArrayList<>();
		List<RegistrationBean> thasilList=null;
		List<RegistrationBean> villageList=null;
		List<RegistrationBean> pacsList=null;
		try {
			roleId=Integer.parseInt(String.valueOf(session.getAttribute("ROLE_ID")));
			if (roleId == 1 || roleId == 5) { // super admin
				districtList = commonService.fetchDistrictList();
				model.addAttribute("districtList", districtList);
				dataList = reportService.viewSurveyReport(regBean, request);
				thasilList=commonService.fetchtahasilListByDistCode(regBean.getDistrictId());
				villageList=commonService.fetchvillageListByTahasilCode(regBean.getTahasilId());
				pacsList=commonService.fetchPacsListByDistCode(regBean.getDistrictId());
				model.addAttribute("pacsList", pacsList);
				model.addAttribute("tahasilList", thasilList);
				model.addAttribute("VillageList", villageList);
				model.addAttribute("surveyReportDataList", dataList);
				
			} else {
				intlevelDetailId = Integer.parseInt(String.valueOf(session.getAttribute("OFFICE_ID")));
				Optional<AdmLevelDetails> OptAdmDto = admRepo.findById(intlevelDetailId);
				if (OptAdmDto.isPresent()) {
					AdmLevelDetails dto = OptAdmDto.get();
					System.err.println(dto.getParentId() + ": District Id");
					distId = dto.getParentId();
					distCode = levelrepo.getDistCodeByDistId(distId);
					distname=levelrepo.getDistrictNameBydistId(distId);
					System.err.println(distCode + ": Dist Code");
					regBean.setDistrictId(String.valueOf(distCode));
					dataList = reportService.viewSurveyReport(regBean, request);
					thasilList=commonService.fetchtahasilListByDistCode(regBean.getDistrictId());
					villageList=commonService.fetchvillageListByTahasilCode(regBean.getTahasilId());
					pacsList=commonService.fetchPacsListByDistCode(regBean.getDistrictId());
					model.addAttribute("pacsList", pacsList);
					model.addAttribute("tahasilList", thasilList);
					model.addAttribute("VillageList", villageList);
					model.addAttribute("surveyReportDataList", dataList);
					model.addAttribute("distCode", String.valueOf(distCode));
					model.addAttribute("distname", String.valueOf(distname));

				}
			}	
			//System.out.println(String.valueOf(session.getAttribute("OFFICE_ID")));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/fetchPlotDetailsByPlotCode")
	public SurveyReportBean fetchPlotDetailsByPlotCode(@RequestParam("plotcode") String plotcode,HttpServletRequest request){
		SurveyReportBean responseBean=null;
		try {
			responseBean=reportService.fetchPlotDetailsByPlotCode(plotcode,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responseBean;
	}
	
	
	@RequestMapping("/actionOnSurveyDetails")
	public String actionOnSurveyDetails(@ModelAttribute SurveyReportBean surveyBean,RedirectAttributes redirects) {
		String status="";
		String msg="";
		try {
			status=reportService.actionOnSurveyDetails(surveyBean);
			if("200".equals(status)) {
				msg="Plot Details has been approved";
			}else if("201".equals(status)) {
				msg="Plot Details has been rejected";
			}else {
				msg="Some Error Occured";
			}
			redirects.addFlashAttribute("message", msg);
		} catch (Exception e) {
		   e.printStackTrace();
		}
		return "redirect:viewSurveyReport";
	}
	
	@RequestMapping("/plotSearchReport")
	public String plotSearchReport() {
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "plotSearchReport";
	}
	
	
	@RequestMapping("/tahasilSummaryReport")
	public String tahasilSummaryReport() {
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "tahasilSummaryReport";
	}
	
	@RequestMapping("/mapViewerReport")
	public String mapViewerReport() {
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mapViewerReport";
	}
	
	

	@RequestMapping("/villageSummaryFarmerWiseReport")
	public String villageSummaryFarmerWiseReport() {
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "villageSummaryFarmerWiseReport";
	}
	
	@RequestMapping("/villageSummaryPlotWiseReport")
	public String villageSummaryPlotWiseReport() {
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "villageSummaryPlotWiseReport";
	}
	
	/**
	 * 
	 * @param regBean
	 * @param model
	 * @return
	 */
	@RequestMapping("/viewSuspectedPlot")
	public String viewSuspectedPlot(@ModelAttribute("viewSurveyreport") RegistrationBean regBean,Model model,HttpServletRequest request) {
		int intlevelDetailId=0;
		int distId=0;
		List<DistrictDataBean> districtList=null;
		
		Object distCode=null;
		Object distname=null;
		int roleId=0;
		
		List<SurveyReportBean> dataList=new ArrayList<>();
		List<RegistrationBean> thasilList=null;
		List<RegistrationBean> villageList=null;
		List<RegistrationBean> pacsList=null;
		try {
			roleId=Integer.parseInt(String.valueOf(session.getAttribute("ROLE_ID")));
			if (roleId == 1 || roleId == 5) { //  admin
				districtList = commonService.fetchDistrictList();
				model.addAttribute("districtList", districtList);
				
				thasilList=commonService.fetchtahasilListByDistCode(regBean.getDistrictId());
				villageList=commonService.fetchvillageListByTahasilCode(regBean.getTahasilId());
				pacsList=commonService.fetchPacsListByDistCode(regBean.getDistrictId());
				model.addAttribute("pacsList", pacsList);
				if(Optional.ofNullable(regBean.getDistrictId()).isPresent() && !"0".equals(regBean.getDistrictId()) ) {
					dataList=reportService.viewSuspectedPlotReport(regBean);
				}
				model.addAttribute("tahasilList", thasilList);
				model.addAttribute("VillageList", villageList);
				model.addAttribute("surveyReportDataList", dataList);
				
			} else {
				intlevelDetailId = Integer.parseInt(String.valueOf(session.getAttribute("OFFICE_ID")));
				Optional<AdmLevelDetails> OptAdmDto = admRepo.findById(intlevelDetailId);
				if (OptAdmDto.isPresent()) {
					AdmLevelDetails dto = OptAdmDto.get();
					System.err.println(dto.getParentId() + ": District Id");
					distId = dto.getParentId();
					distCode = levelrepo.getDistCodeByDistId(distId);
					distname=levelrepo.getDistrictNameBydistId(distId);
					System.err.println(distCode + ": Dist Code");
					regBean.setDistrictId(String.valueOf(distCode));
					thasilList=commonService.fetchtahasilListByDistCode(regBean.getDistrictId());
					villageList=commonService.fetchvillageListByTahasilCode(regBean.getTahasilId());
					pacsList=commonService.fetchPacsListByDistCode(regBean.getDistrictId());
					model.addAttribute("pacsList", pacsList);
					model.addAttribute("tahasilList", thasilList);
					model.addAttribute("VillageList", villageList);
					dataList=reportService.viewSuspectedPlotReport(regBean);
					model.addAttribute("surveyReportDataList", dataList);
					model.addAttribute("distCode", String.valueOf(distCode));
					model.addAttribute("distname", String.valueOf(distname));

				}
			}	
			
			model.addAttribute("roleId", String.valueOf(roleId));
			
		 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "viewSuspectedPlot";
	}
	


	
	
	
	


}
