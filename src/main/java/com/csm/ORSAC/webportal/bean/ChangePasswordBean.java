package com.csm.ORSAC.webportal.bean;

public class ChangePasswordBean {
	
	public String userId;
	private String curPassword;
	private String newPassword;
	private String confirmNewPassword;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCurPassword() {
		return curPassword;
	}
	public void setCurPassword(String curPassword) {
		this.curPassword = curPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}
	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}
	

}
