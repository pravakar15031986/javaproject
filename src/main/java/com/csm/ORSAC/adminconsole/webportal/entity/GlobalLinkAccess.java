package com.csm.ORSAC.adminconsole.webportal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="m_adm_grouplinkaccess")
public class GlobalLinkAccess implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="intGroupAccessId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "intGroupId")
	@JsonIgnore
	private AdminRole adm_role;
	 

	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="intPlinkId" )
	private PrimaryLink primaryLink;
	
	@Column(name="vchAction")
	private String action;
	
	@Column(name="intCreatedBy")
	private Integer createdBy;
	
	@Column(name="dtmCreatedOn")
	private Timestamp createOn;
	
	@Column(name="intUpdatedBy")
	private Integer updatedBy;
	
	@Column(name="dtmUpdatedOn")
	private Timestamp updatedOn;
	
	@Column(name="bitStatus")
	private boolean  status;

	
	public GlobalLinkAccess() {
	}
		
	public GlobalLinkAccess(AdminRole group, PrimaryLink primaryLink, Integer createdBy) {
		super();
		this.adm_role = group;
		this.primaryLink = primaryLink;
		this.createdBy = createdBy;
	}
	
 
	

	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public AdminRole getAdm_role() {
		return adm_role;
	}

	public void setAdm_role(AdminRole adm_role) {
		this.adm_role = adm_role;
	}

	public PrimaryLink getPrimaryLink() {
		return primaryLink;
	}

	public void setPrimaryLink(PrimaryLink primaryLink) {
		this.primaryLink = primaryLink;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreateOn() {
		return createOn;
	}

	public void setCreateOn(Timestamp createOn) {
		this.createOn = createOn;
	}

	public Integer getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Integer updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Timestamp getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}


}
