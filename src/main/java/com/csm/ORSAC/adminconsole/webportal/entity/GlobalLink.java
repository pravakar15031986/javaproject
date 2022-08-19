package com.csm.ORSAC.adminconsole.webportal.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Entity
@Table(name = "m_adm_globallink")

public class GlobalLink implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "intGLinkId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int globalLinkId;

	@NotEmpty
	@NotBlank
	@NotNull
	@Column(name = "nvchGLinkName")
	private String globalLinkName;

	@NumberFormat(style = Style.NUMBER)
	@Range(min = 1)
	@Column(name = "intSortNum")
	private int intSortNum;

	@Column(name = "bitHomePage")
	private int bitHomePage;

	@NotEmpty
	@NotBlank
	@NotNull
	@Column(name = "vchicon")
	private String vchicon;

	@Column(name = "intCreatedBy")
	private int intCreatedBy;

	@CreationTimestamp
	@Column(name = "dtmCreatedOn")
	private Timestamp dtmCreatedOn;

	@Column(name = "intUpdatedBy")
	private int intUpdatedBy;

	@Column(name = "dtmUpdatedOn")
	private Timestamp dtmUpdatedOn;

	@Column(name = "bitStatus")
	private boolean bitStatus;

	@OneToMany(mappedBy = "globalLinkId", fetch = FetchType.EAGER)
	Set<PrimaryLink> primarylinks = new HashSet<>();

	public GlobalLink() {
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

	public Timestamp getDtmUpdatedOn() {
		return dtmUpdatedOn;
	}

	public void setDtmUpdatedOn(Timestamp dtmUpdatedOn) {
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

	public String getVchicon() {
		return vchicon;
	}

	public void setVchicon(String vchicon) {
		this.vchicon = vchicon;
	}



	@Override
	public String toString() {
		return "GlobalLink [globalLinkId=" + globalLinkId + ", globalLinkName=" + globalLinkName + ", intSortNum="
				+ intSortNum + ", bitHomePage=" + bitHomePage + ", intCreatedBy=" + intCreatedBy + ", dtmCreatedOn="
				+ dtmCreatedOn + ", intUpdatedBy=" + intUpdatedBy + ", dtmUpdatedOn=" + dtmUpdatedOn + ", bitStatus="
				+ bitStatus + ", vchicon=" + vchicon + "]";
	}

}
