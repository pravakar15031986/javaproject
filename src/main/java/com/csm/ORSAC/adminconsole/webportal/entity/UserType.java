package com.csm.ORSAC.adminconsole.webportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "m_adm_user_type")
public class UserType implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "intUserTypeId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "vchUserType")
	private String userType;

	@Column(name = "tintDeletedStatus")
	private Boolean isDelete;

	@Column(name = "vchUserTypePrefix")
	private String userTypePrefix;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}



	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	public String getUserTypePrefix() {
		return userTypePrefix;
	}

	public void setUserTypePrefix(String userTypePrefix) {
		this.userTypePrefix = userTypePrefix;
	}

	@Override
	public String toString() {
		return "UserType [id=" + id + ", userType=" + userType + ", isDelete=" + isDelete + ", userTypePrefix="
				+ userTypePrefix + "]";
	}

}
