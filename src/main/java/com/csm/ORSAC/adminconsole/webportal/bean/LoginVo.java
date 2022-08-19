package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.util.Date;



import org.springframework.web.multipart.MultipartFile;


public class LoginVo implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private int userId;
	
	private String userName;
	
	private String password;
	
	private String fullName;
	
	private int levelDetailId;
	
	private int designationId;
	
	private Date doj;
	
	private Date dob;
	
	private String address;
	
	private String offTel;
	
	private String mobile;
	
	private String email;
	
	private int raUserId;
	
	private int tmpRaUserId;
	
	private int adminPrevil;
	
	private int locationId;
	
	private int attendance;
	
	private String gender;
	
	private String domainName;
	
	private String empCode;
	
	private int gradeId;
	
	private int payroll;
	
	private String userImage;
	
	private String createdBy;
	
	private Date createdOn;
	
	private String updatedBy;
	
	private Date updatedOn;
	
	private int bitStatus;
	
	private String qualification;
	
	private String specilisation;
	
	private String hobby;
	
	private String probationDate;
	
	private int epf;
	
	private int exEmployee;
	
	private int groupId;
	
	private int offType;
	
	private int roamingStatus;
	
	private String firstTimeLogin;
	
	private String lastpassword;
	
	private String confirmPassword;
	
	private int adminPriv;
	
	private int attendance2;
	
	private int payroll2;
	
	private int epf2;
	
	private String gradeName;
	
	private String locationName;
	
	private String hdn_PageNo;
	
	private String hdn_RecNo;
	
	private String hdn_IsPaging;
	
	private String hdnAction;
	
	
	private int selstatus;
	
	 private String levelId;
	
	 private String userName2;
	
	 private String txtOptionalAuth;
	
	 private String radType;	


	 private String txtCaptcha;
	
	private String currentpassword;
	
	private String newPassword;
	
	private MultipartFile imagePhoto;
	
	private String designationName;
	
	private String groupName;
	
	private String DobName;
	
	private String DojName;
	
	
	
	
	

	

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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getLevelDetailId() {
		return levelDetailId;
	}

	public void setLevelDetailId(int levelDetailId) {
		this.levelDetailId = levelDetailId;
	}

	public int getDesignationId() {
		return designationId;
	}

	public void setDesignationId(int designationId) {
		this.designationId = designationId;
	}

	public Date getDoj() {
		return doj;
	}

	public void setDoj(Date doj) {
		this.doj = doj;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOffTel() {
		return offTel;
	}

	public void setOffTel(String offTel) {
		this.offTel = offTel;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRaUserId() {
		return raUserId;
	}

	public void setRaUserId(int raUserId) {
		this.raUserId = raUserId;
	}

	public int getTmpRaUserId() {
		return tmpRaUserId;
	}

	public void setTmpRaUserId(int tmpRaUserId) {
		this.tmpRaUserId = tmpRaUserId;
	}

	public int getAdminPrevil() {
		return adminPrevil;
	}

	public void setAdminPrevil(int adminPrevil) {
		this.adminPrevil = adminPrevil;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public int getAttendance() {
		return attendance;
	}

	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDomainName() {
		return domainName;
	}

	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}

	public String getEmpCode() {
		return empCode;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public int getPayroll() {
		return payroll;
	}

	public void setPayroll(int payroll) {
		this.payroll = payroll;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public int getBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(int bitStatus) {
		this.bitStatus = bitStatus;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSpecilisation() {
		return specilisation;
	}

	public void setSpecilisation(String specilisation) {
		this.specilisation = specilisation;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getProbationDate() {
		return probationDate;
	}

	public void setProbationDate(String probationDate) {
		this.probationDate = probationDate;
	}

	public int getEpf() {
		return epf;
	}

	public void setEpf(int epf) {
		this.epf = epf;
	}

	public int getExEmployee() {
		return exEmployee;
	}

	public void setExEmployee(int exEmployee) {
		this.exEmployee = exEmployee;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public int getOffType() {
		return offType;
	}

	public void setOffType(int offType) {
		this.offType = offType;
	}

	public int getRoamingStatus() {
		return roamingStatus;
	}

	public void setRoamingStatus(int roamingStatus) {
		this.roamingStatus = roamingStatus;
	}

	public String getFirstTimeLogin() {
		return firstTimeLogin;
	}

	public void setFirstTimeLogin(String firstTimeLogin) {
		this.firstTimeLogin = firstTimeLogin;
	}

	public String getLastpassword() {
		return lastpassword;
	}

	public void setLastpassword(String lastpassword) {
		this.lastpassword = lastpassword;
	}
	
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public int getAdminPriv() {
		return adminPriv;
	}

	public void setAdminPriv(int adminPriv) {
		this.adminPriv = adminPriv;
	}

	public int getAttendance2() {
		return attendance2;
	}

	public void setAttendance2(int attendance2) {
		this.attendance2 = attendance2;
	}

	public int getEpf2() {
		return epf2;
	}

	public void setEpf2(int epf2) {
		this.epf2 = epf2;
	}

	public int getPayroll2() {
		return payroll2;
	}

	public void setPayroll2(int payroll2) {
		this.payroll2 = payroll2;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getHdn_PageNo() {
		return hdn_PageNo;
	}

	public void setHdn_PageNo(String hdn_PageNo) {
		this.hdn_PageNo = hdn_PageNo;
	}

	public String getHdn_RecNo() {
		return hdn_RecNo;
	}

	public void setHdn_RecNo(String hdn_RecNo) {
		this.hdn_RecNo = hdn_RecNo;
	}

	public String getHdn_IsPaging() {
		return hdn_IsPaging;
	}

	public void setHdn_IsPaging(String hdn_IsPaging) {
		this.hdn_IsPaging = hdn_IsPaging;
	}

	public String getHdnAction() {
		return hdnAction;
	}

	public void setHdnAction(String hdnAction) {
		this.hdnAction = hdnAction;
	}

	public int getSelstatus() {
		return selstatus;
	}

	public void setSelstatus(int selstatus) {
		this.selstatus = selstatus;
	}

	public String getLevelId() {
		return levelId;
	}

	public void setLevelId(String levelId) {
		this.levelId = levelId;
	}

	public String getUserName2() {
		return userName2;
	}

	public void setUserName2(String userName2) {
		this.userName2 = userName2;
	}

	public String getTxtOptionalAuth() {
		return txtOptionalAuth;
	}

	public void setTxtOptionalAuth(String txtOptionalAuth) {
		this.txtOptionalAuth = txtOptionalAuth;
	}

	public String getRadType() {
		return radType;
	}

	public void setRadType(String radType) {
		this.radType = radType;
	}

	public String getTxtCaptcha() {
		return txtCaptcha;
	}

	public void setTxtCaptcha(String txtCaptcha) {
		this.txtCaptcha = txtCaptcha;
	}

	public String getCurrentpassword() {
		return currentpassword;
	}

	public void setCurrentpassword(String currentpassword) {
		this.currentpassword = currentpassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public MultipartFile getImagePhoto() {
		return imagePhoto;
	}

	public void setImagePhoto(MultipartFile imagePhoto) {
		this.imagePhoto = imagePhoto;
	}

	public String getDesignationName() {
		return designationName;
	}

	public void setDesignationName(String designationName) {
		this.designationName = designationName;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getDobName() {
		return DobName;
	}

	public void setDobName(String dobName) {
		DobName = dobName;
	}

	public String getDojName() {
		return DojName;
	}

	public void setDojName(String dojName) {
		DojName = dojName;
	}
	
	
	
}

