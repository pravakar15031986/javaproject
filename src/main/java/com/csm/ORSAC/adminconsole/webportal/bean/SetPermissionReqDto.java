package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.util.List;

public class SetPermissionReqDto implements Serializable{

	
	
	private static final long serialVersionUID = 1L;

	private int uid;
	
	private List<Integer> userId;
	
	private List<PrimaryLinkReqDto> primaryLink;
	
	

	public List<Integer> getUserId() {
		return userId;
	}

	public void setUserId(List<Integer> userId) {
		this.userId = userId;
	}

	public List<PrimaryLinkReqDto> getPrimaryLink() {
		return primaryLink;
	}

	public void setPrimaryLink(List<PrimaryLinkReqDto> primaryLink) {
		this.primaryLink = primaryLink;
	}
	
	

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "SetPermissionReqDto [uid=" + uid + ", userId=" + userId + ", primaryLink=" + primaryLink + "]";
	}

	
}
