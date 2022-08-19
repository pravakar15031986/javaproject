package com.csm.ORSAC.webportal.report.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.csm.ORSAC.webportal.bean.RegistrationBean;
import com.csm.ORSAC.webportal.bean.SurveyReportBean;

public interface MISReportService {
	
	List<SurveyReportBean> viewSurveyReport(RegistrationBean regBean,HttpServletRequest request);

	SurveyReportBean fetchPlotDetailsByPlotCode(String plotcode,HttpServletRequest request);

	String actionOnSurveyDetails(SurveyReportBean surveyBean);

	List<SurveyReportBean> viewSuspectedPlotReport(RegistrationBean regBean);

}
