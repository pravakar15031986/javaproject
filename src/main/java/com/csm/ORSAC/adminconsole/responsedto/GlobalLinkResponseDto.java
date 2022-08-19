package com.csm.ORSAC.adminconsole.responsedto;

public class GlobalLinkResponseDto {
	
	private int globalLinkId;
	
	private String globalLinkName;
	
	private int pLinkId;
	
	private String primaryLinkName;
	
	
	private  String action;


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


	public int getpLinkId() {
		return pLinkId;
	}


	public void setpLinkId(int pLinkId) {
		this.pLinkId = pLinkId;
	}


	public String getPrimaryLinkName() {
		return primaryLinkName;
	}


	public void setPrimaryLinkName(String primaryLinkName) {
		this.primaryLinkName = primaryLinkName;
	}


	public String getAction() {
		return action;
	}


	public void setAction(String action) {
		this.action = action;
	}


	@Override
	public String toString() {
		return "GlobalLinkResponseDto [globalLinkId=" + globalLinkId + ", globalLinkName=" + globalLinkName
				+ ", pLinkId=" + pLinkId + ", primaryLinkName=" + primaryLinkName + ", action=" + action + "]";
	}
	

	
	
}
