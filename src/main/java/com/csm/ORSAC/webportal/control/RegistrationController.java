package com.csm.ORSAC.webportal.control;


import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.ORSAC.adminconsole.webportal.entity.AdmLevelDetails;
import com.csm.ORSAC.adminconsole.webportal.repository.AdminLevelRepository;
import com.csm.ORSAC.webportal.bean.BlockDataBean;
import com.csm.ORSAC.webportal.bean.DistrictDataBean;
import com.csm.ORSAC.webportal.bean.OtpBean;
import com.csm.ORSAC.webportal.bean.PacsDataBean;
import com.csm.ORSAC.webportal.bean.RegistrationBean;
import com.csm.ORSAC.webportal.repository.LevelDetailsRepository;
import com.csm.ORSAC.webportal.service.CommonService;
import com.csm.ORSAC.webportal.service.RegistrationService;
import com.csm.ORSAC.webportal.util.RandomDigitGenerator;

/**
 * 
 * @author dibyamohan.panda
 * This Controller is used For Registration 
 * of Society member in Paddy Field Survey System
 */
@Controller
public class RegistrationController {
	
	@Autowired
	RegistrationService regService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	AdminLevelRepository admRepo;
	
	@Autowired
	LevelDetailsRepository levelrepo;
	
	@Autowired
	HttpSession session;
	
