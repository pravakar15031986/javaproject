package com.csm.ORSAC.webportal.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.csm.ORSAC.webportal.bean.PendingPlotsDataBean;
import com.csm.ORSAC.webportal.bean.TakeActionBean;
import com.csm.ORSAC.webportal.bean.VillageDataBean;
import com.csm.ORSAC.webportal.entity.PacsInspectorDto;
import com.csm.ORSAC.webportal.entity.SurveyDto;
import com.csm.ORSAC.webportal.repository.LevelDetailsRepository;
import com.csm.ORSAC.webportal.repository.PacsInspectorRepository;
import com.csm.ORSAC.webportal.repository.SurveyRepository;
import com.csm.ORSAC.webportal.service.SurveyService;
import com.csm.ORSAC.webportal.util.DateUtil;
import com.csm.ORSAC.webportal.util.FileUploadUtil;

@Service
public class SurveyServiceImpl implements SurveyService {
	
	@Autowired 
	LevelDetailsRepository levelrepo;
	
	@Autowired
	PacsInspectorRepository pacsInsRepo;
	
	@Autowired
	SurveyRepository surveyRepo;
	
	@Autowired
	JdbcTemplate jdbc;
	
	@Value("${selfeimage.upload.path}")
	private String selfie_image_upload_path;
	
	@Value("${landimage.upload.path}")
	private String land_image_upload_path;
	
