package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;



public class GlobalLink implements Serializable{
	private static final long serialVersionUID = 1L;

	
	private int globalLinkId;
	
	
	private String globalLinkName;
	
	private int intSortNum;
	
	private boolean bitHomePage;
	
	private int intCreatedBy;
	
	
	
	private Timestamp dtmCreatedOn;
	
	private int intUpdatedBy;
	
	private Date dtmUpdatedOn;
	
	private boolean bitStatus;

	private String vchicon;
	
	public String getVchicon() {
		return vchicon;
	}


	public void setVchicon(String vchicon) {
		this.vchicon = vchicon;
	}


	Set<PrimaryLink> primarylinks = new HashSet<>();
	
	public GlobalLink() {}
	
	
	public int getGlobalLinkId() {
		return globalLinkId;
	}

	public void setGlobalLinkId(int globalLinkId) {
		this.globalLinkId = globalLinkId;
	}

	public String getGlobalLinkName() {
		return globalLinkName;
	}

	public void setGlobalLinkName(String globalLinkName) {
		this.globalLinkName = globalLinkName;
	}

	

	public int getIntSortNum() {
		return intSortNum;
	}

	public void setIntSortNum(int intSortNum) {
		this.intSortNum = intSortNum;
	}

	public boolean getBitHomePage() {
		return bitHomePage;
	}

	public void setBitHomePage(boolean bitHomePage) {
		this.bitHomePage = bitHomePage;
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

	public Set<PrimaryLink> getPrimarylinks() {
		return primarylinks;
	}


	public void setPrimarylinks(Set<PrimaryLink> primarylinks) {
		this.primarylinks = primarylinks;
	}


	@Override
	public String toString() {
		return "GlobalLink [globalLinkId=" + globalLinkId + ", globalLinkName=" + globalLinkName + ", intSortNum="
				+ intSortNum + ", bitHomePage=" + bitHomePage + ", intCreatedBy=" + intCreatedBy + ", dtmCreatedOn="
				+ dtmCreatedOn + ", intUpdatedBy=" + intUpdatedBy + ", dtmUpdatedOn=" + dtmUpdatedOn + ", bitStatus="
				+ bitStatus + ", vchicon=" + vchicon + ", primarylinks=" + primarylinks + "]";
	}
	
	
}
