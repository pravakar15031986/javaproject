package com.csm.ORSAC.adminconsole.webportal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="m_por_linkaccess")
public class UserLinkAccess implements Serializable {
	

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name="intAccessId")
	private int accessId;
	
	@Column(name="intUserID")
	private int userID;
	
	@Column(name="intPlinkId")
	private int primaryLinkID;
	
	
	@Column(name="vchAction1")
	private String action;
	
	
	@Column(name="tinAccess")
	private boolean access;
	
	
	@Column(name="intCreatedBy")
	private int createdBy;
	
	@Column(name="dtmCreatedOn")
	private Timestamp createOn;
	
	@Column(name="intUpdatedBy")
	private int updateBy;
	
	@Column(name="dtmUpdatedOn")
	private Timestamp updateOn;
	
	@Column(name="bitStatus")
	private boolean status;

	
	@Override
	public boolean equals(Object obj) {
		if (obj == null)
		    return false;

		  if (this.getClass() != obj.getClass())
		    return false;

       UserLinkAccess plnk = (UserLinkAccess)obj;
      if( plnk.getPrimaryLinkID() == this.primaryLinkID && plnk.getUserID() == this.userID)
    	  return true;
         return false;
	}
	
	@Override
	public int hashCode() {
		return this.primaryLinkID + this.userID;
	}
	
	
	
	
	public int getAccessId() {
		return accessId;
	}

	public void setAccessId(int accessId) {
		this.accessId = accessId;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getPrimaryLinkID() {
		return primaryLinkID;
	}

	public void setPrimaryLinkID(int primaryLinkID) {
		this.primaryLinkID = primaryLinkID;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public boolean isAccess() {
		return access;
	}

	public void setAccess(boolean access) {
		this.access = access;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreateOn() {
		return createOn;
	}

	public void setCreateOn(Timestamp createOn) {
		this.createOn = createOn;
	}

	public int getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(int updateBy) {
		this.updateBy = updateBy;
	}

	public Timestamp getUpdateOn() {
		return updateOn;
	}

	public void setUpdateOn(Timestamp updateOn) {
		this.updateOn = updateOn;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UserLinkAccess [accessId=" + accessId + ", userID=" + userID + ", primaryLinkID=" + primaryLinkID
				+ ", action=" + action + ", access=" + access + ", createdBy=" + createdBy + ", createOn=" + createOn
				+ ", updateBy=" + updateBy + ", updateOn=" + updateOn + ", status=" + status + "]";
	}

	
	
	

}
