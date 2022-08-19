package com.csm.ORSAC.adminconsole.webportal.service;

import java.util.List;

import org.json.JSONObject;

import com.csm.ORSAC.adminconsole.webportal.entity.AdminRole;
import com.csm.ORSAC.adminconsole.webportal.entity.IpTrack;
import com.csm.ORSAC.adminconsole.webportal.entity.User;
import com.csm.ORSAC.adminconsole.webportal.entity.UserPermission;
import com.csm.ORSAC.adminconsole.webportal.entity.UserType;
import com.csm.ORSAC.webportal.bean.PasswordBean;
import com.csm.ORSAC.webportal.bean.ProfileBean;

public interface LoginService {

	public User findByUserName(String userName);

	public List<UserPermission> findByUserId(int userId);

	public AdminRole getRolByUserId(int userId);

	IpTrack saveUserTrackInfo(IpTrack ipinfo);

	int countFailAttempt(int userId);

	public UserType getUserTypeById(int userId);

	public String updatePassword(PasswordBean loginReqDto);

	public String updateProfile(ProfileBean profileDetails);

	public String updateforgottenPassword(PasswordBean paswdResetDetails);

	public JSONObject mUserDetails(String userName);

	public String validateMobileNumberByUserId(String mobile, Integer userId);

}