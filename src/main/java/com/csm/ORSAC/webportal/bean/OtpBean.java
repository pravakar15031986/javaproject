package com.csm.ORSAC.webportal.bean;

/**
 * 
 * @author dibyamohan.panda
 * This Bean is used for
 * send OTP and capture OTP
 * response details from API
 */
public class OtpBean {

	
	private String mobNumber;
	private String device_id;
	private String otp;
	private String status;
	private String msg;
	private String district_id;
	private String block_id;
	private String society_id;
	public String getMobNumber() {
		return mobNumber;
	}
	public void setMobNumber(String mobNumber) {
		this.mobNumber = mobNumber;
	}
	public String getDevice_id() {
		return device_id;
	}
	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(String district_id) {
		this.district_id = district_id;
	}
	public String getBlock_id() {
		return block_id;
	}
	public void setBlock_id(String block_id) {
		this.block_id = block_id;
	}
	public String getSociety_id() {
		return society_id;
	}
	public void setSociety_id(String society_id) {
		this.society_id = society_id;
	}
	@Override
	public String toString() {
		return "OtpBean [mobNumber=" + mobNumber + ", device_id=" + device_id + ", otp=" + otp + ", status=" + status
				+ ", msg=" + msg + ", district_id=" + district_id + ", block_id=" + block_id + ", society_id="
				+ society_id + "]";
	}

	
	
	
	
	

}
