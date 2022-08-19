package com.csm.ORSAC.webportal.bean;

public class PacsDataBean {
	private String societyId;
	private String societyName;
	private String blockId;
	
	public String getSocietyId() {
		return societyId;
	}
	public void setSocietyId(String societyId) {
		this.societyId = societyId;
	}
	public String getSocietyName() {
		return societyName;
	}
	public void setSocietyName(String societyName) {
		this.societyName = societyName;
	}
	public String getBlockId() {
		return blockId;
	}
	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}
	@Override
	public String toString() {
		return "PacsDataBean [societyId=" + societyId + ", societyName=" + societyName + ", blockId=" + blockId + "]";
	}
	
	

}
