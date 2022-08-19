package com.csm.ORSAC.webportal.bean;

import java.io.Serializable;

public class UserResponseBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String userId;
	private String userMobile;
	private String userName;
	private String userDesignation;
	
	private String district;
	private String block;
	private String pacs;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserDesignation() {
		return userDesignation;
	}
	public void setUserDesignation(String userDesignation) {
		this.userDesignation = userDesignation;
	}
	
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getBlock() {
		return block;
	}
	public void setBlock(String block) {
		this.block = block;
	}
	public String getPacs() {
		return pacs;
	}
	public void setPacs(String pacs) {
		this.pacs = pacs;
	}

	@Override
	public String toString() {
		return "UserResponseBean [userId=" + userId + ", userMobile=" + userMobile + ", userName=" + userName
				+ ", userDesignation=" + userDesignation + ", district=" + district + ", block=" + block + ", pacs="
				+ pacs + "]";
	}
	
	
	
	
	
	
	

}
