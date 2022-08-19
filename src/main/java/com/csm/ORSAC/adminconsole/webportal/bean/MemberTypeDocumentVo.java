package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Date;

public class MemberTypeDocumentVo implements Serializable{

	private static final long serialVersionUID = 1L;


	private int memberDocId;
	
	private String financialYear;
	
	private int documentId;	
	
	private String documentCategory;
	
	private String isOptional;
	
	private int intCreatedBy;
	
	private Date dtmCreatedOn;	
	
	private int intUpdatedBy;	
	
	private String dtmUpdatedOn;	
	
	private int tintDeletedStatus;
	
    private int memberTypId;
	
	private String memTypName;
	
	private String memTypCode;
	
	private int deletedStatus;

	public int getMemberTypId() {
		return memberTypId;
	}


	public void setMemberTypId(int memberTypId) {
		this.memberTypId = memberTypId;
	}


	public String getMemTypName() {
		return memTypName;
	}


	public void setMemTypName(String memTypName) {
		this.memTypName = memTypName;
	}


	public String getMemTypCode() {
		return memTypCode;
	}


	public void setMemTypCode(String memTypCode) {
		this.memTypCode = memTypCode;
	}


	public int getDeletedStatus() {
		return deletedStatus;
	}


	public void setDeletedStatus(int deletedStatus) {
		this.deletedStatus = deletedStatus;
	}


	public int getMemberDocId() {
		return memberDocId;
	}


	public void setMemberDocId(int memberDocId) {
		this.memberDocId = memberDocId;
	}


	public String getFinancialYear() {
		return financialYear;
	}


	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}


	public int getDocumentId() {
		return documentId;
	}


	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}


	public String getDocumentCategory() {
		return documentCategory;
	}


	public void setDocumentCategory(String documentCategory) {
		this.documentCategory = documentCategory;
	}


	public String getIsOptional() {
		return isOptional;
	}


	public void setIsOptional(String isOptional) {
		this.isOptional = isOptional;
	}


	public int getIntCreatedBy() {
		return intCreatedBy;
	}


	public void setIntCreatedBy(int intCreatedBy) {
		this.intCreatedBy = intCreatedBy;
	}


	public Date getDtmCreatedOn() {
		return dtmCreatedOn;
	}


	public void setDtmCreatedOn(Date dtmCreatedOn) {
		this.dtmCreatedOn = dtmCreatedOn;
	}


	public int getIntUpdatedBy() {
		return intUpdatedBy;
	}


	public void setIntUpdatedBy(int intUpdatedBy) {
		this.intUpdatedBy = intUpdatedBy;
	}


	public String getDtmUpdatedOn() {
		return dtmUpdatedOn;
	}


	public void setDtmUpdatedOn(String dtmUpdatedOn) {
		this.dtmUpdatedOn = dtmUpdatedOn;
	}


	public int getTintDeletedStatus() {
		return tintDeletedStatus;
	}


	public void setTintDeletedStatus(int tintDeletedStatus) {
		this.tintDeletedStatus = tintDeletedStatus;
	}


	@Override
	public String toString() {
		return "MemberTypeDocumentVo [memberDocId=" + memberDocId + ", financialYear=" + financialYear + ", documentId="
				+ documentId + ", documentCategory=" + documentCategory + ", isOptional=" + isOptional
				+ ", intCreatedBy=" + intCreatedBy + ", dtmCreatedOn=" + dtmCreatedOn + ", intUpdatedBy=" + intUpdatedBy
				+ ", dtmUpdatedOn=" + dtmUpdatedOn + ", tintDeletedStatus=" + tintDeletedStatus + "]";
	}
	
	
	
}
