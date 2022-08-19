package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;

public class MemberType implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
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
	@Override
	public String toString() {
		return "MemberType [memberTypId=" + memberTypId + ", memTypName=" + memTypName + ", memTypCode=" + memTypCode
				+ ", deletedStatus=" + deletedStatus + "]";
	}

	
}
