package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.adminconsole.webportal.bean.FunctionMasterVo;
import com.csm.ORSAC.adminconsole.webportal.bean.GlobalLinkVo;
import com.csm.ORSAC.adminconsole.webportal.bean.PrimaryLinkBean;
import com.csm.ORSAC.adminconsole.webportal.bean.SearchVo;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLink;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLinkAccess;
import com.csm.ORSAC.adminconsole.webportal.entity.PrimaryLink;
import com.csm.ORSAC.adminconsole.webportal.repository.GroupLinkAccessRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.ManageGlobalLinkRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.ManagePrimaryLinkRepository;
import com.csm.ORSAC.adminconsole.webportal.repository.PrimaryLinkRepository;
import com.csm.ORSAC.adminconsole.webportal.service.ManageFunctionMasterService;
import com.csm.ORSAC.adminconsole.webportal.service.ManageGlobalLinkService;
import com.csm.ORSAC.adminconsole.webportal.service.ManagePrimaryLinkService;
import com.csm.ORSAC.adminconsole.webportal.util.GlobalinkComparator;
import com.csm.ORSAC.adminconsole.webportal.util.PrimaryLinkComparator;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Service("primaryLinkservice")
public class ManagePrimaryLinkServiceImpl implements ManagePrimaryLinkService {

	public static final Logger LOG = LoggerFactory.getLogger(ManagePrimaryLinkServiceImpl.class);

	@Autowired
	private ManagePrimaryLinkRepository primaryLinkRepository;
	@Autowired
	GroupLinkAccessRepository groupLinkAccessRepository;

	@Autowired
	@Qualifier("globalLinkRepository")
	ManageGlobalLinkRepository glinkRepo;

	@Autowired
	@Qualifier("primaryLnkRepository")
	private PrimaryLinkRepository primaryLnkRepository;

	@Autowired
	@Qualifier("globalLinkservice")
	private ManageGlobalLinkService globalLinkservice;

	@Autowired
	@Qualifier("functionMasterService")
	ManageFunctionMasterService functionMasterService;

	@Override
	public List<GlobalLinkVo> getGlobalLink() {
		List<GlobalLinkVo> globalList = new ArrayList<>();
		GlobalLinkVo data = null;
		try {
			List<Object[]> globalVo = glinkRepo.findByBitStatus(false);
			for (Object[] obj : globalVo) {
				data = new GlobalLinkVo();
				data.setGlobalLinkId((int) obj[0]);
				data.setGlobalLinkName((String) obj[1]);

				globalList.add(data);
			}
		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::getGlobalLink():" + e);
		}
		return globalList;
	}

	@Override
	public List<FunctionMasterVo> getFunctionList() {
		List<FunctionMasterVo> functionList = new ArrayList<>();
		FunctionMasterVo data = null;
		try {
			List<Object[]> FunctionMasterVo = primaryLinkRepository.getFuctionList(); // Retrieve function list from Data Base using HQL
																						
			for (Object[] obj : FunctionMasterVo) {
				data = new FunctionMasterVo();
				data.setFunctionId((int) obj[0]);
				data.setFunctionName((String) obj[1]);
				functionList.add(data);
			}
		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::getFunctionList():" + e);
		}
		return functionList;
	}

	@Override
	public String addPrimaryLink(PrimaryLinkBean primarylinkVo) {
		String result = "";
		try {
			primaryLinkRepository
					.save(primarylinkVo); /* Save Primary Link data to Data Base using JpaRepository save() */
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::addPrimaryLink():" + e);
		}
		return result;
	}

	@Override
	public Set<PrimaryLinkBean> getPrimaryLinks(Set<Integer> set) {
		Set<PrimaryLinkBean> set_plink = null;
		try {
			set_plink = new HashSet<>(primaryLinkRepository.findAllById(set));

		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::getPrimaryLinks():" + e);
		}
		return set_plink;
	}

	@Override
	public List<PrimaryLinkBean> getAllPrimaryLinks() {
		try {
			return primaryLinkRepository.findAll(); // Get all primary links
		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::getAllPrimaryLinks():" + e);
		}
		return Collections.emptyList(); 
	}

