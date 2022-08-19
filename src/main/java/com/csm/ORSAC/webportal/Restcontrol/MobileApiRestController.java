package com.csm.ORSAC.webportal.Restcontrol;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.csm.ORSAC.adminconsole.webportal.api.ApiUrl;
import com.csm.ORSAC.webportal.bean.BlockDataBean;
import com.csm.ORSAC.webportal.bean.DistrictDataBean;
import com.csm.ORSAC.webportal.bean.OtpBean;
import com.csm.ORSAC.webportal.bean.PacsDataBean;
import com.csm.ORSAC.webportal.bean.PendingPlotsDataBean;
import com.csm.ORSAC.webportal.bean.TakeActionBean;
import com.csm.ORSAC.webportal.bean.UserResponseBean;
import com.csm.ORSAC.webportal.bean.VillageDataBean;
import com.csm.ORSAC.webportal.service.CommonService;
import com.csm.ORSAC.webportal.service.RegistrationService;
import com.csm.ORSAC.webportal.service.SurveyService;
import com.csm.ORSAC.webportal.util.RandomDigitGenerator;




/**
 * 
 * @author dibyamohan.panda
 * This Controller is used for 
 * Provide API to Mobile for 
 * Paddy Field Survey
 */
@RestController
@RequestMapping("/MobileAPI")
public class MobileApiRestController {
	
	
	@Autowired
	RegistrationService regService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	SurveyService surveyService;
	

