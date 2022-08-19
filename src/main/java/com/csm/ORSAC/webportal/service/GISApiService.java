package com.csm.ORSAC.webportal.service;

import java.util.List;

import com.csm.ORSAC.webportal.bean.DistrictBoundaryMasterBean;
import com.csm.ORSAC.webportal.bean.TahasilBoundaryMasterBean;
import com.csm.ORSAC.webportal.bean.VillageBoundaryMasterBean;

public interface GISApiService {
	
	public List<DistrictBoundaryMasterBean> getDistrictsMaster();
	
	public List<TahasilBoundaryMasterBean> getTahasilMaster(String dist_code);
	
	public List<VillageBoundaryMasterBean> getVillageMaster(String tahasilCode);
	

}