	@Override
	public List<PrimaryLinkBean> viewPrimaryLinks(SearchVo searchVo) {
		List<PrimaryLinkBean> primaryList = new ArrayList<>();
		PrimaryLinkBean vo = null;
		boolean condition = false;
		List<Object[]> obj = null;
		try {

			if (searchVo.getDataId() != 0) {
				if (searchVo.getDataId() == 1) {
					condition = false;
				} else if (searchVo.getDataId() == 2) {
					condition = true;
				}
				obj = primaryLinkRepository.viewPrimaryLinkList(condition);

			} else {
				obj = primaryLinkRepository.viewPrimaryLinkList();
			}
			if (!obj.isEmpty()) {
				for (Object[] dto : obj) {
					vo = new PrimaryLinkBean();
					vo.setPrimaryLinkId((int) dto[0]);
					vo.setPrimaryLinkName(String.valueOf(dto[1]));
					vo.setBitLinkType((int) dto[2]);
					vo.setBitShowOnHomePage((int) dto[3]);
					vo.setBitStatus((Boolean) (dto[4]));
					vo.setGlobalLinkId((int) (dto[5]));
					vo.setGlobalLinkName(String.valueOf(dto[6]));
					vo.setFunctionId((int) dto[7]);
					vo.setFunctionName((String) dto[8]);
					primaryList.add(vo);

				}
				LOG.info("ManagePrimaryLinkServiceImpl::view List size of primary link" + primaryList.size());
			}
		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::viewPrimaryLinks():" + e);
		}
		return primaryList;
	}

	@Override
	public PrimaryLinkBean editPrimaryLink(int primaryLinkId) {
		PrimaryLinkBean object = null;
		try {
			object = primaryLinkRepository.findByPrimaryLinkId(primaryLinkId);

		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::editPrimaryLink():" + e);
		}
		return object;
	}

	@Override
	public String updatePrimarylink(PrimaryLinkBean primarylinkVo) {
		String result = "";
		try {
			LOG.info("ManagePrimaryLinkServiceImpl::Primary Link id in Primary service impl"
					+ primarylinkVo.getPrimaryLinkId());
			primaryLinkRepository.save(primarylinkVo);
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::updatePrimaryLink():" + e);
		}
		return result;
	}

	@Override
	public String deletePrimaryLink(int primaryLinkId) {
		String result = "";
		try {
			LOG.info("ManagePrimaryLinkServiceImpl::Primary Link service impl" + primaryLinkId);
			primaryLinkRepository.deletePrimaryLink(primaryLinkId);
			result = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::deletePrimaryLink():" + e);
		}
		return result;
	}

