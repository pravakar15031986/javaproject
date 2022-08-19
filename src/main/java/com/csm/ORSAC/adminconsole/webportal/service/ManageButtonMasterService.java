package com.csm.ORSAC.adminconsole.webportal.service;

import java.util.List;

import com.csm.ORSAC.adminconsole.webportal.bean.ButtonMasterVo;
import com.csm.ORSAC.adminconsole.webportal.bean.FunctionMasterVo;
import com.csm.ORSAC.adminconsole.webportal.bean.SearchVo;

public interface ManageButtonMasterService {

	List<FunctionMasterVo> getFunctionList();

	String addButtonMaster(ButtonMasterVo buttonVo);

	List<ButtonMasterVo> viewButtonMasterList(SearchVo searchVo);

	ButtonMasterVo editButtonMaster(int buttonId);

	String updateButtonMaster(ButtonMasterVo buttonVo);

	String deleteButtonMaster(int buttonId);

	String chkDuplicateButtonNameByName(String buttonName);

	String chkButtonMasterFileNameByName(String fileName);

	int getMaxSlNo();

}