	/**
	 * @param pacs code
	 * This method will fetch 
	 * village wise plot list
	 */
	@Override
	public List<VillageDataBean> getVillageList(String userId) {
		List<VillageDataBean> dataList=new ArrayList<>();;
		List<Object[]> objList=null;
		VillageDataBean villageDataBean=null;
		try {
			Optional<PacsInspectorDto> optdto=pacsInsRepo.findById(Integer.parseInt(userId));
			if(optdto.isPresent()) {
				objList=levelrepo.getVillageList(optdto.get().getPacsId());
				for(Object[] obj:objList) {
					villageDataBean=new VillageDataBean();
					villageDataBean.setId(String.valueOf(obj[0]));
					villageDataBean.setVillageName(String.valueOf(obj[1]));
					villageDataBean.setNoOfPlots(String.valueOf(obj[2]));
					dataList.add(villageDataBean);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataList;
	}

	@Override
	public List<PendingPlotsDataBean> getPendingPlots(String villageId,String userId) {
		List<PendingPlotsDataBean> dataList=new ArrayList<>();;
		List<Object[]> objList=null;
		
		PendingPlotsDataBean pendingPlotsDatBean=null;
		
		try {
			Optional<PacsInspectorDto> pacsDto=pacsInsRepo.findById(Integer.parseInt(userId));
			objList=levelrepo.getPendingPlots(villageId,pacsDto.get().getPacsId());
			for(Object[] obj:objList) {
				pendingPlotsDatBean=new PendingPlotsDataBean();
				pendingPlotsDatBean.setPlotNo(String.valueOf(obj[0]));
				pendingPlotsDatBean.setPlotCode(String.valueOf(obj[1]));
				pendingPlotsDatBean.setKhatianNo(String.valueOf(obj[2]));
				pendingPlotsDatBean.setVillageId(String.valueOf(obj[3]));
				pendingPlotsDatBean.setVillage(String.valueOf(obj[4]));
				pendingPlotsDatBean.setTahasil(String.valueOf(obj[5]));
				pendingPlotsDatBean.setDistrict(String.valueOf(obj[6]));
				pendingPlotsDatBean.setSurveryReason(String.valueOf(obj[7]));
				pendingPlotsDatBean.setTotalArea(String.valueOf(obj[8]));
				//pendingPlotsDatBean.setCultivatedArea(String.valueOf(obj[9]));
				
				
				pendingPlotsDatBean.setLandLatLng(String.valueOf(obj[9]));
				
				
				
				
				dataList.add(pendingPlotsDatBean);
			
			}
			//System.err.println(dataList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataList;
	}

	@Override
	public String takeAction(TakeActionBean takeActionBean) {
		String selfeImageName="";
		
		boolean selfieSaveStatus=false;
		boolean landImageSaveStatus=false;
		List<String> landImageList=new ArrayList<>();
		SurveyDto surveydto=null;
		String status="";
		
		String datetime = takeActionBean.getDateTime();
		//Date formattedTime = DateUtil.StringToDate(datetime, "dd-mm-yyyy HH:mm:ss");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		LocalDateTime dateTime = LocalDateTime.parse(datetime, formatter);
		
		try {
			String fileNameWithoutExt = takeActionBean.getSelfieImage().getOriginalFilename().trim().substring(0, takeActionBean.getSelfieImage().getOriginalFilename().lastIndexOf(".")); // Extract the file name without extension
			String ext = StringUtils.getFilenameExtension(takeActionBean.getSelfieImage().getOriginalFilename());// Extract only extension
			selfeImageName = fileNameWithoutExt +System.nanoTime() + "." + ext; // make a unique File name
			selfieSaveStatus=FileUploadUtil.saveFile(selfie_image_upload_path, selfeImageName, takeActionBean.getSelfieImage());
			if (selfieSaveStatus) {

				for (int i = 0; i < takeActionBean.getLandImage().size(); i++) {
					String landfileNameWithoutExt = takeActionBean.getLandImage().get(i).getOriginalFilename().trim()
							.substring(0, takeActionBean.getLandImage().get(i).getOriginalFilename().lastIndexOf(".")); // Extract
																														// the
																														// file
																														// name
																														// without
																														// extension
					String landfileext = StringUtils
							.getFilenameExtension(takeActionBean.getLandImage().get(i).getOriginalFilename());// Extract
																												// only
																												// extension
					String landImageName = landfileNameWithoutExt + System.nanoTime() + "." + landfileext; // make a
																											// unique
																											// File name
					landImageSaveStatus = FileUploadUtil.saveFile(land_image_upload_path, landImageName,
							takeActionBean.getLandImage().get(i));
					landImageList.add(landImageName);
				}

				if (landImageSaveStatus) {
					surveydto = new SurveyDto();
					surveydto.setPlot_code(takeActionBean.getPlotCode());
					surveydto.setCrop_status(Integer.parseInt(takeActionBean.getFieldDetails()));
					surveydto.setSurveyor_position(takeActionBean.getSurveyAction());
					surveydto.setSurveyor_distance(Double.parseDouble(takeActionBean.getSurveyDistance()));
					surveydto.setArea_vald(Double.parseDouble(takeActionBean.getAreaValid()));
					surveydto.setPhoto_land1(landImageList.get(0));
					surveydto.setPhoto_land2(indexExists(landImageList, 1) ? landImageList.get(1) : null);
					surveydto.setPhoto_land3(indexExists(landImageList, 2) ? landImageList.get(2) : null);
					surveydto.setPhoto_land4(indexExists(landImageList, 3) ? landImageList.get(3) : null);
					surveydto.setPhoto_selfie(selfeImageName);
					surveydto.setNerabyField(takeActionBean.getAdjoiningPlot());
					surveydto.setRemark(takeActionBean.getRemarks());
					surveydto.setLatlong(takeActionBean.getLatUser() + "," + takeActionBean.getLngUser());
					surveydto.setCreated_by(Integer.parseInt(takeActionBean.getUserId()));
					surveydto.setCreated_on(Timestamp.valueOf(LocalDateTime.now()));
					surveydto.setDeleted_flag(0);
					surveydto.setSeason(takeActionBean.getSeason());
					surveydto.setKms_year(takeActionBean.getKms());
					surveydto.setStatus(1);
					surveydto.setSync_on(Timestamp.valueOf(dateTime));

					SurveyDto resDto = surveyRepo.save(surveydto);

					Predicate<SurveyDto> chkDto = o -> o != null;
					if (chkDto.test(resDto)) {
						status = "200";
					} else {
						status = "500";
					}

				} else {
					status = "500";
				}
			} else {
				status = "500";
			}
		} catch (Exception e) {
			// TODO: handle exception
			status="500";
			e.printStackTrace();
		}
		return status;
	}
	
	

	@Override
	public String checkTakeAction(String plotCode) {
		String status="";
		try {
			Object obj=pacsInsRepo.checkTakeAction(plotCode);
			if("1".equals(String.valueOf(obj))) {
				status="200";
			}else {
				status="404";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return status;
	}
	/**
	 * 
	 * @param list
	 * @param index
	 * This Method is used to check
	 * the specified index is present
	 * on the list or not
	 * @return index available status
	 */
	public boolean indexExists(final List<String> list, final int index) {
	    return index >= 0 && index < list.size();
	}

}