	@Override
	public String chkDuplicatePrimaryLinkNameByName(String name) {
		List<PrimaryLinkBean> primaryLinkName = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			primaryLinkName = primaryLinkRepository.chkDuplicatePrimaryLinkNameByName(name);
			if (!primaryLinkName.isEmpty()) {
				result = OrsacPortalConstant.EXIST;
				LOG.info("ManagePrimaryLinkServiceImpl::Number of existing File name:" + primaryLinkName.size());
			}

		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::chkDuplicatePrimaryLinkNameByName():" + e);
		}
		return result;
	}

	@Override
	public String chkDuplicatePrimaryLinkNameByName(int plid, String name) {
		List<PrimaryLinkBean> primaryLinkName = new ArrayList<>();
		String result = OrsacPortalConstant.NOT_EXIST;
		try {
			primaryLinkName = primaryLinkRepository.chkDuplicatePrimaryLinkNameByName(plid, name);
			if (!primaryLinkName.isEmpty()) {
				result = OrsacPortalConstant.EXIST;
				LOG.info("ManagePrimaryLinkServiceImpl::Number of existing File name:" + primaryLinkName.size());
			}

		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::chkDuplicatePrimaryLinkNameByName():" + e);
		}
		return result;
	}

	@Override
	public int getMaxSlNumber() {
		int maxSlNumber = 0;
		try {
			maxSlNumber = primaryLinkRepository.getMaxSerialNo();
			maxSlNumber = maxSlNumber + 1;

		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::getMaxSlNumber():" + e);
		}
		return maxSlNumber;
	}

	@Override
	public Map<String, List<PrimaryLink>> findUserLeftMenuById(int userId) {
		Map<String, List<PrimaryLink>> map = new LinkedHashMap<>();
		try {

			List<PrimaryLink> pLinks1 = primaryLnkRepository.findUserPrimaryLinkById(userId); // fetch user's primary
																								// link comparing with
																								// group link access
																								// intGroupid i.e.
																								// role id

			

			Set<PrimaryLink> primaryLinks = new LinkedHashSet<>();
			primaryLinks.addAll(pLinks1);
			

			Set<Integer> globalLinkIds = new HashSet<>();
			List<Integer> functionIds = new LinkedList<>();
			for (PrimaryLink plink : primaryLinks) {
				globalLinkIds.add(plink.getGlobalLinkId());
				functionIds.add(plink.getFunctionId());
			}
			List<GlobalLink> globalLinks = globalLinkservice.getGlobalLinkListById(globalLinkIds);
			// sort globallinks
			Collections.sort(globalLinks, new GlobalinkComparator());
			List<FunctionMasterVo> functionList = functionMasterService.getFunctionMasterListByIds(functionIds);

			// setting file url from function master
			for (PrimaryLink plink : primaryLinks) {
				Integer function_Id = plink.getFunctionId();
				functionList.forEach(new Consumer<FunctionMasterVo>() {
					@Override
					public void accept(FunctionMasterVo obj) {
						if (obj.getFunctionId() == function_Id)
							plink.setFileName(obj.getFileName());
					}
				});
			}

			for (GlobalLink glink : globalLinks) {
				String glinkName = glink.getGlobalLinkName();
				List<PrimaryLink> plinks = primaryLinks.stream()
						.filter(p -> p.getGlobalLinkId() == glink.getGlobalLinkId()).collect(Collectors.toList());
				// sorting primary links
				Collections.sort(plinks, new PrimaryLinkComparator());
				map.put(glinkName, plinks);
			}

		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::findUserLeftMenuById():" + e);
		}
		return map;

	}

	@Override
	public Map<GlobalLink, List<PrimaryLink>> findUserLeftMenuByUserId(int userId) {
		Map<GlobalLink, List<PrimaryLink>> map = new LinkedHashMap<>();
		try {

			List<PrimaryLink> pLinks1 = primaryLnkRepository.findUserPrimaryLinkById(userId); // fetch user's primary
																								// link comparing with
																								// group link access
																								// intGroupid(i.e.
																								// role_id)

			

			Set<PrimaryLink> primaryLinks = new LinkedHashSet<>();
			primaryLinks.addAll(pLinks1);
			

			Set<Integer> globalLinkIds = new HashSet<>();
			List<Integer> functionIds = new LinkedList<>();
			for (PrimaryLink plink : primaryLinks) {
				globalLinkIds.add(plink.getGlobalLinkId());
				functionIds.add(plink.getFunctionId());
			}
			List<GlobalLink> globalLinks = globalLinkservice.getGlobalLinkListById(globalLinkIds);
			// sort globallinks
			Collections.sort(globalLinks, new GlobalinkComparator());
			List<FunctionMasterVo> functionList = functionMasterService.getFunctionMasterListByIds(functionIds);

			// setting file url from function master
			for (PrimaryLink plink : primaryLinks) {
				Integer function_Id = plink.getFunctionId();
				functionList.forEach(new Consumer<FunctionMasterVo>() {
					@Override
					public void accept(FunctionMasterVo obj) {
						if (obj.getFunctionId() == function_Id)
							plink.setFileName(obj.getFileName());
					}
				});
			}

			for (GlobalLink glink : globalLinks) {
	
				List<PrimaryLink> plinks = primaryLinks.stream()
						.filter(p -> p.getGlobalLinkId() == glink.getGlobalLinkId()).collect(Collectors.toList());
				// sorting primary links
				Collections.sort(plinks, new PrimaryLinkComparator());
				map.put(glink, plinks);
			}

		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::findUserLeftMenuByUserId():" + e);
		}
		return map;
	}

	@Override
	public String changePrimaryLinkStatus(Integer pl_id, Integer status) {
		String sts = "";
		try {
			PrimaryLinkBean obj = new PrimaryLinkBean();
			obj = primaryLinkRepository.findByPrimaryLinkId(pl_id);

			if (status == 0) {
				obj.setBitStatus(false);
			} else {
				List<GlobalLinkAccess> list = groupLinkAccessRepository.findPrimaryLinkByPrimaryLink(pl_id);
				if (list.isEmpty()) {
					obj.setBitStatus(true);
				} else {
					return OrsacPortalConstant.DEPENDENT;
				}
			}

			obj.setIntUpdatedBy(1);// setting a default super admin id 1
			obj = primaryLinkRepository.saveAndFlush(obj);

			
			LOG.info("obj"+obj);
			
			sts = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("ManagePrimaryLinkServiceImpl::changePrimaryLinkStatus():" + e);
			sts = OrsacPortalConstant.FAILURE;
		}
		return sts;
	}

}
