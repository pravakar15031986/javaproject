package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.adminconsole.webportal.bean.ButtonMasterVo;
import com.csm.ORSAC.adminconsole.webportal.bean.FunctionMasterVo;
import com.csm.ORSAC.adminconsole.webportal.bean.SearchVo;
import com.csm.ORSAC.adminconsole.webportal.repository.ManageButtonMasterServiceRepository;
import com.csm.ORSAC.adminconsole.webportal.service.ManageButtonMasterService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Service("buttonMasterService")
public class ManageButtonMasterServiceImpl implements ManageButtonMasterService {

	public static final Logger LOG = LoggerFactory.getLogger(ManageButtonMasterServiceImpl.class);

	@Autowired
	private ManageButtonMasterServiceRepository buttonMasterRepository;

	@Override
	public List<FunctionMasterVo> getFunctionList() {
		List<FunctionMasterVo> functionList = new ArrayList<>();
		FunctionMasterVo data = null;
		try {
			List<Object[]> FunctionMasterVo = buttonMasterRepository.getFuctionList(); // Retrieve function list from
																						// Data Base using HQL
			for (Object[] obj : FunctionMasterVo) {
				data = new FunctionMasterVo();
				data.setFunctionId((int) obj[0]);
				data.setFunctionName((String) obj[1]);
				functionList.add(data);
			}
		} catch (Exception e) {
			LOG.error("ManageButtonMasterServiceImpl::getFunctionList():" + e);
		}
		return functionList;
	}

	@Override
	public String addButtonMaster(ButtonMasterVo buttonVo) {
		String result = "";
		try {
			buttonMasterRepository.save(buttonVo); /* Save Button Master data to Data Base using JpaRepository save() */
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageButtonMasterServiceImpl::addButtonMaster():" + e);
		}
		return result;
	}

	@Override
	public List<ButtonMasterVo> viewButtonMasterList(SearchVo searchVo) {
		List<ButtonMasterVo> buttonList = new ArrayList<>();
		ButtonMasterVo vo = null;
		int condition = 0;
		List<Object[]> obj = null;
		try {
			LOG.info("ManageButtonMasterServiceImpl::Status is:" + searchVo.getDataId());

			if (searchVo.getDataId() != 0) {
				if (searchVo.getDataId() == 1) {
					condition = 0;
				} else if (searchVo.getDataId() == 2) {
					condition = 1;
				}
				obj = buttonMasterRepository.searchButtonListByStatus(condition);

			} else {
				obj = buttonMasterRepository.viewButtonList();
			}

			if (!obj.isEmpty()) {
				for (Object[] dto : obj) {
					vo = new ButtonMasterVo();
					vo.setButtonId((int) dto[0]);
					vo.setButtonName(String.valueOf(dto[1]));
					vo.setFileName((String) dto[2]);
					vo.setDescription(String.valueOf(dto[3]));
					vo.setAddData((String) dto[4]);
					vo.setViewData((String) dto[5]);
					vo.setManageData((String) dto[6]);
					vo.setBitStatus((int) (dto[7]));
					vo.setFunctionId((int) dto[8]);
					vo.setFunctionName((String) dto[9]);
					buttonList.add(vo);

				}

			}
		} catch (Exception e) {
			LOG.error("ManageButtonMasterServiceImpl::viewButtonMasterList():" + e);
		}
		return buttonList;
	}

	@Override
	public ButtonMasterVo editButtonMaster(int buttonId) {
		ButtonMasterVo object = null;
		try {
			object = buttonMasterRepository.findByButtonId(buttonId);

		} catch (Exception e) {
			LOG.error("ManageButtonMasterServiceImpl::editButtonMaster():" + e);
		}
		return object;
	}

	@Override
	public String updateButtonMaster(ButtonMasterVo buttonVo) {
		String result = "";
		try {
			LOG.info("ManageButtonMasterServiceImpl::button id in button service impl" + buttonVo.getButtonId());
			buttonMasterRepository.save(buttonVo);
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageButtonMasterServiceImpl::updateButtonMaster():" + e);
		}
		return result;
	}

	@Override
	public String deleteButtonMaster(int buttonId) {
		String result = "";
		try {
			LOG.info("ManageButtonMasterServiceImpl::Button id in Button Master service impl" + buttonId);
			buttonMasterRepository.deleteButtonMaster(buttonId);
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageButtonMasterServiceImpl::deleteButtonMaster():" + e);
		}
		return result;
	}

	@Override
	public String chkDuplicateButtonNameByName(String buttonName) {
		List<ButtonMasterVo> buttonMasterName = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			buttonMasterName = buttonMasterRepository.findByButtonNameByName(buttonName);
			if (!buttonMasterName.isEmpty()) {
				result = "Exist";
				LOG.info("ManageButtonMasterServiceImpl::Number of existing name:" + buttonMasterName.size());
			}

		} catch (Exception e) {
			LOG.error("ManageButtonMasterServiceImpl::chkDuplicateButtonNameByName():" + e);
		}
		return result;
	}

	@Override
	public String chkButtonMasterFileNameByName(String fileName) {
		List<ButtonMasterVo> buttonFileName = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			buttonFileName = buttonMasterRepository.findByFileNameByName(fileName);
			if (!buttonFileName.isEmpty()) {
				result = OrsacPortalConstant.EXIST;
				LOG.info("ManageButtonMasterServiceImpl::Number of existing name:" + buttonFileName.size());
			}

		} catch (Exception e) {
			LOG.error("ManageButtonMasterServiceImpl::chkButtonMasterFileNameByName():" + e);
		}
		return result;
	}

	@Override
	public int getMaxSlNo() {
		int maxSlNo = 0;
		try {
			maxSlNo = buttonMasterRepository.getMaxSlNo();
			maxSlNo = maxSlNo + 1;
		} catch (Exception e) {
			LOG.error("ManageButtonMasterServiceImpl::getMaxSlNo():" + e);
		}
		return maxSlNo;
	}

}
