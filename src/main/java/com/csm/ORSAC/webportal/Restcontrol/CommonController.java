package com.csm.ORSAC.webportal.Restcontrol;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.csm.ORSAC.webportal.bean.BlockDataBean;
import com.csm.ORSAC.webportal.bean.PacsDataBean;
import com.csm.ORSAC.webportal.bean.RegistrationBean;
import com.csm.ORSAC.webportal.service.CommonService;

@RestController
public class CommonController {
	
	@Autowired
	CommonService commonService;
	
	
	@RequestMapping("/fetchBlockDetailsByDistId")
	public List<BlockDataBean> fetchBlockDetailsByDistId(@RequestParam("distId")String distId){

		return commonService.fetchBlockDetailsByDistId(distId);
	}
	
	
	
	@RequestMapping("/fetchPacsDetailsByBlockId")
	public List<PacsDataBean> fetchPacsDetailsByBlockId(@RequestParam("blockId")String blockId){

		return commonService.fetchPacsDetailsByBlockId(blockId);
	}
	

	@RequestMapping("/fetchtahasilListByDistCode")
	public List<RegistrationBean> fetchtahasilListByDistCode(@RequestParam("distId")String distId) {
		
		return  commonService.fetchtahasilListByDistCode(distId);
		
	}
	
	@RequestMapping("/fetchvillageListByTahasilCode")
	public List<RegistrationBean> fetchvillageListByTahasilCode(@RequestParam("tahasilId")String tahasilId) {
		
		return  commonService.fetchvillageListByTahasilCode(tahasilId);
		
	}
	
	@RequestMapping("/fetchPacsListByDistCode")
	public List<RegistrationBean> fetchPacsListByDistCode(@RequestParam("distId")String distId) {
		
		return  commonService.fetchPacsListByDistCode(distId);
		
	}
	
	

}
