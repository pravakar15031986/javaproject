package com.csm.ORSAC.webportal.service;

import java.util.List;

import com.csm.ORSAC.webportal.bean.PendingPlotsDataBean;
import com.csm.ORSAC.webportal.bean.TakeActionBean;
import com.csm.ORSAC.webportal.bean.VillageDataBean;

public interface SurveyService {
	

	List<VillageDataBean> getVillageList(String userId);

	List<PendingPlotsDataBean> getPendingPlots(String villageId, String userId);

	String takeAction(TakeActionBean takeActionBean);

	String checkTakeAction(String plotCode);

}
