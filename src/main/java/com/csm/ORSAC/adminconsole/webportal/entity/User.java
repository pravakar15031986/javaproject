package com.csm.ORSAC.adminconsole.webportal.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "t_user")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "intUserId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userId;

	@Column(name = "vchUserName")
	private String userName;

	@Column(name = "vchPassWord")
	private String password;

	@Column(name = "intusertypeid")
	private Integer memUserTypeId;

	@Column(name = "int_gender")
	private Integer gender;

	

	@Column(name = "vchUserFullName")
	private String fullName;

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	@Column(name = "vchPhotoFileName")
	private String photoFileName;



	@Column(name = "vchEmailId")
	private String email;

	@Column(name = "vchMobileNo")
	private String mobile;

	@Column(name = "chrFirstTimeLogin")
	private char firstLogin;

	@Column(name = "intGroupId")
	private Integer groupId;


	@Column(name = "intLevelDetailId")
	private Integer intLevelDetailId;

	@Column(name = "intCreatedBy")
	private Integer createdBy;

	@Column(name = "dtmCreatedOn")
	private Timestamp createdOn;

	@Column(name = "dtmUpdatedOn")
	private Timestamp updatedOn;

	@Column(name = "intUpdatedBy")
	private Integer updatedBy;

	@Column(name = "tintDeletedStatus")
	private Boolean bitStatus;

	@Column(name = "chrLoginFailAttempt")
	private char loginFailAttempt;

	@Column(name = "intdesigid")
	private Integer intdesigid;

	@Transient
	private int researchCenterId;

	public int getResearchCenterId() {
		return researchCenterId;
	}

	public void setResearchCenterId(int researchCenterId) {
		this.researchCenterId = researchCenterId;
	}

	public Integer getIntdesigid() {
		return intdesigid;
	}

	public void setIntdesigid(Integer intdesigid) {
		this.intdesigid = intdesigid;
	}

	public User() {
	}

	public User(Integer userId, String userName, String fullName) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.fullName = fullName;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
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

	public Integer getMemUserTypeId() {
		return memUserTypeId;
	}

	public void setMemUserTypeId(Integer memUserTypeId) {
		this.memUserTypeId = memUserTypeId;
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

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Integer getIntLevelDetailId() {
		return intLevelDetailId;
	}

	public void setIntLevelDetailId(Integer intLevelDetailId) {
		this.intLevelDetailId = intLevelDetailId;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Date getUpdatedOn() {
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



	public char getLoginFailAttempt() {
		return loginFailAttempt;
	}

	public Boolean getBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(Boolean bitStatus) {
		this.bitStatus = bitStatus;
	}

	public void setUpdatedBy(Integer updatedBy) {
		this.updatedBy = updatedBy;
	}

	public void setLoginFailAttempt(char loginFailAttempt) {
		this.loginFailAttempt = loginFailAttempt;
	}

}
