package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.adminconsole.webportal.bean.SearchVo;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLink;
import com.csm.ORSAC.adminconsole.webportal.entity.PrimaryLink;
import com.csm.ORSAC.adminconsole.webportal.repository.ManageGlobalLinkRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.PrimaryLinkRepository;
import com.csm.ORSAC.adminconsole.webportal.service.ManageGlobalLinkService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Service("globalLinkservice")
public class ManageGlobalLinkServiceImpl implements ManageGlobalLinkService {

	public static final Logger LOG = LoggerFactory.getLogger(ManageGlobalLinkServiceImpl.class);

	@Autowired
	private ManageGlobalLinkRepository globalLinkRepository;
	@Autowired
	PrimaryLinkRepository primaryLinkRepository;

	@Override
	public int getMaxSlNumber() {
		int maxSlNumber = 0;
		try {
			maxSlNumber = globalLinkRepository.getMaxSerialNo();
			maxSlNumber = maxSlNumber + 1;

		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::getMaxSlNumber():" + e);
		}
		return maxSlNumber;
	}

	@Override
	public String addGlobalLink(GlobalLink globalVo) {
		String result = "";
		try {
			globalLinkRepository.save(globalVo); /* Save Global Link data to Data Base using JpaRepository save() */
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::addGlobalLink():" + e);
		}
		return result;
	}

	@Override
	public List<GlobalLink> retrieveGloballist(SearchVo searchVo) {
		List<GlobalLink> globalList = new ArrayList<>();
		List<GlobalLink> dataList = new ArrayList<>();
		GlobalLink vo = null;
		List<Object[]> obj = null;
		int id = -1;
		try {

			if (searchVo.getDataId() == 1 || searchVo.getDataId() == 2) {
				if (searchVo.getDataId() == 1) {
					id = 0;
					obj = globalLinkRepository.findByBitStatus(false);

				} else if (searchVo.getDataId() == 2) {
					id = 1;
					obj = globalLinkRepository.findByBitStatus(true);

				}
				if (!obj.isEmpty()) {
					for (Object[] dto : obj) {
						vo = new GlobalLink();
						vo.setGlobalLinkId((int) dto[0]);
						vo.setGlobalLinkName(String.valueOf(dto[1]));
						vo.setBitStatus((Boolean) (dto[3]));
						vo.setVchicon(String.valueOf(dto[4]));
						dataList.add(vo);

					}

					LOG.info("ManageGlobalLinkServiceImpl::view List size of global link" + globalList.size());
				}
			} else {
				dataList = globalLinkRepository.findAll();
			}

			for (int i = dataList.size() - 1; i >= 0; i--) {
				globalList.add(dataList.get(i));
			}
			LOG.info("ManageGlobalLinkServiceImpl::view global list size" + globalList.size());
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::retriveGloballist():" + e);
		}
		return globalList;
	}

	@Override
	public GlobalLink editGlobalLink(int globalLinkId) {
		GlobalLink object = null;
		try {
			object = globalLinkRepository.findByGlobalLinkId(globalLinkId);

		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::editGlobalLink():" + e);
		}
		return object;
	}

	@Override
	public String updateGlobalLink(GlobalLink globalVo) {
		String result = "";
		try {
			globalLinkRepository.save(globalVo);
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::updateGlobalLink():" + e);
		}
		return result;
	}

	@Override
	public String deleteGlobalLink(int globalLinkId) {

		String result = "";
		try {
			LOG.info("ManageGlobalLinkServiceImpl::globalLinkId" + globalLinkId);
			globalLinkRepository.deleteGlobalLink(globalLinkId);
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::deleteGlobalLink():" + e);
		}
		return result;
	}

	@Override
	public String chkGlobalLinkName(String glinkName) {
		List<GlobalLink> globalLink = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			globalLink = globalLinkRepository.checkDuplicateGlobalLinkNameByName(glinkName);
			if (!globalLink.isEmpty()) {
				result = OrsacPortalConstant.EXIST;
				LOG.info("ManageGlobalLinkServiceImpl::Number of existing global name:" + globalLink.size());
			}

		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::chkGlobalLinkName():" + e);
		}
		return result;
	}

	@Override
	public String chkGlobalLinkName(String glinkName, int globalLinkId) {
		List<GlobalLink> globalLink = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			globalLink = globalLinkRepository.checkDuplicateGlobalLinkNameByName(glinkName, globalLinkId);
			if (!globalLink.isEmpty()) {
				result = OrsacPortalConstant.EXIST;
				LOG.info("ManageGlobalLinkServiceImpl::Number of existing global name:" + globalLink.size());
			}

		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::chkGlobalLinkName():" + e);
		}
		return result;
	}

	@Override
	public List<GlobalLink> getGlobalLinkList() {
		List<GlobalLink> list = new ArrayList<>();
		try {
			list = globalLinkRepository.findAll();
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::getGlobalLinkList():" + e);
		}

		return list;
	}

	@Override
	public List<GlobalLink> getGlobalLinkMapPrimaryLink() {
		try {
			return globalLinkRepository.getGloballinkMappedPrimaryLinks();
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::getGlobalLinkMapPrimaryLink():" + e);

		}
		return Collections.emptyList(); 
	}

	@Override
	public List<GlobalLink> getGlobalLinkListById(Set<Integer> globalLinkIds) {
		List<GlobalLink> globalLink = new ArrayList<>();
		try {
			globalLink = globalLinkRepository.findAllById(globalLinkIds);

		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::getGlobalLinkListById():" + e);

		}
		return globalLink;
	}

	@Override
	public String changeGlobalLinkStatus(Integer gl_id, Integer status) {
		String sts = "";
		try {
			GlobalLink obj = new GlobalLink();
			obj = globalLinkRepository.findByGlobalLinkId(gl_id);

			if (status == 0) {
				obj.setBitStatus(false);
			} else {
				List<PrimaryLink> list = primaryLinkRepository.findGlobalLinkIdByGlobalLinkId(gl_id);
				if (list.isEmpty()) {
					obj.setBitStatus(true);
				} else {
					return OrsacPortalConstant.DEPENDENT;
				}
			}

			obj.setDtmUpdatedOn(new Timestamp(new java.util.Date().getTime()));
			obj.setIntUpdatedBy(1);// setting a default super admin id 1
			obj = globalLinkRepository.saveAndFlush(obj);
			
			LOG.info("obj"+obj);

			return sts = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManageGlobalLinkServiceImpl::changeGlobalLinkStatus():" + e);

			sts = OrsacPortalConstant.FAILURE;
		}
		return sts;
	}

}