	/**
	 * 
	 * @param model
	 * This method will open signup pacs 
	 * inspector page
	 * @return signup pacs inspector page
	 */
	@RequestMapping("/signUpPacsInspector")
	public String addRegistration(Model model) {
		List<DistrictDataBean> districtList=null;
		
		try {
			districtList=commonService.fetchDistrictList();
			model.addAttribute("districtList", districtList);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "signUpPacsInspector";
	}
	
	
	/**
	 * 
	 * @param registrationBean
	 * This method will check if the mobile number
	 * is not exist it will register the mobile number and 
	 * save pacs inspector data
	 * @return save status of registration
	 */
	@ResponseBody
	@PostMapping("/savePacsInspectorData")
	public String savePacsInspectorData(@RequestBody RegistrationBean registrationBean) {
		String status="";
		/*
		 * boolean valodationStatus=false; String validationMessage="";
		 */
		String chkUserStatus=null;
		//String chkUserStatus1=null;
		try {
			//valodationStatus=Optional.ofNullable(formValidation(registrationBean)).isPresent();
			//if(!valodationStatus) {
				chkUserStatus=regService.checkUserSignUp(registrationBean.getMobileNumber());
				//chkUserStatus1=regService.checkUserSignUp(registrationBean.getMobileNumber(), registrationBean.getDistrictId(), registrationBean.getBlockId(), registrationBean.getPacsId());
				if("NOT_FOUND".equals(chkUserStatus) ) { //if no data found against this mobile number
					status=	regService.savePacsInspectorData(registrationBean);
				}else if("SIGNUP_INCOMPLETE".equals(chkUserStatus)){  //sign up not completed
					status="201";
				}else if("FOUND".equals(chkUserStatus)) {
					status="202";
				}
			
			
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		return status;
		
	}
	
	/**
	 * 
	 * @param otpBean
	 * This Method is used for 
	 * save otp and save it response
	 * @return otp send status
	 */
	@PostMapping(value="/saveOtp")
	@ResponseBody
	public String saveOtp(@RequestBody OtpBean otpBean){
		String mobNum="";
		int otp=0;
		String status="";
		String verifyStatus="";
		String otpSendStatus="";
		String respCode="";
		
		try {
			
			verifyStatus=regService.verifySignUpStatus(otpBean.getMobNumber());
			if("1".equals(verifyStatus) || "0".equals(verifyStatus)){
			mobNum=String.valueOf(otpBean.getMobNumber());
			otp=RandomDigitGenerator.numberGenerator();
			System.err.println("Generated OTP: "+otp);
			otpSendStatus=regService.sendOtp(mobNum,otp);
			respCode =otpSendStatus.substring(0, 3);
			if(otpSendStatus !=null && "402".equalsIgnoreCase(respCode)) {
			status=regService.saveOtp(mobNum,otp);
			}else {
				status="501";
			}
			}else  {
				status="201"; //Already Sign Up
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	/**
	 * 
	 * @param otpBean
	 * This method will validate the otp
	 * given by user which is send to his mobile number
	 * @return validate otp status
	 */
	@PostMapping("/validateOtp")
	@ResponseBody
	public String validateOtp(@RequestBody OtpBean otpBean) {
		String status="";
		try {
			status=regService.validateOtp(otpBean);
			if("200".equals(status)) {
				regService.updateOtpStatus(otpBean,2);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return status;
	}
	
	/**
	 * 
	 * @param regBean
	 * @param model
	 * @return view new new registered pacs inspector
	 * page
	 */
	@RequestMapping("/viewRegisterPacsInspector")
	public ModelAndView viewRegisterPacsInspector(@ModelAttribute("viewRegisterPacsInspectorNew") RegistrationBean regBean,Model model) {
		int intlevelDetailId=0;
		int distId=0;
		
		Object distCode=null;
		Object distname=null;
		int roleId=0;
		
		List<RegistrationBean> dataList=null;
		List<DistrictDataBean> districtList=null;
		List<RegistrationBean> blockList=null;
		List<RegistrationBean> pacsList=null;
		ModelAndView mv=new ModelAndView("viewRegisteredPacsInspectorNew");
		try {
			roleId=Integer.parseInt(String.valueOf(session.getAttribute("ROLE_ID")));
			if (roleId == 1 || roleId == 5) { //super admin
				dataList=regService.fetchRegisteredPacsInspectorNew(regBean);
				districtList=commonService.fetchDistrictList();
				blockList=fetchBlockDetailsByDistCode(regBean.getDistrictId());
				pacsList=fetchPacsDetailsByBlockCode(regBean.getBlockId());
				model.addAttribute("pacsList", pacsList);
				model.addAttribute("blockList", blockList);
				model.addAttribute("districtList", districtList);
			} else {
				intlevelDetailId = Integer.parseInt(String.valueOf(session.getAttribute("OFFICE_ID")));
				Optional<AdmLevelDetails> OptAdmDto = admRepo.findById(intlevelDetailId);
				if (OptAdmDto.isPresent()) {
					AdmLevelDetails dto = OptAdmDto.get();
					System.err.println(dto.getParentId() + ": District Id");
					distId = dto.getParentId();
					
					distCode = levelrepo.getDistCodeByDistId(distId);
					distname=levelrepo.getDistrictNameBydistId(distId);
					System.err.println(distCode + ": Dist Code");
					regBean.setDistrictId(String.valueOf(distCode));
					dataList = regService.fetchRegisteredPacsInspectorNew(regBean);
					model.addAttribute("distCode", String.valueOf(distCode));
					model.addAttribute("distname", String.valueOf(distname));
					blockList=fetchBlockDetailsByDistCode(regBean.getDistrictId());
					pacsList=fetchPacsDetailsByBlockCode(regBean.getBlockId());
					model.addAttribute("pacsList", pacsList);
					model.addAttribute("blockList", blockList);
				}
			}
			model.addAttribute("roleId", roleId);
			model.addAttribute("pacsInspectorRegisterdList", dataList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	/**
	 * 
	 * @param regBean
	 * @param model
	 * @return view  approve registered pacs inspector
	 * page
	 */
	@RequestMapping("/viewRegisterPacsInspectorApprove")
	public ModelAndView viewRegisterPacsInspectorApprove(@ModelAttribute("viewRegisterPacsInspectorApprove") RegistrationBean regBean,Model model) {
		int intlevelDetailId=0;
		int distId=0;
		
		Object distCode=null;
		Object distname=null;
		int roleId=0;
		
		List<RegistrationBean> dataList=null;
		List<DistrictDataBean> districtList=null;
		List<RegistrationBean> blockList=null;
		List<RegistrationBean> pacsList=null;
		ModelAndView mv=new ModelAndView("viewRegisteredPacsInspectorApprove");
		try {
			roleId=Integer.parseInt(String.valueOf(session.getAttribute("ROLE_ID")));
			if (roleId == 1 || roleId == 5) { //super admin
				dataList=regService.fetchRegisteredPacsInspectorApprove(regBean);
				districtList=commonService.fetchDistrictList();
				model.addAttribute("districtList", districtList);
				blockList=fetchBlockDetailsByDistCode(regBean.getDistrictId());
				pacsList=fetchPacsDetailsByBlockCode(regBean.getBlockId());
				model.addAttribute("pacsList", pacsList);
				model.addAttribute("blockList", blockList);
			} else {
				intlevelDetailId = Integer.parseInt(String.valueOf(session.getAttribute("OFFICE_ID")));
				Optional<AdmLevelDetails> OptAdmDto = admRepo.findById(intlevelDetailId);
				if (OptAdmDto.isPresent()) {
					AdmLevelDetails dto = OptAdmDto.get();
					System.err.println(dto.getParentId() + ": District Id");
					distId = dto.getParentId();
					
					distCode = levelrepo.getDistCodeByDistId(distId);
					distname=levelrepo.getDistrictNameBydistId(distId);
					System.err.println(distCode + ": Dist Code");
					regBean.setDistrictId(String.valueOf(distCode));
					dataList = regService.fetchRegisteredPacsInspectorApprove(regBean);
					model.addAttribute("distCode", String.valueOf(distCode));
					model.addAttribute("distname", String.valueOf(distname));
					blockList=fetchBlockDetailsByDistCode(regBean.getDistrictId());
					pacsList=fetchPacsDetailsByBlockCode(regBean.getBlockId());
					model.addAttribute("pacsList", pacsList);
					model.addAttribute("blockList", blockList);
				}
			}
			model.addAttribute("pacsInspectorRegisterdList", dataList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	/**
	 * 
	 * @param regBean
	 * @param model
	 * @return view reject registered pacs inspector
	 * page
	 */
	@RequestMapping("/viewRegisterPacsInspectorReject")
	public ModelAndView viewRegisterPacsInspectorReject(@ModelAttribute("viewRegisterPacsInspectorReject") RegistrationBean regBean,Model model) {
		int intlevelDetailId=0;
		int distId=0;
		
		Object distCode=null;
		Object distname=null;
		int roleId=0;
		
		List<RegistrationBean> dataList=null;
		List<DistrictDataBean> districtList=null;
		List<RegistrationBean> blockList=null;
		List<RegistrationBean> pacsList=null;
		ModelAndView mv=new ModelAndView("viewRegisteredPacsInspectorReject");
		try {
			roleId=Integer.parseInt(String.valueOf(session.getAttribute("ROLE_ID")));
			if (roleId == 1 || roleId == 5) { //super admin
				dataList=regService.fetchRegisteredPacsInspectorReject(regBean);
				districtList=commonService.fetchDistrictList();
				model.addAttribute("districtList", districtList);
				blockList=fetchBlockDetailsByDistCode(regBean.getDistrictId());
				pacsList=fetchPacsDetailsByBlockCode(regBean.getBlockId());
				model.addAttribute("pacsList", pacsList);
				model.addAttribute("blockList", blockList);
			} else {
				intlevelDetailId = Integer.parseInt(String.valueOf(session.getAttribute("OFFICE_ID")));
				Optional<AdmLevelDetails> OptAdmDto = admRepo.findById(intlevelDetailId);
				if (OptAdmDto.isPresent()) {
					AdmLevelDetails dto = OptAdmDto.get();
					System.err.println(dto.getParentId() + ": District Id");
					distId = dto.getParentId();
					
					distCode = levelrepo.getDistCodeByDistId(distId);
					distname=levelrepo.getDistrictNameBydistId(distId);
					System.err.println(distCode + ": Dist Code");
					regBean.setDistrictId(String.valueOf(distCode));
					dataList = regService.fetchRegisteredPacsInspectorReject(regBean);
					model.addAttribute("distCode", String.valueOf(distCode));
					model.addAttribute("distname", String.valueOf(distname));
					blockList=fetchBlockDetailsByDistCode(regBean.getDistrictId());
					pacsList=fetchPacsDetailsByBlockCode(regBean.getBlockId());
					model.addAttribute("pacsList", pacsList);
					model.addAttribute("blockList", blockList);
				}
			}
			model.addAttribute("pacsInspectorRegisterdList", dataList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	/**
	 * 
	 * @param regBean
	 * @param redirects
	 * This method will approve/reject the pacs inspector 
	 * registration and save the response in database
	 * 
	 * @return approve/reject status
	 */
	@RequestMapping("/actionOnPacsInspector")
	public String actionOnPacsInspector(@ModelAttribute RegistrationBean regBean,RedirectAttributes redirects) {
		String status="";
		try {
			status=regService.actionOnPacsInspector(regBean);
			if("200".equals(status)) {
				redirects.addFlashAttribute("message","Application for field Surveyor registration has been approved.");
			}else if("201".equals(status)) {
				redirects.addFlashAttribute("message","Application for field Surveyor registration has been rejected.");
			}else {
				redirects.addFlashAttribute("message","Some Error Occured");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:viewRegisterPacsInspector";
	}
	
	public  List<RegistrationBean> fetchBlockDetailsByDistCode(String distCode){
		List<BlockDataBean> dataList=null;
		List<RegistrationBean> blockdataList=null;
		try {
			dataList=commonService.fetchBlockDetailsByDistId(distCode);
			blockdataList=	dataList.stream().map((data)->{
				RegistrationBean regBean=new RegistrationBean();
				regBean.setBlockId(data.getBlockId());
				regBean.setBlockName(data.getBlockName());
				return regBean; 
			}).collect(Collectors.toList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blockdataList;
	}
	
	public  List<RegistrationBean> fetchPacsDetailsByBlockCode(String blockCode){
		List<PacsDataBean> dataList=null;
		List<RegistrationBean> pacsDataList=null;
		try {
			dataList=commonService.fetchPacsDetailsByBlockId(blockCode);
			pacsDataList=dataList.stream().map((data)->{
				RegistrationBean regBean=new RegistrationBean();
				regBean.setPacsId(data.getSocietyId());
				regBean.setPacsName(data.getSocietyName());
				return regBean; 
			}).collect(Collectors.toList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pacsDataList;
	}
	

}
