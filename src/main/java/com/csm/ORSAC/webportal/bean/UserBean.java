package com.csm.ORSAC.webportal.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class UserBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int userId;
	private String userName;
	private String password;
	private String fullName;
	private String photoFileName;
	private String photoFilePath;
	private String email;
	private String mobile;
	private char firstLogin;
	private List<Integer> groupId;
	private int intLevelDetailId;
	private int createdBy;
	private Date createdOn;
	private Date updatedOn;
	private int updatedBy;
	private String bitStatus;
	private char loginFailAttempt;
	private boolean mapStatus;
	private int researchCenterId;
	private String designation;
	private String roleName;
	private int memUserTypeId;
	private int intdesigid;
	private Integer gender;
	private String gendr;
	private String demoId;
	private String demoName;
	private String genderName;
	private Integer sNo;
	
	//For reset password
	private String resetPassword ;

	public String getDemoId() {
		return demoId;
	}

	public String getDemoName() {
		return demoName;
	}

	public void setDemoId(String demoId) {
		this.demoId = demoId;
	}

	public void setDemoName(String demoName) {
		this.demoName = demoName;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	private List<Integer> selectedRoleList;

	private String organizationName;

	private String rcName;

	private int roleId;
	private int sl;

	public int getSl() {
		return sl;
	}

	public void setSl(int sl) {
		this.sl = sl;
	}

	private String edit;
	private String passwordUnlock;
	private int unlockUserId;

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRcName() {
		return rcName;
	}

	public void setRcName(String rcName) {
		this.rcName = rcName;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public int getMemUserTypeId() {
		return memUserTypeId;
	}

	public void setMemUserTypeId(int memUserTypeId) {
		this.memUserTypeId = memUserTypeId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getResetPassword() {
		return resetPassword;
	}

	public void setResetPassword(String resetPassword) {
		this.resetPassword = resetPassword;
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

	public List<Integer> getGroupId() {
		return groupId;
	}

	public void setGroupId(List<Integer> groupId) {
		this.groupId = groupId;
	}

	public int getIntLevelDetailId() {
		return intLevelDetailId;
	}

	public void setIntLevelDetailId(int intLevelDetailId) {
		this.intLevelDetailId = intLevelDetailId;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}

	public char getLoginFailAttempt() {
		return loginFailAttempt;
	}

	public void setLoginFailAttempt(char loginFailAttempt) {
		this.loginFailAttempt = loginFailAttempt;
	}

	public boolean getMapStatus() {
		return mapStatus;
	}

	public void setMapStatus(boolean mapStatus) {
		this.mapStatus = mapStatus;
	}

	public int getResearchCenterId() {
		return researchCenterId;
	}

	public void setResearchCenterId(int researchCenterId) {
		this.researchCenterId = researchCenterId;
	}

	public int getIntdesigid() {
		return intdesigid;
	}

	public void setIntdesigid(int intdesigid) {
		this.intdesigid = intdesigid;
	}

	public List<Integer> getSelectedRoleList() {
		return selectedRoleList;
	}

	public void setSelectedRoleList(List<Integer> selectedRoleList) {
		this.selectedRoleList = selectedRoleList;
	}

	public String getBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(String bitStatus) {
		this.bitStatus = bitStatus;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getPasswordUnlock() {
		return passwordUnlock;
	}

	public void setPasswordUnlock(String passwordUnlock) {
		this.passwordUnlock = passwordUnlock;
	}

	public int getUnlockUserId() {
		return unlockUserId;
	}

	public void setUnlockUserId(int unlockUserId) {
		this.unlockUserId = unlockUserId;
	}

	public String getGenderName() {
		return genderName;
	}

	public void setGenderName(String genderName) {
		this.genderName = genderName;
	}

	public Integer getsNo() {
		return sNo;
	}

	public void setsNo(Integer sNo) {
		this.sNo = sNo;
	}

	public String getGendr() {
		return gendr;
	}

	public void setGendr(String gendr) {
		this.gendr = gendr;
	}
	
	//created by Shaktimaan Panda
	//created on 29-10-2020
	private String recommendationName;
	
	public String getRecommendationName() {
		return recommendationName;
	}

	public void setRecommendationName(String recommendationName) {
		this.recommendationName = recommendationName;
	}

	

}
