package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="m_adm_function")
public class FunctionMasterVo implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="intFunctionId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int functionId;
	
	
	@NotEmpty
	@NotBlank
	@NotNull
	@Column(name="vchFunction")
	private String functionName;

	
	@NotEmpty
	@NotBlank
	@NotNull
	@Column(name="vchFileName")
	private String fileName;
	
	@Column(name="vchDescription")
	private String description;
	
	@Column(name="vchAction1")
	private String addData;

	@Column(name="vchAction2")
	private String viewData;
	
	@Column(name="vchAction3")
	private String manageData;
	
	
	
	@NotNull
	@NotBlank
	@NotNull
	@Column(name="vchPortletFile")
	private String vchPortletFile;
	
	@Column(name="intCreatedBy")
	private int intCreatedBy;
	
	
	//@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	@Column(name="dtmCreatedOn")
	private Timestamp  dtmCreatedOn;
	
	@Column(name="intUpdatedBy")
	private int intUpdatedBy;
	
	//@UpdateTimestamp
	@Column(name="dtmUpdatedOn")
	private Date dtmUpdatedOn;
	
	@Column(name="bitStatus")
	private boolean bitStatus;
	
	@Transient
	private int dataId;
	
	@Transient
	private String dataName;
	

	public int getFunctionId() {
		return functionId;
	}

	public void setFunctionId(int functionId) {
		this.functionId = functionId;
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddData() {
		return addData;
	}

	public void setAddData(String addData) {
		this.addData = addData;
	}

	public String getViewData() {
		return viewData;
	}

	public void setViewData(String viewData) {
		this.viewData = viewData;
	}

	public String getManageData() {
		return manageData;
	}

	public void setManageData(String manageData) {
		this.manageData = manageData;
	}

	

	public String getVchPortletFile() {
		return vchPortletFile;
	}

	public void setVchPortletFile(String vchPortletFile) {
		this.vchPortletFile = vchPortletFile;
	}

	public int getIntCreatedBy() {
		return intCreatedBy;
	}

	public void setIntCreatedBy(int intCreatedBy) {
		this.intCreatedBy = intCreatedBy;
	}

	public Timestamp getDtmCreatedOn() {
		return dtmCreatedOn;
	}

	public void setDtmCreatedOn(Timestamp dtmCreatedOn) {
		this.dtmCreatedOn = dtmCreatedOn;
	}

	public int getIntUpdatedBy() {
		return intUpdatedBy;
	}

	public void setIntUpdatedBy(int intUpdatedBy) {
		this.intUpdatedBy = intUpdatedBy;
	}

	public Date getDtmUpdatedOn() {
		return dtmUpdatedOn;
	}

	public void setDtmUpdatedOn(Date dtmUpdatedOn) {
		this.dtmUpdatedOn = dtmUpdatedOn;
	}

	public boolean getBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(boolean bitStatus) {
		this.bitStatus = bitStatus;
	}

	public int getDataId() {
		return dataId;
	}

	public void setDataId(int dataId) {
		this.dataId = dataId;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}
	

}
