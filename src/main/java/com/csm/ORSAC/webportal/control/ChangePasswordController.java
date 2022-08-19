package com.csm.ORSAC.webportal.control;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csm.ORSAC.adminconsole.webportal.config.MD5PasswordEncoder;
import com.csm.ORSAC.adminconsole.webportal.entity.User;
import com.csm.ORSAC.adminconsole.webportal.service.LoginService;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;
import com.csm.ORSAC.webportal.bean.ChangePasswordBean;
import com.csm.ORSAC.webportal.bean.PasswordBean;
import com.csm.ORSAC.webportal.util.Validation;

@Controller
public class ChangePasswordController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/changePassword")
	@ResponseBody
	public List<String> changePassword(@RequestBody ChangePasswordBean changePasswordBean,HttpServletRequest request) {
		String msg="";
		HttpSession session = request.getSession();
		String status="";
		List<String> response=new ArrayList<>();
		try {
			String currenPassword = new String(
					Base64.getDecoder().decode(changePasswordBean.getCurPassword().getBytes()));
			String newPassword = new String(Base64.getDecoder().decode(changePasswordBean.getNewPassword().getBytes()));
			String confirmPassword = new String(
					Base64.getDecoder().decode(changePasswordBean.getConfirmNewPassword().getBytes()));
			boolean isValidate = Validation.validateFirstBlankSpace(currenPassword);
			boolean isValidate1 = Validation.validateLastBlankSpace(currenPassword);
			boolean isValidate2 = Validation.validateConsecutiveBlankSpacesInString(currenPassword);
			boolean isValidate3 = Validation.validateFirstBlankSpace(newPassword);
			boolean isValidate4 = Validation.validateLastBlankSpace(newPassword);
			boolean isValidate5 = Validation.validateConsecutiveBlankSpacesInString(newPassword);
			boolean isValidate6 = Validation.validateFirstBlankSpace(confirmPassword);
			boolean isValidate7 = Validation.validateLastBlankSpace(confirmPassword);
			boolean isValidate8 = Validation.validateConsecutiveBlankSpacesInString(confirmPassword);
			// validation starts
			if (changePasswordBean.getCurPassword() == null || changePasswordBean.getCurPassword().isEmpty()) {

				msg = "Please Enter Old Password.";
				status = "500";

			}

			else if (!isValidate) {
				msg = "Current password Should not Start with a Blank space.";
				status = "500";

			}

			else if (!isValidate1) {
				msg = "Current password Should not End with a Blank space.";
				status = "500";

			}

			else if (!isValidate2) {

				msg = "Current password Should not Contain Consecutive Blank space.";
				status = "500";

			}

			else if (changePasswordBean.getNewPassword() == null || changePasswordBean.getNewPassword().isEmpty()) {
				msg = "New password should not empty.";
				status = "500";

			}

			else if (!isValidate3) {
				msg = "New password Should not Start with a Blank space.";
				status = "500";

			}

			else if (!isValidate4) {
				msg = "New password Should not End with a Blank space.";
				status = "500";

			}

			else if (!isValidate5) {
				msg = "New password Should not Contain Consecutive Blank space.";
				status = "500";

			}

			else if (changePasswordBean.getConfirmNewPassword() == null
					|| changePasswordBean.getConfirmNewPassword().isEmpty()) {
				msg = "Confirm password should not empty.";
				status = "500";

			}

			else if (!isValidate6) {
				msg = "Confirm password Should not Start with a Blank space.";
				status = "500";

			}

			else if (!isValidate7) {
				msg = "Confirm password Should not End with a Blank space.";
				status = "500";

			}

			if (!isValidate8) {

				msg = "Confirm password Should not Contain Consecutive Blank space.";
				status = "500";

			}

			else if (currenPassword.equals(newPassword)) {
				msg = "New password should not same as Current password.";
				status = "500";

			} else if (!newPassword.equals(confirmPassword)) {
				msg = "Confirm password should be same as New password.";
				status = "500";

			} else if (!Validation.validatePassword(newPassword)) {

				msg = "New Password must contain A-Z, a-z, 0-9, @ or # or $ or . of length 8-20 characters.";
				status = "500";

			} else {

				String userName = null;
				try {
					userName = session.getAttribute(OrsacPortalConstant.USER_NAME).toString();
				} catch (Exception e) {

					msg = "Password not changed, try again";
					status = "500";

				}

				User userDetails = loginService.findByUserName(userName);

				if (!new MD5PasswordEncoder().matches(currenPassword, userDetails.getPassword())) {
					msg = "You have entered invalid current password.";
					status = "500";

				} else {
					PasswordBean loginReqDto = new PasswordBean();
					loginReqDto.setNewPassword(new MD5PasswordEncoder().encode(newPassword));
					loginReqDto.setUserId(userDetails.getUserId());
					loginReqDto.setUserName(userDetails.getUserName());

					String sts = loginService.updatePassword(loginReqDto);
					if (OrsacPortalConstant.SUCCESS.equalsIgnoreCase(sts)) {

						msg = "Password Updated Successfully. Please Login with New Password";
						session.removeAttribute(OrsacPortalConstant.USER_NAME);
						status = "200";
					} else {
						msg = "Password Update unsuccessful.";
						status = "500";
					}

				}
			}

		} catch (Exception e) {
			msg = "Password not changed, try again";
			status = "500";

			e.printStackTrace();
		}
		response.add(msg);
		response.add(status);

		return response;
	}

}
