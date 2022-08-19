package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class PrimaryLinkVo implements Serializable{

	private static final long serialVersionUID = 6780582582437425868L;
	
	private int primaryLinkId;
	
	@NotEmpty
	@NotBlank
	@NotNull
	private String primaryLinkName;

	@Range(min=1)
	private int globalLinkId;
	
	@Range(min=1)
	private int functionId;
	
	@NumberFormat(style = Style.NUMBER)
	@Range(min=1)
	private int slNo;
	
	private String fileName;
	
	private int bitLinkType;
	
	private int bitShowOnHomePage;
	
	private int intCreatedBy;
	
	private Timestamp dtmCreatedOn;
	
	private int intUpdatedBy;
	
	private Date dtmUpdatedOn;
	
	private int bitStatus;
	
	@JsonIgnore
	private Set<AdminRolePermission> admRoles = new HashSet<>(0);
	
	
	private String globalLinkName;
	
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

	public int getBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(int bitStatus) {
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
	
	public Set<AdminRolePermission> getAdmRoles() {
		return admRoles;
	}

	public void setAdmRoles(Set<AdminRolePermission> admRoles) {
		this.admRoles = admRoles;
	}
	
	
}
