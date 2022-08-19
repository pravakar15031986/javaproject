package com.csm.ORSAC.webportal.bean;

public class TahasilBoundaryMasterBean {
	
	private String tahasil_cd;
	
	private String tahasil;
	
	private String extent;

	public String getTahasil_cd() {
		return tahasil_cd;
	}

	public void setTahasil_cd(String tahasil_cd) {
		this.tahasil_cd = tahasil_cd;
	}

	public String getTahasil() {
		return tahasil;
	}

	public void setTahasil(String tahasil) {
		this.tahasil = tahasil;
	}

	public String getExtent() {
		return extent;
	}

	public void setExtent(String extent) {
		this.extent = extent;
	}

	@Override
	public String toString() {
		return "TahasilBoundaryMasterBean [tahasil_cd=" + tahasil_cd + ", tahasil=" + tahasil + ", extent=" + extent
				+ "]";
	}
	
	

}
