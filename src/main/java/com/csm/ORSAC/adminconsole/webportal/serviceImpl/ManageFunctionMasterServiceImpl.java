package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csm.ORSAC.adminconsole.webportal.bean.FunctionMasterVo;
import com.csm.ORSAC.adminconsole.webportal.bean.SearchVo;
import com.csm.ORSAC.adminconsole.webportal.entity.PrimaryLink;
import com.csm.ORSAC.adminconsole.webportal.repository.ManageFunctionMasterRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.PrimaryLinkRepository;
import com.csm.ORSAC.adminconsole.webportal.service.ManageFunctionMasterService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Transactional
@Service("functionMasterService")
public class ManageFunctionMasterServiceImpl implements ManageFunctionMasterService {

	public static final Logger LOG = LoggerFactory.getLogger(ManageFunctionMasterServiceImpl.class);

	@Autowired
	// @Inject
	private ManageFunctionMasterRepository functionMasterRepository;

	
	@Autowired
	PrimaryLinkRepository primaryLinkRepository;

	@Override
	public String addFunctionMaster(FunctionMasterVo functionVo) {

		String result = "";
		try {
			functionMasterRepository
					.save(functionVo); /* Save Function Master data to Data Base using JpaRepository save() */
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::addFunctionMaster():" + e);
		}
		return result;
	}

	@Override
	public List<FunctionMasterVo> retriveFunctionMasterList(SearchVo searchVo) {
		List<FunctionMasterVo> functionList = new ArrayList<>();
		List<FunctionMasterVo> dataList = new ArrayList<>();
		FunctionMasterVo vo = null;
		List<Object[]> obj = null;
		int id = -1;
		try {

			if (searchVo.getDataId() == 1 || searchVo.getDataId() == 2) {

				if (searchVo.getDataId() == 1) {
					id = 0;
					obj = functionMasterRepository.findByBitStatus(false);

				} else if (searchVo.getDataId() == 2) {
					id = 1;
					obj = functionMasterRepository.findByBitStatus(true);

				}

				if (!obj.isEmpty()) {
					for (Object[] dto : obj) {
						vo = new FunctionMasterVo();
						vo.setFunctionId((int) dto[0]);
						vo.setFunctionName(String.valueOf(dto[1]));
						vo.setFileName(String.valueOf(dto[2]));
						vo.setDescription(String.valueOf(dto[3]));
						vo.setBitStatus((Boolean) (dto[4]));
						dataList.add(vo);

					}
					LOG.info("ManageFunctionMasterServiceImpl::view List size of primary link" + functionList.size());
				}
			} else {
				dataList = functionMasterRepository.findAll();
			}

			for (int i = dataList.size() - 1; i >= 0; i--) {
				functionList.add(dataList.get(i));
			}
		
			LOG.info("ManageFunctionMasterServiceImpl::view Function list size" + functionList.size());

		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::retriveFunctionMasterList():" + e);
		}
		return functionList;
	}


	@Override
	public FunctionMasterVo editFunctionMaster(int functionId) {
		FunctionMasterVo object = null;
		try {
			object = functionMasterRepository.findByFunctionId(functionId);

		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::editFunctionMaster():" + e);
		}
		return object;
	}

	@Override
	public String updateFunctionMaster(FunctionMasterVo functionVo) {
		String result = "";
		try {
			LOG.info("ManageFunctionMasterServiceImpl::Function id in function service impl"
					+ functionVo.getFunctionId());
			functionMasterRepository.save(functionVo);
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::updateFunctionMaster():" + e);
		}
		return result;
	}

	

	@Override
	public String deleteFunctionMaster(String functionId) {
		String result = "";
		try {
			LOG.info("ManageFunctionMasterServiceImpl::Function id in function service impl" + functionId);
			functionMasterRepository.deleteFunctionMaster(Integer.parseInt(functionId));
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::deleteFunctionMaster():" + e);
		}
		return result;
	}

	@Override
	public String checkDuplicateFunctionNameByName(String name) {
		List<FunctionMasterVo> functionName = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			functionName = functionMasterRepository.findByDuplicateFunctionname(name);
			if (!functionName.isEmpty()) {
				result = OrsacPortalConstant.EXIST;
				LOG.info("ManageFunctionMasterServiceImpl::Number of existing name:" + functionName.size());
			}

		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::checkDuplicateFunctionNameByName():" + e);
		}
		return result;
	}

	@Override
	public String checkDuplicateFileNameByName(String name) {
		List<FunctionMasterVo> fileName = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			fileName = functionMasterRepository.checkDuplicateFileNameByName(name);
			if (!fileName.isEmpty()) {
				result = OrsacPortalConstant.EXIST;
				LOG.info("ManageFunctionMasterServiceImpl::Number of existing File name:" + fileName.size());
			}

		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::checkDuplicateFileNameByName():" + e);
		}
		return result;
	}

	@Override
	public List<FunctionMasterVo> getFunctionMasterListByIds(List<Integer> functionIds) {
		List<FunctionMasterVo> functionMasterList = new ArrayList<>();
		try {
			functionMasterList = functionMasterRepository.findAllById(functionIds);
		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::getFunctionMasterListByIds():" + e);
		}
		return functionMasterList;
	}

	@Override
	public String changeFunctionMasterStatus(Integer functn_id, Integer status) {
		String sts = "";
		try {
			FunctionMasterVo obj = new FunctionMasterVo();
			LOG.info("obj"+obj);
			obj = functionMasterRepository.findByFunctionId(functn_id);

			if (status == 0) {
				obj.setBitStatus(false);
			} else {
				List<PrimaryLink> list = primaryLinkRepository.findFunctionIdByFunctionId(functn_id);
				if (list.isEmpty()) {
					obj.setBitStatus(true);
				} else {
					return OrsacPortalConstant.DEPENDENT;
				}
			}

			obj.setIntUpdatedBy(1);// setting a default super admin id 1
			obj = functionMasterRepository.saveAndFlush(obj);

			LOG.info("obj"+obj);
			
			sts = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::changeFunctionMasterStatus():" + e);
			sts = OrsacPortalConstant.FAILURE;
		}
		return sts;
	}

	@Override
	public String checkDuplicateFunctionNameByName(int id, String name) {
		List<FunctionMasterVo> functionName = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			functionName = functionMasterRepository.findByDuplicateFunctionname(id, name);
			if (!functionName.isEmpty()) {
				result = OrsacPortalConstant.EXIST;
				LOG.info("ManageFunctionMasterServiceImpl::Number of existing name:" + functionName.size());
			}

		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::checkDuplicateFunctionNameByName():" + e);
		}
		return result;
	}

	@Override
	public String checkDuplicateFileNameByName(int id, String name) {
		List<FunctionMasterVo> fileName = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			fileName = functionMasterRepository.checkDuplicateFileNameByName(id, name);
			if (!fileName.isEmpty()) {
				result = OrsacPortalConstant.EXIST;
				LOG.info("ManageFunctionMasterServiceImpl::checkDuplicateFileNameByName():->Number of existing File name:" + fileName.size());
			}

		} catch (Exception e) {
			LOG.error("ManageFunctionMasterServiceImpl::checkDuplicateFileNameByName():" + e);
		}
		return result;
	}

}
