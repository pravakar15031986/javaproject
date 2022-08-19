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

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;


@Entity
@Table(name="m_adm_primarylink")
public class PrimaryLinkBean implements Serializable{

	private static final long serialVersionUID = 6780582582437425868L;
	
	@Id
	@Column(name="intPLinkId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int primaryLinkId;
	
	@NotEmpty
	@NotBlank
	@NotNull
	@Column(name="nvchPlinkName")
	private String primaryLinkName;

	@Range(min=1)
	@Column(name="intGlinkId")
	private int globalLinkId;
	
	@Range(min=1)
	@Column(name="intFunctionId")
	private int functionId;
	
	@NumberFormat(style = Style.NUMBER)
	@Range(min=1)
	@Column(name="intSlNo")
	private int slNo;
	
	@Column(name="vchExternalURL")
	private String fileName;
	
	@Column(name="bitLinkType")
	private int bitLinkType;
	
	@Column(name="bitShowOnHomePage")
	private int bitShowOnHomePage;
	
	@Column(name="intCreatedBy")
	private int intCreatedBy;
	
	@Column(name="dtmCreatedOn")
	private Timestamp dtmCreatedOn;
	
	@Column(name="intUpdatedBy")    
	private int intUpdatedBy;
	
	@Column(name="dtmUpdatedOn") 
	private Date dtmUpdatedOn;
	
	@Column(name="bitStatus")
	private boolean bitStatus;
	

	
	
	@Transient
	private String globalLinkName;
	
	@Transient
	private String functionName;

	public int getPrimaryLinkId() {
		return primaryLinkId;
	}

	public void setPrimaryLinkId(int primaryLinkId) {
		this.primaryLinkId = primaryLinkId;
	}

	public String getPrimaryLinkName() {
		return primaryLinkName;
	}

	public void setPrimaryLinkName(String primaryLinkName) {
		this.primaryLinkName = primaryLinkName;
	}

	public int getGlobalLinkId() {
		return globalLinkId;
	}

	public void setGlobalLinkId(int globalLinkId) {
		this.globalLinkId = globalLinkId;
	}

	public int getFunctionId() {
		return functionId;
	}

	public void setFunctionId(int functionId) {
		this.functionId = functionId;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getBitLinkType() {
		return bitLinkType;
	}

	public void setBitLinkType(int bitLinkType) {
		this.bitLinkType = bitLinkType;
	}

	public int getBitShowOnHomePage() {
		return bitShowOnHomePage;
	}

	public void setBitShowOnHomePage(int bitShowOnHomePage) {
		this.bitShowOnHomePage = bitShowOnHomePage;
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

	public String getGlobalLinkName() {
		return globalLinkName;
	}

	public void setGlobalLinkName(String globalLinkName) {
		this.globalLinkName = globalLinkName;
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	
	
}
