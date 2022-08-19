package com.csm.ORSAC.webportal.bean;

public class VillageBoundaryMasterBean {
	
	private String vill_code;
	
	private String vill_name;
	
	private String extent;

	public String getVill_code() {
		return vill_code;
	}

	public void setVill_code(String vill_code) {
		this.vill_code = vill_code;
	}

	public String getVill_name() {
		return vill_name;
	}

	public void setVill_name(String vill_name) {
		this.vill_name = vill_name;
	}

	public String getExtent() {
		return extent;
	}

	public void setExtent(String extent) {
		this.extent = extent;
	}

	@Override
	public String toString() {
		return "VillageBoundaryMasterBean [vill_code=" + vill_code + ", vill_name=" + vill_name + ", extent=" + extent
				+ "]";
	}
	
	

}
