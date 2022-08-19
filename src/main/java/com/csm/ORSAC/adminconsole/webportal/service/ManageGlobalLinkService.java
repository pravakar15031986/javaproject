package com.csm.ORSAC.adminconsole.webportal.service;

import java.util.List;
import java.util.Set;

import com.csm.ORSAC.adminconsole.webportal.bean.SearchVo;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLink;

public interface ManageGlobalLinkService {

	String addGlobalLink(GlobalLink globalVo);

	List<GlobalLink> retrieveGloballist(SearchVo searchVo);

	GlobalLink editGlobalLink(int globalLinkId);

	String updateGlobalLink(GlobalLink globalVo);

	String deleteGlobalLink(int globalLinkId);

	String chkGlobalLinkName(String glinkName);

	int getMaxSlNumber();

	List<GlobalLink> getGlobalLinkList();

	List<GlobalLink> getGlobalLinkMapPrimaryLink();

	List<GlobalLink> getGlobalLinkListById(Set<Integer> globalLinkIds);

	String changeGlobalLinkStatus(Integer gl_id, Integer status);

	String chkGlobalLinkName(String globalLinkName, int globalLinkId);

}
