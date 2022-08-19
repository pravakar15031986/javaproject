package com.csm.ORSAC.webportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.webportal.bean.BlockDataBean;
import com.csm.ORSAC.webportal.bean.DistrictDataBean;
import com.csm.ORSAC.webportal.bean.PacsDataBean;
import com.csm.ORSAC.webportal.bean.RegistrationBean;
import com.csm.ORSAC.webportal.repository.LevelDetailsRepository;
import com.csm.ORSAC.webportal.service.CommonService;


@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired 
	LevelDetailsRepository levelrepo;
	
	
   /**
    * This method will provide 
    * all district List
    * present in the database
    * @return district List
    */
	@Override
	public List<DistrictDataBean> fetchDistrictList() {
		List<Object[]> objList=null;
		List<DistrictDataBean> districtList=new ArrayList<>();
		DistrictDataBean distBean;
		try {
			objList=levelrepo.getDistrictList();
			for(Object[] obj:objList) {
				distBean=new DistrictDataBean();
				distBean.setDistrictId(String.valueOf(obj[0]));
				distBean.setDistrictName(String.valueOf(obj[1]));
				districtList.add(distBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	
		
		return districtList;
	}
	
	 /**
	    * This method will provide 
	    * all block List
	    * present in the database
	    * @return block List
	    */
		@Override
		public List<BlockDataBean> fetchBlockList() {
			List<Object[]> objList=null;
			List<BlockDataBean> blockList=new ArrayList<>();
			BlockDataBean blkBean;
			try {
				objList=levelrepo.getBlockList();
				for(Object[] obj:objList) {
					blkBean=new BlockDataBean();
					blkBean.setBlockId(String.valueOf(obj[0]));
					blkBean.setBlockName(String.valueOf(obj[1]));
					blkBean.setDistrictId(String.valueOf(obj[2]));
					blockList.add(blkBean);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		
			
			return blockList;
		}
	
		/**
		    * This method will provide 
		    * all pacs List
		    * present in the database
		    * @return pacs List
		    */
	@Override
	public List<PacsDataBean> fetchPacsList() {
		List<Object[]> objList=null;
		List<PacsDataBean> pacsList=new ArrayList<>();
		PacsDataBean pacsBean;
		try {
			objList=levelrepo.getPacsList();
			for(Object[] obj:objList) {
				pacsBean=new PacsDataBean();
				pacsBean.setSocietyId(String.valueOf(obj[0]));
				pacsBean.setSocietyName(String.valueOf(obj[1]));
				pacsBean.setBlockId(String.valueOf(obj[2]));
				pacsList.add(pacsBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	
		
		return pacsList;
	}

		@Override
		public List<BlockDataBean> fetchBlockDetailsByDistId(String distCode) {
			List<Object[]> objList=null;
			List<BlockDataBean> blockList=new ArrayList<>();
			BlockDataBean blkBean;
			try {
				objList=levelrepo.fetchBlockDetailsByDistId(distCode);
				for(Object[] obj:objList) {
					blkBean=new BlockDataBean();
					blkBean.setBlockId(String.valueOf(obj[0]));
					blkBean.setBlockName(String.valueOf(obj[1]));
				
					blockList.add(blkBean);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		
			
			return blockList;
		}

		@Override
		public List<PacsDataBean> fetchPacsDetailsByBlockId(String blockId) {
			List<Object[]> objList=null;
			List<PacsDataBean> pacsList=new ArrayList<>();
			PacsDataBean pacsBean;
			try {
				objList=levelrepo.fetchPacsDetailsByBlockId(blockId);
				for(Object[] obj:objList) {
					pacsBean=new PacsDataBean();
					pacsBean.setSocietyId(String.valueOf(obj[0]));
					pacsBean.setSocietyName(String.valueOf(obj[1]));
					
					pacsList.add(pacsBean);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		
			
			return pacsList;
		}

		@Override
		public List<RegistrationBean> fetchtahasilListByDistCode(String districtId) {
			List<Object[]> objList=null;
			List<RegistrationBean> tahsilist=new ArrayList<>();
			RegistrationBean regBean;
			try {
				objList=levelrepo.fetchtahasilListByDistCode(districtId);
				for(Object[] obj:objList) {
					regBean=new RegistrationBean();
					regBean.setTahasilId(String.valueOf(obj[0]));
					regBean.setTahsilName(String.valueOf(obj[1]));
					
					tahsilist.add(regBean);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		
			
			return tahsilist;
		}

		@Override
		public List<RegistrationBean> fetchvillageListByTahasilCode(String tahasilId) {
			List<Object[]> objList=null;
			List<RegistrationBean> tahsilist=new ArrayList<>();
			RegistrationBean regBean;
			try {
				objList=levelrepo.fetchvillageListByTahasilCode(tahasilId);
				for(Object[] obj:objList) {
					regBean=new RegistrationBean();
					regBean.setVillageId(String.valueOf(obj[0]));
					regBean.setVillageName(String.valueOf(obj[1]));
					
					tahsilist.add(regBean);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		
			
			return tahsilist;
		}

		@Override
		public List<RegistrationBean> fetchPacsListByDistCode(String distCode) {
			List<Object[]> objList=null;
			List<RegistrationBean> pacsList=new ArrayList<>();
			RegistrationBean pacsBean;
			try {
				objList=levelrepo.fetchPacsListByDistCode(distCode);
				for(Object[] obj:objList) {
					pacsBean=new RegistrationBean();
					pacsBean.setPacsId(String.valueOf(obj[0]));
					pacsBean.setPacsName(String.valueOf(obj[1])+"("+String.valueOf(obj[0])+")");
					
					pacsList.add(pacsBean);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		
			
			return pacsList;
		}

}
