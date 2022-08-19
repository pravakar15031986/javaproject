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
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="m_adm_primarylink")
public class PrimaryLink implements Serializable{

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
	private Timestamp dtmUpdatedOn;
	
	@Column(name="bitStatus")
	private boolean bitStatus;
	
	@OneToMany(mappedBy="primaryLink", fetch=FetchType.LAZY)
	@JsonIgnore
	private Set<GlobalLinkAccess> admRoles = new HashSet<>(0);
	
	
	@Transient
	@JsonIgnore
	private String action ;
	
	
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null)
		    return false;

		  if (this.getClass() != obj.getClass())
		    return false;


		PrimaryLink plnk  = (PrimaryLink)obj;
		if(plnk.getPrimaryLinkId() == this.primaryLinkId)
			return true;
		return false;
	}
	
	@Override
	public int hashCode() {
		return this.primaryLinkId;
	}
	
	
	public PrimaryLink() {}
	
	
	public PrimaryLink(int primaryLinkId, @NotEmpty @NotBlank @NotNull String primaryLinkName,
			@Range(min = 1) int globalLinkId, @Range(min = 1) int functionId,String action) {
		super();
		this.primaryLinkId = primaryLinkId;
		this.primaryLinkName = primaryLinkName;
		this.globalLinkId = globalLinkId;
		this.functionId = functionId;
		this.action = action;
	}
	
	

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

	
	public Set<GlobalLinkAccess> getAdmRoles() {
		return admRoles;
	}

	public void setAdmRoles(Set<GlobalLinkAccess> admRoles) {
		this.admRoles = admRoles;
	}

	
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	@Override
	public String toString() {
		return "PrimaryLink [primaryLinkId=" + primaryLinkId + ", primaryLinkName=" + primaryLinkName
				+ ", globalLinkId=" + globalLinkId + ", functionId=" + functionId + ", slNo=" + slNo + ", fileName="
				+ fileName + ", bitLinkType=" + bitLinkType + ", bitShowOnHomePage=" + bitShowOnHomePage
				+ ", intCreatedBy=" + intCreatedBy + ", dtmCreatedOn=" + dtmCreatedOn + ", intUpdatedBy=" + intUpdatedBy
				+ ", dtmUpdatedOn=" + dtmUpdatedOn + ", bitStatus=" + bitStatus + ", admRoles=" + admRoles + "]";
	}
	
	
	
	
	
}
