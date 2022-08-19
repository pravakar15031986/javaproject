package com.csm.ORSAC.webportal.Restcontrol;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.csm.ORSAC.adminconsole.webportal.api.ApiUrl;
import com.csm.ORSAC.webportal.bean.DistrictBoundaryMasterBean;
import com.csm.ORSAC.webportal.bean.TahasilBoundaryMasterBean;
import com.csm.ORSAC.webportal.bean.VillageBoundaryMasterBean;
import com.csm.ORSAC.webportal.repository.LevelDetailsRepository;
import com.csm.ORSAC.webportal.service.GISApiService;

@RestController
@RequestMapping("/api")
public class GISApiRestController {
	
	@Autowired
	GISApiService gisService;
	
	@Autowired
	LevelDetailsRepository levelRepo;
	
	@GetMapping(value=ApiUrl.GisAPI.DISTRICT_MASTER)
	public Map<String,Object> getDistrictsMaster(){
		List<DistrictBoundaryMasterBean>  distMasterList=null;
		Map<String,Object> response=new LinkedHashMap<>();
		try {
			distMasterList=gisService.getDistrictsMaster();
			
			response.put("status", "200");
			response.put("msg", "success");
			response.put("response", distMasterList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return response;
		
	}
	
	@PostMapping(value=ApiUrl.GisAPI.TAHASIL_MASTER)
	public Map<String,Object> getTahasilMaster(@RequestBody DistrictBoundaryMasterBean distBean){
		List<TahasilBoundaryMasterBean>  tahasilMasterList=null;
		Map<String,Object> response=new LinkedHashMap<>();
		Map<String,Object> data=new LinkedHashMap<>();
		try {
			tahasilMasterList=gisService.getTahasilMaster(distBean.getDist_code());
			
			response.put("status", "200");
			response.put("msg", "success");
			data.put("data", tahasilMasterList);
			response.put("response", data);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return response;
		
	}
	
	
	@PostMapping(value=ApiUrl.GisAPI.VILLAGE_MASTER)
	public Map<String,Object> getTahasilMaster(@RequestBody TahasilBoundaryMasterBean tahsilBean){
		List<VillageBoundaryMasterBean>  villageMasterList=null;
		Map<String,Object> response=new LinkedHashMap<>();
		Map<String,Object> data=new LinkedHashMap<>();
		try {
			villageMasterList=gisService.getVillageMaster(tahsilBean.getTahasil_cd());
			String extent=String.valueOf(levelRepo.getTahasilBoundary(tahsilBean.getTahasil_cd()));
			
			response.put("status", "200");
			response.put("msg", "success");
			data.put("tahasil_extent", extent);
			data.put("data", villageMasterList);
			response.put("response", data);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return response;
		
	}
	

}
