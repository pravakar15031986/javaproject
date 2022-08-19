package com.csm.ORSAC.adminconsole.webportal.service;

import java.util.List;

import com.csm.ORSAC.adminconsole.webportal.bean.FunctionMasterVo;
import com.csm.ORSAC.adminconsole.webportal.bean.SearchVo;

public interface ManageFunctionMasterService {

	String addFunctionMaster(FunctionMasterVo functionVo);

	List<FunctionMasterVo> retriveFunctionMasterList(SearchVo searchVo);

	FunctionMasterVo editFunctionMaster(int functionId);

	String updateFunctionMaster(FunctionMasterVo functionVo);

	String deleteFunctionMaster(String functionId);

	String checkDuplicateFunctionNameByName(String name);

	String checkDuplicateFileNameByName(String name);

	List<FunctionMasterVo> getFunctionMasterListByIds(List<Integer> functionIds);

	String changeFunctionMasterStatus(Integer functn_id, Integer status);

	String checkDuplicateFunctionNameByName(int functionId, String functionName);

	String checkDuplicateFileNameByName(int functionId, String fileName);


}
