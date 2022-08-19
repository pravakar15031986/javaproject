package com.csm.ORSAC.adminconsole.webportal.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "m_adm_leveldetails")
public class AdmLevelDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "intleveldetailid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int levelDetailId;

	@Column(name = "nvchlevelname")
	private String levelName;

	@Column(name = "intlevelid")
	private int levelId;

	@Column(name = "intparentid")
	private int parentId;

	@Column(name = "vchalias")
	private String alias;

	@Column(name = "vchtelno")
	private String telNo;

	@Column(name = "vchfaxno")
	private String faxNo;

	@Column(name = "intcreatedby")
	private int createdBy;

	@Column(name = "dtmcreatedon")
	private Date createdOn;

	@Column(name = "intupdatedby")
	private int updatedBy;

	@Column(name = "dtmupdatedon")
	private Date updatedOn;

	@Column(name = "bitstatus")
	private boolean bitStatus;

	@Column(name = "vchaddress")
	private String address;

	@Column(name = "inthierarchyid")
	private int hierarchyId;

	public int getLevelDetailId() {
		return levelDetailId;
	}

	public void setLevelDetailId(int levelDetailId) {
		this.levelDetailId = levelDetailId;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
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

	public String getTelNo() {
		return telNo;
	}

	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}

	public String getFaxNo() {
		return faxNo;
	}

	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
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

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public boolean getBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(boolean bitStatus) {
		this.bitStatus = bitStatus;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getHierarchyId() {
		return hierarchyId;
	}

	public void setHierarchyId(int hierarchyId) {
		this.hierarchyId = hierarchyId;
	}

}
