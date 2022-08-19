package com.csm.ORSAC.adminconsole.webportal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "m_adm_leveldetails")
public class LevelDetails implements Serializable {
	private static final long serialVersionUID = 3698964944990967677L;

	@Id
	@Column(name = "intLevelDetailId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "nvchLevelName")
	private String userId;

	@Column(name = "intLevelId")
	private int levelId;

	@Column(name = "intParentId")
	private int parentId;

	@Column(name = "vchAlias")
	private String alias;

	@Column(name = "vchTelNo")
	private String telNumber;

	@Column(name = "vchFaxNo")
	private String faxNo;

	@Column(name = "bitStatus")
	private int status;

	@Column(name = "vchAddress")
	private String address;

	@Column(name = "intHierarchyId")
	private int hirarchyId;

	@Column(name = "intCreatedBy")
	private int createdBy;

	@Column(name = "dtmCreatedOn")
	private Timestamp createOn;

	@Column(name = "intUpdatedBy")
	private int updateBy;

	@Column(name = "dtmUpdatedOn")
	private Timestamp updateOn;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getLevelId() {
		return levelId;
	}

	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getTelNumber() {
		return telNumber;
	}

	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	public String getFaxNo() {
		return faxNo;
	}

	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getHirarchyId() {
		return hirarchyId;
	}

	public void setHirarchyId(int hirarchyId) {
		this.hirarchyId = hirarchyId;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreateOn() {
		return createOn;
	}

	public void setCreateOn(Timestamp createOn) {
		this.createOn = createOn;
	}

	public int getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(int updateBy) {
		this.updateBy = updateBy;
	}

	public Timestamp getUpdateOn() {
		return updateOn;
	}

	public void setUpdateOn(Timestamp updateOn) {
		this.updateOn = updateOn;
	}

	@Override
	public String toString() {
		return "LevelDetails [id=" + id + ", userId=" + userId + ", levelId=" + levelId + ", parentId=" + parentId
				+ ", alias=" + alias + ", telNumber=" + telNumber + ", faxNo=" + faxNo + ", status=" + status
				+ ", address=" + address + ", hirarchyId=" + hirarchyId + ", createdBy=" + createdBy + ", createOn="
				+ createOn + ", updateBy=" + updateBy + ", updateOn=" + updateOn + "]";
	}

}
