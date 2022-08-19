package com.csm.ORSAC.webportal.service;

import java.util.List;

import com.csm.ORSAC.webportal.bean.BlockDataBean;
import com.csm.ORSAC.webportal.bean.DistrictDataBean;
import com.csm.ORSAC.webportal.bean.PacsDataBean;
import com.csm.ORSAC.webportal.bean.RegistrationBean;

public interface CommonService {

	List<DistrictDataBean> fetchDistrictList();

	List<BlockDataBean> fetchBlockList();
	
	List<PacsDataBean> fetchPacsList();

	List<BlockDataBean> fetchBlockDetailsByDistId(String distCode);

	List<PacsDataBean> fetchPacsDetailsByBlockId(String blockId);

	List<RegistrationBean> fetchtahasilListByDistCode(String districtId);

	List<RegistrationBean> fetchvillageListByTahasilCode(String tahasilId);
	
	List<RegistrationBean> fetchPacsListByDistCode(String distCode);
	
	
	
	

}
