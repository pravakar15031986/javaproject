package com.csm.ORSAC.webportal.bean;

public class DistrictBoundaryMasterBean {
	private String dist_code;
	private String district;
	private String extent;
	public String getDist_code() {
		return dist_code;
	}
	public void setDist_code(String dist_code) {
		this.dist_code = dist_code;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getExtent() {
		return extent;
	}
	public void setExtent(String extent) {
		this.extent = extent;
	}
	@Override
	public String toString() {
		return "DistrictBoundaryMasterBean [dist_code=" + dist_code + ", district=" + district + ", extent=" + extent
				+ "]";
	}
	

}
