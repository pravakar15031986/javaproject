package com.csm.ORSAC.webportal.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.csm.ORSAC.webportal.bean.OtpBean;
import com.csm.ORSAC.webportal.bean.RegistrationBean;
import com.csm.ORSAC.webportal.bean.UserResponseBean;

public interface RegistrationService {
	

	String savePacsInspectorData(RegistrationBean registrationBean);

	String checkUserSignUp(String mobileNumber);
	
	String checkUserSignUp(String mobileNumber,boolean deletedFlag);

	String saveOtp(String mobNum, int otp);

	String validateOtp(OtpBean otpBean);

	void updateOtpStatus(OtpBean otpBean, int i);

	String verifySignUpStatus(String mobNumber);

	String sendOtp(String mobNumber, int otp);

	UserResponseBean fetchUserDetails(String mobNumber);

	String saveProfileImage(String userId, MultipartFile profileImage, String profileImageName);

	List<RegistrationBean> fetchRegisteredPacsInspectorNew(RegistrationBean regBean);

	String actionOnPacsInspector(RegistrationBean regBean);

	String saveOtpMobile(String mobNum, int otp, String device_id);

	List<RegistrationBean> fetchRegisteredPacsInspectorApprove(RegistrationBean regBean);

	List<RegistrationBean> fetchRegisteredPacsInspectorReject(RegistrationBean regBean);



}
