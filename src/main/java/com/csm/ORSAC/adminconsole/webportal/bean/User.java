package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Timestamp;



public class User implements Serializable{

	private static final long serialVersionUID = 1L;

	private int userId;
	
	private String userName;

	private String password;
	
	private int memApplicationId;
	
	private int memUserTypeId;
	
	private int memTypeId;
	
	private int associateTypeId;
	
	
	private String fullName;
	
	private String photoFileName;
	
	private String photoFilePath;
	
	
	private String email;
	
	
	private String mobile;
	
	private char firstLogin;
	
	
	private int groupId;
	
	
	private int levelDetailId;
	
	
	private int createdBy;
	
	
	private Timestamp createdOn;
	
	private Timestamp updatedOn;
	
	private int updatedBy;
	
	
	private boolean bitStatus;

	private char loginFailAttempt;
	
	
	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public int getMemApplicationId() {
		return memApplicationId;
	}


	public void setMemApplicationId(int memApplicationId) {
		this.memApplicationId = memApplicationId;
	}


	public int getMemUserTypeId() {
		return memUserTypeId;
	}


	public void setMemUserTypeId(int memUserTypeId) {
		this.memUserTypeId = memUserTypeId;
	}


	public int getMemTypeId() {
		return memTypeId;
	}


	public void setMemTypeId(int memTypeId) {
		this.memTypeId = memTypeId;
	}


	public int getAssociateTypeId() {
		return associateTypeId;
	}


	public void setAssociateTypeId(int associateTypeId) {
		this.associateTypeId = associateTypeId;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public String getPhotoFileName() {
		return photoFileName;
	}


	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}


	public String getPhotoFilePath() {
		return photoFilePath;
	}


	public void setPhotoFilePath(String photoFilePath) {
		this.photoFilePath = photoFilePath;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public char getFirstLogin() {
		return firstLogin;
	}


	public void setFirstLogin(char firstLogin) {
		this.firstLogin = firstLogin;
	}


	public int getGroupId() {
		return groupId;
	}


	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}


	public int getLevelDetailId() {
		return levelDetailId;
	}


	public void setLevelDetailId(int levelDetailId) {
		this.levelDetailId = levelDetailId;
	}


	public int getCreatedBy() {
		return createdBy;
	}


	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}


	public Timestamp getCreatedOn() {
		return createdOn;
	}


	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}


	public Timestamp getUpdatedOn() {
		return updatedOn;
	}


	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}


	public int getUpdatedBy() {
		return updatedBy;
	}


	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}


	public boolean isBitStatus() {
		return bitStatus;
	}


	public void setBitStatus(boolean bitStatus) {
		this.bitStatus = bitStatus;
	}


	public char getLoginFailAttempt() {
		return loginFailAttempt;
	}


	public void setLoginFailAttempt(char loginFailAttempt) {
		this.loginFailAttempt = loginFailAttempt;
	}


	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", memApplicationId="
				+ memApplicationId + ", memUserTypeId=" + memUserTypeId + ", memTypeId=" + memTypeId
				+ ", associateTypeId=" + associateTypeId + ", fullName=" + fullName + ", photoFileName=" + photoFileName
				+ ", photoFilePath=" + photoFilePath + ", email=" + email + ", mobile=" + mobile + ", firstLogin="
				+ firstLogin + ", groupId=" + groupId + ", levelDetailId=" + levelDetailId + ", createdBy=" + createdBy
				+ ", createdOn=" + createdOn + ", updatedOn=" + updatedOn + ", updatedBy=" + updatedBy + ", bitStatus="
				+ bitStatus + ", loginFailAttempt=" + loginFailAttempt + "]";
	}
	
	
}
