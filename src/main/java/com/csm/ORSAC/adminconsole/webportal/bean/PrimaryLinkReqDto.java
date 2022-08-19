package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;

public class PrimaryLinkReqDto implements Serializable {

	
	private static final long serialVersionUID = 1L;
	private int userId;
	private int pLinkId;
	private  int action;
	
	
	
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getpLinkId() {
		return pLinkId;
	}
	public void setpLinkId(int pLinkId) {
		this.pLinkId = pLinkId;
	}
	public int getAction() {
		return action;
	}
	public void setAction(int action) {
		this.action = action;
	}
	@Override
	public String toString() {
		return "PrimaryLinkReqDto [userId=" + userId + ", pLinkId=" + pLinkId + ", action=" + action + "]";
	}
	
}
