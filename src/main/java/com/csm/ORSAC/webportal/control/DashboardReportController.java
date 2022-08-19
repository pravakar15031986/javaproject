package com.csm.ORSAC.webportal.control;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.csm.ORSAC.adminconsole.webportal.controller.OrsacPortalAbstractController;
import com.csm.ORSAC.adminconsole.webportal.entity.AdmLevelDetails;
import com.csm.ORSAC.adminconsole.webportal.repository.AdminLevelRepository;
import com.csm.ORSAC.webportal.bean.DashBoardBean;
import com.csm.ORSAC.webportal.repository.LevelDetailsRepository;
import com.csm.ORSAC.webportal.service.CommonService;
import com.csm.ORSAC.webportal.service.DashboardService;

@Controller
public class DashboardReportController extends OrsacPortalAbstractController {
	
	
	@Autowired
	AdminLevelRepository admRepo;
	
	@Autowired
	LevelDetailsRepository levelrepo;
	
	@Autowired 
	DashboardService dashboardService;
	
	@Autowired
	CommonService comonService;
	

	public static final Logger LOG = LoggerFactory.getLogger(DashboardReportController.class);

	@GetMapping(value = "Home") // welcome
	public String welcomePage1(Model model, HttpServletRequest request, HttpSession session) {
		String url="";
		int roleId=0;
		int intlevelDetailId=0;
		int distId=0;
		Object distCode=null;
		DecimalFormat df=new DecimalFormat();
		df.setMaximumFractionDigits(2);
		DecimalFormat myFormatter = new DecimalFormat("#,###");
		
		
		try {
			System.out.println("Dashboard");
			roleId= Integer.parseInt(String.valueOf(session.getAttribute("ROLE_ID")));
			if (roleId == 1 || roleId == 5) {
				long totalDistCount = dashboardService.totalDistricts();
				List<DashBoardBean> disrictWiseSurveyList = dashboardService.getdistrictWiseSurveyList();
				DashBoardBean surveyStatusBean = dashboardService.getSurveyStatus();
				double surveyPendingPerc = (Double.parseDouble(String.valueOf(surveyStatusBean.getPendingSurvey()))
						/ Double.parseDouble(String.valueOf(surveyStatusBean.getTotalSurvey()))) * 100;
				double surveyCompletedPerc = (Double.parseDouble(String.valueOf(surveyStatusBean.getCompletedSurvey()))
						/ Double.parseDouble(String.valueOf(surveyStatusBean.getTotalSurvey()))) * 100;
				long totalSurveyors = dashboardService.getTotalSurveyors();
				long newSurveyors = dashboardService.getTotalSurveyors(2);
				long approveSurvey = dashboardService.getApprovedSurvey();
				long distYetToComplete=dashboardService.getdistYetToComplete();

				model.addAttribute("districtWiseSurveyList", disrictWiseSurveyList);
				model.addAttribute("distCount", totalDistCount);
				model.addAttribute("surveyStatusBean", surveyStatusBean);
				model.addAttribute("surveyPendingPerc", df.format(surveyPendingPerc));
				model.addAttribute("surveyCompletedPerc", df.format(surveyCompletedPerc));
				model.addAttribute("totalSurveyorsCount", totalSurveyors);
				model.addAttribute("newSurveyorsCount", newSurveyors);
				model.addAttribute("approveSurveyCount", myFormatter.format(approveSurvey));
				model.addAttribute("totalSurveyCount", myFormatter.format(surveyStatusBean.getTotalSurvey()));
				model.addAttribute("totalPendingSurveyCount", myFormatter.format(surveyStatusBean.getPendingSurvey()));
				model.addAttribute("totalCompletedSurvey", myFormatter.format(surveyStatusBean.getCompletedSurvey()));
				model.addAttribute("distYetToComplete", distYetToComplete);

				url = "homeDashBoard2";

			} else {
				intlevelDetailId = Integer.parseInt(String.valueOf(session.getAttribute("OFFICE_ID")));
				Optional<AdmLevelDetails> OptAdmDto = admRepo.findById(intlevelDetailId);
				if (OptAdmDto.isPresent()) {
					AdmLevelDetails dto = OptAdmDto.get();
					System.err.println(dto.getParentId() + ": District Id");
					distId = dto.getParentId();
					distCode = levelrepo.getDistCodeByDistId(distId);
				}
				long totalPacsCount=dashboardService.fetchPacsCount(String.valueOf(distCode));
				List<DashBoardBean> pacsWiseSurveyList = dashboardService.getPacsWiseSurveyList(String.valueOf(distCode));
				DashBoardBean surveyStatusBean = dashboardService.getPacsSurveyStatus(String.valueOf(distCode));
				double surveyPendingPerc = (Double.parseDouble(String.valueOf(surveyStatusBean.getPendingSurvey()))
						/ Double.parseDouble(String.valueOf(surveyStatusBean.getTotalSurvey()))) * 100;
				double surveyCompletedPerc = (Double.parseDouble(String.valueOf(surveyStatusBean.getCompletedSurvey()))
						/ Double.parseDouble(String.valueOf(surveyStatusBean.getTotalSurvey()))) * 100;
				long totalSurveyors = dashboardService.getTotalSurveyors(String.valueOf(distCode));
				long newSurveyors = dashboardService.getTotalSurveyors(String.valueOf(distCode),2);
				long approveSurvey = dashboardService.getApprovedSurvey(String.valueOf(distCode));
				long pacsYetToComplete=dashboardService.getPacsYetToComplete(String.valueOf(distCode));
				model.addAttribute("totalPacsCount", totalPacsCount);
				model.addAttribute("pacsWiseSurveyList", pacsWiseSurveyList);
				model.addAttribute("surveyStatusBean", surveyStatusBean);
				model.addAttribute("surveyPendingPerc", df.format(surveyPendingPerc));
				model.addAttribute("surveyCompletedPerc", df.format(surveyCompletedPerc));
				model.addAttribute("totalSurveyorsCount", totalSurveyors);
				model.addAttribute("newSurveyorsCount", newSurveyors);
				model.addAttribute("approveSurveyCount", myFormatter.format(approveSurvey));
				model.addAttribute("totalSurveyCount", myFormatter.format(surveyStatusBean.getTotalSurvey()));
				model.addAttribute("totalPendingSurveyCount", myFormatter.format(surveyStatusBean.getPendingSurvey()));
				model.addAttribute("totalCompletedSurvey", myFormatter.format(surveyStatusBean.getCompletedSurvey()));
				model.addAttribute("pacsYetToComplete", pacsYetToComplete);
				url = "homeDashBoard";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url; // welcome
	}

}