	/**
	 * @author dibyamohan.panda
	 * @since 9/10/2021
	 * @version 1.0
	 * @param otpBean
	 * @apiNote This API Will Provide
	 * master data like district,block and PACS
	 * @return district ,block and PACS 
	 * details as JSON response
	 */
	@GetMapping(value=ApiUrl.MobileAPI.MASTER_DATA,produces=MediaType.APPLICATION_JSON_VALUE)
	public Map<String,Object> masterData(){
		List<DistrictDataBean>  districtList=null;
		List<BlockDataBean>  blockList=null;
		List<PacsDataBean>  pacsList=null;
		Map<String,Object> districtResponse=new LinkedHashMap<>();
		Map<String,Object> blockResponse=new LinkedHashMap<>();
		Map<String,Object> pacsResponse=new LinkedHashMap<>();
		
		try {
			// Create 3 threads for fetching district ,block and society list simultaneously

			ExecutorService executorService = Executors.newFixedThreadPool(3);
			CompletableFuture<List<DistrictDataBean>> distFuture = CompletableFuture
					.supplyAsync(() -> commonService.fetchDistrictList(), executorService);
			CompletableFuture<List<BlockDataBean>> blockFuture = CompletableFuture
					.supplyAsync(() -> commonService.fetchBlockList(), executorService);
			CompletableFuture<List<PacsDataBean>> pacsFuture = CompletableFuture
					.supplyAsync(() -> commonService.fetchPacsList(), executorService);
			
			

			
			
			districtList=distFuture.get();
			blockList=blockFuture.get();
			pacsList=pacsFuture.get();

			
			districtResponse.put("districtData", districtList);
			blockResponse.put("blockData", blockList);
			pacsResponse.put("societyData", pacsList);

			districtResponse.putAll(blockResponse);
			districtResponse.putAll(pacsResponse);
		    

			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return districtResponse;
	}
	
	/**
	 * @author dibyamohan.panda
	 * @since 9/10/2021
	 * @version 1.0
	 * @param otpBean
	 * @apiNote This API Will Send OTP 
	 * to the provided mobile number
	 * @return OTP Send Status as JSON response
	 */
	@PostMapping(value=ApiUrl.MobileAPI.SEND_OTP,produces=MediaType.APPLICATION_JSON_VALUE,consumes=MediaType.APPLICATION_JSON_VALUE)
	public Map<String,String> sendOtp(@RequestBody OtpBean otpBean){
		String mobNum="";
		int otp=0;
		String status="";
		String verifyMobNOStatus="";
		String otpSendStatus="";
		String respCode="";
		
		Map<String,String> response=new LinkedHashMap<>();
		try {
			
			verifyMobNOStatus=regService.checkUserSignUp(otpBean.getMobNumber(), false);// check mobile number already sign up or not
			
			if ("NOT_FOUND".equals(verifyMobNOStatus)) { // if mobile number does not exist
				status = "404";
			} else if("SIGNUP_INCOMPLTE".equals(verifyMobNOStatus)) {
				status = "502";
			}else if("APPROVAL_PENDING".equals(verifyMobNOStatus)) {
				status = "503";
			}else if("REJECTED".equals(verifyMobNOStatus)) {
				status = "504";	
			}else {
				mobNum = String.valueOf(otpBean.getMobNumber());
				otp = RandomDigitGenerator.numberGenerator();
				System.err.println("Generated OTP: " + otp);
				otpSendStatus=regService.sendOtp(mobNum,otp);
				respCode =otpSendStatus.substring(0, 3);
				
				if(otpSendStatus !=null && "402".equalsIgnoreCase(respCode)) {
				status = regService.saveOtpMobile(mobNum, otp, otpBean.getDevice_id());
				}else {
					status="501";
				}
			}
			if("200".equals(status)) {
				response.put("status", "success");
				response.put("msg", "OTP sent successfully to your registered mobile number.");
			}else if("404".equals(status)) {
				response.put("status", "failure");
				response.put("msg", "Mobile Number Does not Exist.");
			}else if("401".equals(status)) {
				response.put("status", "failure");
				response.put("msg", "Mobile Number has not verified.");
			}else if("501".equals(status)) {
				response.put("status", "failure");
				response.put("msg", "OTP Send Failure with Response code: "+respCode+".");
			}else if("502".equals(status)) {
				response.put("status", "failure");
				response.put("msg", "Your Sign Up Process is not completed.");
			}else if("503".equals(status)) {
				response.put("status", "failure");
				response.put("msg", "Your Sign up application is pending at ARCS/DRCS approval.");
			}else if("504".equals(status)) {
				response.put("status", "failure");
				response.put("msg", "Your Sign up application has been rejected.");
			}
			else {
				response.put("error", "Something went wrong. Please try again later.");
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.put("error", "Something went wrong. Please try again later.");
			e.printStackTrace();
		}
		return response;
	}
	
	/**
	 * @author dibyamohan.panda
	 * @since 9/10/2021
	 * @version 1.0
	 * @param otpBean
	 * @apiNote This API Will Verify OTP 
	 * send to the provided mobile number
	 * @return OTP Verify Status and user 
	 * details if verification success as JSON response
	 */
	@PostMapping(value=ApiUrl.MobileAPI.VERIFY_OTP,produces=MediaType.APPLICATION_JSON_VALUE,consumes=MediaType.APPLICATION_JSON_VALUE)
	public Map<String,Object> verifyOtp(@RequestBody OtpBean otpBean){
		String status="";
		UserResponseBean userRes=null;
		Map<String,Object> response=new LinkedHashMap<>();
		String verifyMobNOStatus="";
		
		try {
			verifyMobNOStatus=regService.checkUserSignUp(otpBean.getMobNumber());// check mobile number already sign up or not
			
			if ("NOT_FOUND".equals(verifyMobNOStatus)) { // if mobile number does not exist
				status = "404";
			} else {
				status = regService.validateOtp(otpBean);// validate OTP against the mobile number
			}
			
			if("200".equals(status)) {
				regService.updateOtpStatus(otpBean,3);  //update OTP verify status
				//fetch user details for response
				 userRes=regService.fetchUserDetails(otpBean.getMobNumber());
				
				//set response
				response.put("status", "success");
				response.put("msg", "OTP verified successfully");
				response.put("userDetails", userRes);
			}else if("404".equals(status)){
				response.put("status", "failure");
				response.put("msg", "Mobile Number Does not Exist");
				
			}else if("300".equals(status)){
				response.put("status", "failure");
				response.put("msg", "Mobile Number Mismatched");
				
			}else if("301".equals(status)){
				response.put("status", "failure");
				response.put("msg", "OTP Mismatched");
				
			}else if("302".equals(status)){
				response.put("status", "failure");
				response.put("msg", "OTP has been expired");
			}else {
				response.put("error", "Something went wrong. Please try again later.");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.put("error", "Something went wrong. Please try again later.");
		}
		return response;
	}
	
	/**
	 * @author dibyamohan.panda
	 * @since 10/10/2021
	 * @version 1.0
	 * @param userId
	 * @param profileImage file
	 * @param profileImageName
	 * @apiNote This API save the uploaded profile
	 * picture and send a success response after saving
	 * @return profile Image upload status as JSON response
	 */
	@PostMapping(value = ApiUrl.MobileAPI.UPLOAD_PROFILE_IMAGE, produces = MediaType.APPLICATION_JSON_VALUE,
			 													consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
	public Map<String, String> uploadProfileImage(
			@RequestParam("userId") String userId,
			@RequestPart("profileImage") MultipartFile profileImage) {
		
		Map<String, String> response = new LinkedHashMap<>();
		String status="";
		try {
          //System.err.println(userId+" "+profileImage+" "+profileImageName);
          status=regService.saveProfileImage(userId,profileImage,profileImage.getOriginalFilename());
          if("200".equals(status)) {
          response.put("status", "success");
          response.put("msg", "Profile Image Uploaded Successfully");
          }else {
        	  response.put("status", "failure");
              response.put("msg", "Profile Image could not be Uploaded"); 
          }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
	
	/**
	 * @author dibyamohan.panda
	 * @since 11/10/2021
	 * @version 1.0
	 * @param userId
	 * @apiNote This API will provide Village List
	 * @return profile Image upload status as JSON response
	 */
	@PostMapping(value = ApiUrl.MobileAPI.VILLAGE_LIST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<VillageDataBean> getVillageList(@RequestBody String data) {
		
		
		List<VillageDataBean> villageList=null;
		try {
			JSONObject json=new JSONObject(data);
			
			villageList=surveyService.getVillageList(String.valueOf(json.get("userId")));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return villageList;
	}
	
	
	/**
	 * @author dibyamohan.panda
	 * @since 11/10/2021
	 * @version 1.0
	 * @param userId
	 * @apiNote This API will provide Pending Plot List against the village code
	 * @return profile Image upload status as JSON response
	 */
	@PostMapping(value = ApiUrl.MobileAPI.PENDING_PLOTS, consumes= MediaType.APPLICATION_JSON_VALUE,produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String,Object> getPendingPlots(@RequestBody String data) {
		 Map<String,Object> response =new LinkedHashMap<>();
		try {
			JSONObject json=new JSONObject(data);
			List<PendingPlotsDataBean> dataList=surveyService.getPendingPlots(String.valueOf(json.get("villageId")),String.valueOf(json.get("userId")));
			
			if (dataList.size() > 0) {
				response.put("status", "success");
				response.put("msg", "");
				response.put("pendingPlots", dataList);
				//System.err.println(response);
			} else {
				response.put("status", "failure");
				response.put("msg", "No Data Available");
				response.put("pendingPlots", dataList);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
	
	
	/**
	 * @author dibyamohan.panda
	 * @since 11/10/2021
	 * @version 1.0
	 * @param
	 * @apiNote This API save the take action
	 * details into database and save the image file
	 * into specific directory
	 * @return take action data upload status as JSON response
	 */
	@PostMapping(value = ApiUrl.MobileAPI.TAKE_ACTION, produces = MediaType.APPLICATION_JSON_VALUE,
			 													consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
	public Map<String, String> takeAction(@ModelAttribute TakeActionBean takeActionBean ){
		
		Map<String, String> response = new LinkedHashMap<>();
		String status="";
		
		
		try {
			System.err.println(takeActionBean.getLandImage().size());
			status = surveyService.checkTakeAction(takeActionBean.getPlotCode());
			if ("200".equals(status)) {
				response.put("status", "failure");
				response.put("msg", "Action has already taken against this plot");
			} else {
				
				status = surveyService.takeAction(takeActionBean);

				if ("200".equals(status)) {
					response.put("status", "success");
					response.put("msg", "Action taken successfully");
				} else {
					response.put("status", "failure");
					response.put("msg", "Action taken Data could not Saved");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

}
