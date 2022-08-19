package com.csm.ORSAC.webportal.report.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.function.Predicate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.webportal.bean.RegistrationBean;
import com.csm.ORSAC.webportal.bean.SurveyReportBean;
import com.csm.ORSAC.webportal.entity.SurveyDto;
import com.csm.ORSAC.webportal.report.service.MISReportService;
import com.csm.ORSAC.webportal.repository.LevelDetailsRepository;
import com.csm.ORSAC.webportal.repository.SurveyRepository;
import com.csm.ORSAC.webportal.util.Base64ConverterUtil;

@Service
public class MISReportServiceImpl implements MISReportService {
	
	@Value("${landimage.upload.path}")
	private String landImagePath;
	
	@Value("${selfeimage.upload.path}")
	private String selfeImagePath;
	
	@Autowired
	LevelDetailsRepository levelrepo;
	
	@Autowired
	SurveyRepository surveyRepo;
	
	@Autowired
	HttpSession session;
	
	/**
	 * @param RegistrationBean
	 * @param HttpServletRequest
	 * This method will fetch list
	 * of survey data
	 */
	@Override
	public List<SurveyReportBean> viewSurveyReport(RegistrationBean regBean,HttpServletRequest request) {
		List<SurveyReportBean> dataList=new ArrayList<>();
		List<Object[]> objList=null;
		SurveyReportBean surveyBean=null;
		try {
			if(!Optional.ofNullable(regBean.getDistrictId()).isPresent() || "0".equals(regBean.getDistrictId()) ) {
				regBean.setDistrictId("");
			}
			if(!Optional.ofNullable(regBean.getPacsId()).isPresent() || "0".equals(regBean.getPacsId())) {
				regBean.setPacsId("");
			}
			if(!Optional.ofNullable(regBean.getTahasilId()).isPresent() || "0".equals(regBean.getTahasilId())) {
				regBean.setTahasilId("");
			}
			if(!Optional.ofNullable(regBean.getVillageId()).isPresent() || "0".equals(regBean.getVillageId())) {
				regBean.setVillageId("");
			}
			if(!Optional.ofNullable(regBean.getCrop_status()).isPresent() || "0".equals(regBean.getCrop_status())) {
				regBean.setCrop_status("0");
			}
			if(!Optional.ofNullable(regBean.getPlot_no()).isPresent()) {
				regBean.setPlot_no("");
			}
			if(!Optional.ofNullable(regBean.getStatus()).isPresent() || "0".equals(regBean.getStatus())) {
				regBean.setStatus("0");
			}
			if(!Optional.ofNullable(regBean.getFromDate()).isPresent() ) {
				regBean.setFromDate("");
			}
			if(!Optional.ofNullable(regBean.getTodate()).isPresent() ) {
				regBean.setTodate("");
			}
			
			if(regBean.getFromDate().equals("") && regBean.getTodate().equals("")) {
				objList=surveyRepo.fetchSurveyReportDetails(regBean.getDistrictId(),regBean.getPacsId(),
						regBean.getTahasilId(),regBean.getVillageId(),Integer.parseInt(regBean.getCrop_status()),regBean.getPlot_no(),
						Integer.parseInt(regBean.getStatus()));
			}else{
			objList=surveyRepo.fetchSurveyReportDetails(regBean.getDistrictId(),regBean.getPacsId(),
					regBean.getTahasilId(),regBean.getVillageId(),Integer.parseInt(regBean.getCrop_status()),regBean.getPlot_no(),
					Integer.parseInt(regBean.getStatus()),regBean.getFromDate(),regBean.getTodate());
			}
			for(Object[] obj:objList) {
				if(objList.size()>0) {
					surveyBean=new SurveyReportBean();
					surveyBean.setDistname(String.valueOf(obj[0]));
					surveyBean.setTahasilName(String.valueOf(obj[1]));
					surveyBean.setVillageName(String.valueOf(obj[2]));
					surveyBean.setCropStatus(String.valueOf(obj[3]));
					surveyBean.setPosition(String.valueOf(obj[4]));
					surveyBean.setTotal_area(String.valueOf(obj[5]));
					//surveyBean.setCult_area(String.valueOf(obj[6]));
					surveyBean.setArea_valid(String.valueOf(obj[6]));
					surveyBean.setNearbyfield(String.valueOf(obj[7]));
					surveyBean.setPlotNo(String.valueOf(obj[8])); 
					surveyBean.setKhataNo(String.valueOf(obj[9]));
					surveyBean.setSurvey_time(dateFormatCoverter(String.valueOf(obj[10])));
					surveyBean.setStatus(String.valueOf(obj[11]));
					surveyBean.setPlot_code(String.valueOf(obj[12]));
					surveyBean.setSurveyReason(String.valueOf(obj[13]));
	
					
					
					
				
					dataList.add(surveyBean);
				}
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dataList;
	}
	
	/**
	 * @param plot code
	 * @param HttpServletRequest
	 * This method will fetch 
	 *  plot details by plot code
	 */
	@Override
	public SurveyReportBean fetchPlotDetailsByPlotCode(String plotcode,HttpServletRequest request) {
		
		SurveyReportBean surveyResponsBean=null;
		List<Object[]> objList=null;
		String[] latLong=null;
		int roleId=0;
		roleId=Integer.parseInt(String.valueOf(session.getAttribute("ROLE_ID")));
		try {
			objList=surveyRepo.fetchPlotDetailsByPlotCode(plotcode);
			System.out.println(objList.size()+"survey Details");
			if (objList.size() > 0) {
				for (Object[] obj : objList) {
					System.out.println(String.valueOf(obj[7]));
					System.out.println(String.valueOf(obj[8]));
					System.out.println(selfeImagePath+" selfie Image Name");
					System.out.println(landImagePath+" land Image Name");
					surveyResponsBean=new SurveyReportBean();
					surveyResponsBean.setPlotNo(String.valueOf(obj[0]));
					surveyResponsBean.setKhataNo(String.valueOf(obj[1]));
					
					if(String.valueOf(obj[2]).equals("1")) {
						surveyResponsBean.setCropStatus("Paddy Cultivated");	
					}else if(String.valueOf(obj[2]).equals("2")) {
						surveyResponsBean.setCropStatus("Paddy Not Cultivated");	
					}else {
						surveyResponsBean.setCropStatus("Not a crop land");	
					}
					
					if(String.valueOf(obj[3]).equals("1")) {
						surveyResponsBean.setPosition("Inside the plot");	
					}else if(String.valueOf(obj[3]).equals("2")) {
						surveyResponsBean.setPosition("From the boundary");	
					}else {
						surveyResponsBean.setPosition("Away from the plot");	
					}
					
					surveyResponsBean.setDistance(String.valueOf(obj[4]));
					surveyResponsBean.setTotal_area(String.valueOf(obj[5]));
					/* surveyResponsBean.setCult_area(String.valueOf(obj[6])); */
					surveyResponsBean.setArea_valid(String.valueOf(obj[6]));
					System.out.println(String.valueOf(obj[7]));
					System.out.println(String.valueOf(obj[8]));
					System.out.println(selfeImagePath);
					System.out.println(landImagePath);
					surveyResponsBean.setSelfeImage(convertFileIntoBase64String(selfeImagePath,String.valueOf(obj[7]),request));
					surveyResponsBean.setFieldPhoto1(convertFileIntoBase64String(landImagePath,String.valueOf(obj[8]),request));
					surveyResponsBean.setFieldPhoto2(String.valueOf(obj[9]).equals("null")? "" : convertFileIntoBase64String(landImagePath,String.valueOf(obj[9]),request));
					surveyResponsBean.setFieldPhoto3(String.valueOf(obj[10]).equals("null")? "" : convertFileIntoBase64String(landImagePath,String.valueOf(obj[10]),request));
					surveyResponsBean.setFieldPhoto4(String.valueOf(obj[11]).equals("null")? "" : convertFileIntoBase64String(landImagePath,String.valueOf(obj[11]),request));
					
					surveyResponsBean.setDeviceId(String.valueOf(obj[12]));
					surveyResponsBean.setMobile(String.valueOf(obj[13]));
					latLong=String.valueOf(obj[14]).split(",");
					surveyResponsBean.setLatitude(latLong[0]);
					surveyResponsBean.setLongitude(latLong[1]);
					surveyResponsBean.setCreated_on(String.valueOf(obj[15]));
					surveyResponsBean.setSurvey_time(String.valueOf(obj[16]));
					surveyResponsBean.setPlot_code(String.valueOf(obj[17]));
					surveyResponsBean.setName(String.valueOf(obj[18]));
					surveyResponsBean.setStatus(String.valueOf(obj[19]));
					surveyResponsBean.setDistname(String.valueOf(obj[20]));
					surveyResponsBean.setTahasilName(String.valueOf(obj[21]));
					surveyResponsBean.setVillageName(String.valueOf(obj[22]));
					surveyResponsBean.setSurveyReason(String.valueOf(obj[23]));
					surveyResponsBean.setRoleId(roleId);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return surveyResponsBean;
	}
	
	/**
	 * @param SurveyReportBean
	 * This method will approve/reject the plot details
	 * @return approve/reject status
	 */
	@Override
	public String actionOnSurveyDetails(SurveyReportBean surveyBean) {
		int userId=0;
		String status="";
		try {
			userId=Integer.parseInt(String.valueOf(session.getAttribute("USER_ID")));
			Optional<SurveyDto> opDto=surveyRepo.findById(surveyBean.getPlot_code());
			SurveyDto dto=opDto.get();
			dto.setStatus(Integer.parseInt(surveyBean.getStatus()));
			if(Integer.parseInt(surveyBean.getStatus())==3) {
				dto.setRejremark(surveyBean.getRemark());
			}
			dto.setModified_by(userId);
			dto.setModified_on(Timestamp.valueOf(LocalDateTime.now()));
			
			SurveyDto respdto=surveyRepo.save(dto);
			Predicate<SurveyDto> chkDto=o->o!=null;
			if(chkDto.test(respdto) && Integer.parseInt(surveyBean.getStatus())==2) {
				status="200";
			}else if(chkDto.test(respdto) && Integer.parseInt(surveyBean.getStatus())==3) {
				status="201";
			}else {
				status="500";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static String  dateFormatCoverter(String inputdate) throws ParseException {
		//System.err.println(inputdate);
		
		
		DateTimeFormatter dateformat= DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime datetime = LocalDateTime.parse(inputdate, dateformat);
		//System.err.println(datetime.toString());
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss a");
		//System.err.println(datetime.format(formatter));
		
	
		//System.err.println(dateString);
		return datetime.format(formatter);
	}
	
	public  String convertFileIntoBase64String(String path, String fileName, HttpServletRequest request) throws IOException {
		File file;
		FileInputStream fileInputStream = null;
		ByteArrayOutputStream byteArrayOutputStream = null;
		try {
			System.out.println(path +"Image Path" + fileName);
			file = new File(path +fileName);
			fileInputStream = new FileInputStream(file);
			System.out.println(fileInputStream +"File Name");
			byteArrayOutputStream = new ByteArrayOutputStream();
			
			int b;
			byte[] buffer = new byte[1024];
			while ((b = fileInputStream.read(buffer)) != -1) {
				byteArrayOutputStream.write(buffer, 0, b);
			}
			System.out.println(byteArrayOutputStream +"File object Name");
			byte[] fileBytes = byteArrayOutputStream.toByteArray();
			fileInputStream.close();
			byteArrayOutputStream.close();

			byte[] encoded = Base64.encodeBase64(fileBytes);
			String encodedString = new String(encoded);
			System.out.println(encodedString + "Encode String");
			return encodedString;
		}catch (FileNotFoundException e) {
			e.getMessage();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(byteArrayOutputStream != null) {
				byteArrayOutputStream.close();
			}
			if(fileInputStream != null) {
				fileInputStream.close();
			}
		}
		return new String();
	}
	
	

	/**
	 * @param RegistrationBean
	 */
	@Override
	public List<SurveyReportBean> viewSuspectedPlotReport(RegistrationBean regBean) {
		List<SurveyReportBean> dataList=new ArrayList<>();
		List<Object[]> objList=null;
		SurveyReportBean surveyBean=null;
		try {
			if(!Optional.ofNullable(regBean.getDistrictId()).isPresent() || "0".equals(regBean.getDistrictId()) ) {
				regBean.setDistrictId("");
			}
			if(!Optional.ofNullable(regBean.getPacsId()).isPresent() || "0".equals(regBean.getPacsId())) {
				regBean.setPacsId("");
			}
			if(!Optional.ofNullable(regBean.getTahasilId()).isPresent() || "0".equals(regBean.getTahasilId())) {
				regBean.setTahasilId("");
			}
			if(!Optional.ofNullable(regBean.getVillageId()).isPresent() || "0".equals(regBean.getVillageId())) {
				regBean.setVillageId("");
			}
			if(!Optional.ofNullable(regBean.getPlot_no()).isPresent()) {
				regBean.setPlot_no("");
			}
			
			
				objList = surveyRepo.viewSuspectedPlotReport(regBean.getDistrictId(),regBean.getPacsId(), regBean.getTahasilId(),
						regBean.getVillageId(), regBean.getPlot_no());
			 
			for(Object[] obj:objList) {
				if(objList.size()>0) {
					surveyBean=new SurveyReportBean();
					surveyBean.setPlotNo(String.valueOf(obj[0])); 
					surveyBean.setKhataNo(String.valueOf(obj[1]));
					surveyBean.setDistname(String.valueOf(obj[2]));
					surveyBean.setTahasilName(String.valueOf(obj[3]));
					surveyBean.setPacsName(String.valueOf(obj[4]));
					surveyBean.setPacsCode(String.valueOf(obj[5]));
					surveyBean.setVillageName(String.valueOf(obj[6]));
					surveyBean.setSurveyReason(String.valueOf(obj[7]));
					surveyBean.setTotal_area(String.valueOf(obj[8]));
					dataList.add(surveyBean);
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataList;
	}

}
