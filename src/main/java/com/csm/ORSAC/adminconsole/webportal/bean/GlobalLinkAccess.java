package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Timestamp;


public class GlobalLinkAccess implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private Group adm_role;
	
	private PrimaryLink primaryLink;
	
	private String action;
	
	private Integer createdBy;
	
	private Timestamp createOn;
	
	private Integer updatedBy;
	
	private Timestamp updatedOn;
	
	private boolean  status;

	
	public GlobalLinkAccess() {
		super();
	}
		
	public GlobalLinkAccess(Group group, PrimaryLink primaryLink, Integer createdBy) {
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

	public Group getAdm_role() {
		return adm_role;
	}

	public void setAdm_role(Group adm_role) {
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

	@Override
	public String toString() {
		return "GlobalLinkAccess [id=" + id + ", adm_role=" + adm_role + ", primaryLink=" + primaryLink + ", action="
				+ action + ", createdBy=" + createdBy + ", createOn=" + createOn + ", updatedBy=" + updatedBy
				+ ", updatedOn=" + updatedOn + ", status=" + status + "]";
	}

}
