package com.csm.ORSAC.webportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.webportal.bean.DistrictBoundaryMasterBean;
import com.csm.ORSAC.webportal.bean.TahasilBoundaryMasterBean;
import com.csm.ORSAC.webportal.bean.VillageBoundaryMasterBean;
import com.csm.ORSAC.webportal.repository.LevelDetailsRepository;
import com.csm.ORSAC.webportal.service.GISApiService;

@Service
public class GISApiServiceImpl implements GISApiService {
	
	@Autowired
	LevelDetailsRepository levelRepo;
	
	

	@Override
	public List<DistrictBoundaryMasterBean> getDistrictsMaster() {
		
		List<Object[]> objList=null;
		DistrictBoundaryMasterBean distBean=null;
		List<DistrictBoundaryMasterBean>  distMasterList=new ArrayList<>();
		try {
			objList=levelRepo.getDistrictsMaster();
			for(Object[] obj:objList) {
				distBean=new DistrictBoundaryMasterBean();
				distBean.setDist_code(String.valueOf(obj[0]));
				distBean.setDistrict(String.valueOf(obj[1]));
				String extent=String.valueOf(levelRepo.getDistrictBoundary(String.valueOf(obj[0])));
				distBean.setExtent(extent);
				distMasterList.add(distBean);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return distMasterList;
	}

	@Override
	public List<TahasilBoundaryMasterBean> getTahasilMaster(String dist_code) {
		List<Object[]> objList=null;
		TahasilBoundaryMasterBean tahasilBean=null;
		List<TahasilBoundaryMasterBean>  tahsilMasterList=new ArrayList<>();
		try {
			objList=levelRepo.getTahasilMaster(dist_code);
			for(Object[] obj:objList) {
				tahasilBean=new TahasilBoundaryMasterBean();
				tahasilBean.setTahasil_cd(String.valueOf(obj[0]));
				tahasilBean.setTahasil(String.valueOf(obj[1]));
				String extent=String.valueOf(levelRepo.getTahasilBoundary(String.valueOf(obj[0])));
				tahasilBean.setExtent(extent);
				tahsilMasterList.add(tahasilBean);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tahsilMasterList;
	}

	@Override
	public List<VillageBoundaryMasterBean> getVillageMaster(String tahasil_code) {
		List<Object[]> objList=null;
		VillageBoundaryMasterBean villageBean=null;
		List<VillageBoundaryMasterBean>  villageMasterList=new ArrayList<>();
		try {
			objList=levelRepo.getVillageMaster(tahasil_code);
			for(Object[] obj:objList) {
				villageBean=new VillageBoundaryMasterBean();
				villageBean.setVill_code(String.valueOf(obj[0]));
				villageBean.setVill_name(String.valueOf(obj[1]));
				String extent=String.valueOf(levelRepo.getVillageBoundary(String.valueOf(obj[0])));
				villageBean.setExtent(extent);
				villageMasterList.add(villageBean);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return villageMasterList;
		
	}

}
