package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Entity
@Table(name="m_adm_globallink")
public class GlobalLinkVo implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="intGLinkId")
	private int globalLinkId;
	
	@NotEmpty
	@NotBlank
	@NotNull
	@Column(name="nvchGLinkName")
	private String globalLinkName;
	
	@NumberFormat(style = Style.NUMBER)
	@Range(min=1)
	@Column(name="intSortNum")
	private int intSortNum;
	
	@Column(name="bitHomePage")
	private int bitHomePage;
	
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
	
	@Column(name="vchicon")
	private String vchicon;

	public String getVchicon() {
		return vchicon;
	}

	public void setVchicon(String vchicon) {
		this.vchicon = vchicon;
	}

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

	public int getBitHomePage() {
		return bitHomePage;
	}

	public void setBitHomePage(int bitHomePage) {
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

	public int getBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(int bitStatus) {
		this.bitStatus = bitStatus;
	}

	@Override
	public String toString() {
		return "GlobalLinkVo [globalLinkId=" + globalLinkId + ", globalLinkName=" + globalLinkName + ", intSortNum="
				+ intSortNum + ", bitHomePage=" + bitHomePage + ", intCreatedBy=" + intCreatedBy + ", dtmCreatedOn="
				+ dtmCreatedOn + ", intUpdatedBy=" + intUpdatedBy + ", dtmUpdatedOn=" + dtmUpdatedOn + ", bitStatus="
				+ bitStatus + ", vchicon=" + vchicon + "]";
	}
	
	
}
