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
import com.csm.ORSAC.adminconsole.webportal.bean.TabMasterVo;
import com.csm.ORSAC.adminconsole.webportal.repository.ManageTabMasterRepository;
import com.csm.ORSAC.adminconsole.webportal.service.ManageTabMasterService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Service("tabMasterService")
public class ManageTabMasterServiceImpl implements ManageTabMasterService {

	public static final Logger LOG = LoggerFactory.getLogger(ManageTabMasterServiceImpl.class);

	@Autowired
	private ManageTabMasterRepository tabMasterRepository;

	@Override
	public List<FunctionMasterVo> getFunctionList() {
		List<FunctionMasterVo> functionList = new ArrayList<>();
		FunctionMasterVo data = null;
		try {
			List<Object[]> FunctionMasterVo = tabMasterRepository.getFuctionList(); // Retrieve function list from Data
																					// Base using HQL
			for (Object[] obj : FunctionMasterVo) {
				data = new FunctionMasterVo();
				data.setFunctionId((int) obj[0]);
				data.setFunctionName((String) obj[1]);
				functionList.add(data);
			}
		} catch (Exception e) {
			LOG.error("ManageTabMasterServiceImpl::getFunctionList():" + e);
		}
		return functionList;
	}

	

	@Override
	public List<ButtonMasterVo> getButtonList(int id) {
		List<ButtonMasterVo> buttonList = new ArrayList<>();
		ButtonMasterVo data = null;
		try {

			List<Object[]> ButtonMasterVo = tabMasterRepository.getButtonList(id); // Retrieve Button list from Data
																					// Base using HQL
			for (Object[] obj : ButtonMasterVo) {
				data = new ButtonMasterVo();
				data.setButtonId((int) obj[0]);
				data.setButtonName((String) obj[1]);
				buttonList.add(data);
			}
		} catch (Exception e) {
			LOG.error("ManageTabMasterServiceImpl::getButtonList():" + e);
		}
		return buttonList;
	}

	@Override
	public String addTabMaster(TabMasterVo tabMasterVo) {
		String result = "";
		try {
			tabMasterRepository.save(tabMasterVo); /* Save Tab Master data to Data Base using JpaRepository save() */
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageTabMasterServiceImpl::addTabMaster():" + e);
		}
		return result;
	}

	@Override
	public List<TabMasterVo> viewTabMasterList(SearchVo searchVo) {
		List<TabMasterVo> tabList = new ArrayList<>();
		TabMasterVo vo = null;
		List<Object[]> obj = null;
		int condition = 0;
		try {
			if (searchVo.getDataId() != 0) {
				if (searchVo.getDataId() == 1) {
					condition = 0;
				} else if (searchVo.getDataId() == 2) {
					condition = 1;
				}
				obj = tabMasterRepository.searchTabRecordsByStatus(condition);

			} else {
				obj = tabMasterRepository.getTabRecords();
			}

			if (!obj.isEmpty()) {
				for (Object[] dto : obj) {
					vo = new TabMasterVo();
					vo.setTabId((int) dto[0]);
					vo.setTabName(String.valueOf(dto[1]));
					vo.setDescription(String.valueOf(dto[2]));
					vo.setAddData((String) dto[3]);
					vo.setViewData((String) dto[4]);
					vo.setManageData((String) dto[5]);
					vo.setBitStatus((int) (dto[6]));
					vo.setIntSortNum((String) dto[7]);
					vo.setFileName((String) dto[8]);
					vo.setFunctionId((int) dto[9]);
					vo.setFunctionName((String) dto[10]);
					vo.setButtonId((int) dto[11]);
					vo.setButtonName((String) dto[12]);
					tabList.add(vo);

				}

			}

		} catch (Exception e) {
			LOG.error("ManageTabMasterServiceImpl::viewTabMasterList():" + e);
		}
		return tabList;
	}

	@Override
	public TabMasterVo getTabMasterDataById(int tabId) {
		TabMasterVo object = null;
		try {
			object = tabMasterRepository.findByTabId(tabId);

		} catch (Exception e) {
			LOG.error("ManageTabMasterServiceImpl::getTabMasterDataById():" + e);
		}
		return object;
	}

	@Override
	public String updateTabMaster(TabMasterVo tabMasterVo) {
		String result = "";
		try {

			tabMasterRepository.save(tabMasterVo);
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageTabMasterServiceImpl::updateTabMaster():" + e);
		}
		return result;
	}

	@Override
	public String deleteTabMaster(int tabId) {
		String result = "";
		try {

			tabMasterRepository.deleteTabMaster(tabId);
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageTabMasterServiceImpl::deleteTabMaster():" + e);
		}
		return result;
	}

	@Override
	public String chkTabMasterNameByName(String tabName) {
		List<TabMasterVo> tabListName = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			tabListName = tabMasterRepository.findByTabNameByName(tabName);
			if (!tabListName.isEmpty()) {
				result = OrsacPortalConstant.EXIST;

			}

		} catch (Exception e) {
			LOG.error("ManageTabMasterServiceImpl::chkTabMasterNameByName():" + e);
		}
		return result;
	}

	@Override
	public String chkTabFileNameByFileName(String tab_file_name) {
		List<TabMasterVo> fileListName = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			fileListName = tabMasterRepository.findByTabFileNameByFileName(tab_file_name);
			if (!fileListName.isEmpty()) {
				result = OrsacPortalConstant.EXIST;

			}

		} catch (Exception e) {
			LOG.error("ManageTabMasterServiceImpl::chkTabFileNameByFileName():" + e);
		}
		return result;
	}

	@Override
	public int getMaxSlNo() {
		int maxSlNo = 0;
		try {

			maxSlNo = tabMasterRepository.getMaxSlNo();

			maxSlNo = maxSlNo + 1;
		} catch (Exception e) {
			LOG.error("ManageTabMasterServiceImpl::getMaxSlNo():" + e);
		}
		return maxSlNo;
	}

}
