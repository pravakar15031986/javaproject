package com.csm.ORSAC.webportal.bean;

public class BlockDataBean {
	private String blockId;
	private String blockName;
	private String districtId;
	
	public String getBlockId() {
		return blockId;
	}
	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}
	public String getBlockName() {
		return blockName;
	}
	public void setBlockName(String blockName) {
		this.blockName = blockName;
	}
	public String getDistrictId() {
		return districtId;
	}
	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}
	@Override
	public String toString() {
		return "BlockDataBean [blockId=" + blockId + ", blockName=" + blockName + ", districtId=" + districtId + "]";
	}
	
	

}
