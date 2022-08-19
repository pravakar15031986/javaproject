package com.csm.ORSAC.webportal.service;

import java.util.List;

import com.csm.ORSAC.webportal.bean.DashBoardBean;

public interface DashboardService {
	
	 long totalDistricts();

	 List<DashBoardBean> getdistrictWiseSurveyList();
	
	 DashBoardBean getSurveyStatus();

	 long getTotalSurveyors();

	 long getTotalSurveyors(int i);

	 long getApprovedSurvey();

	 long fetchPacsCount(String distCode);

	List<DashBoardBean> getPacsWiseSurveyList(String distcode);

	DashBoardBean getPacsSurveyStatus(String distCode);

	long getTotalSurveyors(String distcode);

	long getTotalSurveyors(String distCode, int i);

	long getApprovedSurvey(String distCode);

	long getdistYetToComplete();

	long getPacsYetToComplete(String  distCode);
	
	

}
