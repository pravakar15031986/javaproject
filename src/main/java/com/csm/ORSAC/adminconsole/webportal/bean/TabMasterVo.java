package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Entity
@Table(name="m_adm_tab")
public class TabMasterVo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="intTabId")
	private int tabId;
	
	@Range(min=1)
	@Column(name="intButtonId")
	private int buttonId;
	
	@NotEmpty
	@NotBlank
	@NotNull
	@Column(name="nvchTab")
	private String tabName;
	
	@NotEmpty
	@NotBlank
	@NotNull
	@Column(name="vchUrl")
	private String fileName;
	
	@Column(name="nvchDescription")
	private String description;
	
	@Column(name="vchAction1")
	private String addData;
	
	@Column(name="vchAction2")
	private String viewData;
	
	@Column(name="vchAction3")
	private String manageData;
	
	@NotNull
	@NumberFormat(style = Style.NUMBER)
	@Range(min=1)
	@Column(name="intSortNum")
	private String intSortNum;
	
	@Column(name="intCreatedBy")
	private int intCreatedBy;
	
	@CreationTimestamp
	@Column(name="dtmCreatedOn")
	private Timestamp dtmCreatedOn;
	
	@Column(name="intUpdatedBy")
	private int intUpdatedBy;
	
	@Column(name="dtmUpdatedOn")
	private Date dtmUpdatedOn;
	
	@Column(name="bitStatus")
	private int bitStatus;
	
	@Range(min=1)
	@Column(name="functionId")
	private int functionId;
	
	@Transient
	private String functionName;
	
	@Transient
	private String buttonName;
	
	public int getTabId() {
		return tabId;
	}

	public void setTabId(int tabId) {
		this.tabId = tabId;
	}

	public int getButtonId() {
		return buttonId;
	}

	public void setButtonId(int buttonId) {
		this.buttonId = buttonId;
	}

	public String getTabName() {
		return tabName;
	}

	public void setTabName(String tabName) {
		this.tabName = tabName;
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

	
	public String getIntSortNum() {
		return intSortNum;
	}

	public void setIntSortNum(String intSortNum) {
		this.intSortNum = intSortNum;
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

	public int getBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(int bitStatus) {
		this.bitStatus = bitStatus;
	}

	public int getFunctionId() {
		return functionId;
	}

	public void setFunctionId(int functionId) {
		this.functionId = functionId;
	}

	public String getButtonName() {
		return buttonName;
	}

	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	
}
