package com.csm.ORSAC.adminconsole.webportal.bean;

import javax.validation.constraints.NotBlank;

public class LoginReqDto {

	@NotBlank
	private String username;
	@NotBlank
	private String password;
	@NotBlank
	private String userType;

	private String ipaddress;
	private String browserName;
	private String browserVersion;
	private String osName;
	private String deviceType;
	private String manufactur;

	private String deviceId;
	private String imeiId;
	private String suscriberId;
	private String fcmId;

	public LoginReqDto() {
		super();
	}

	public LoginReqDto(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public LoginReqDto(String username, String password, String userType) {
		super();
		this.username = username;
		this.password = password;
		this.userType = userType;
	}

	public LoginReqDto(String username, String password, String userType, String ipaddress, String browserName,
			String browserVersion, String osName, String deviceType, String manufactur,String deviceId,String imeiId,String suscriberId,String fcmId) {
		super();
		this.username = username;
		this.password = password;
		this.userType = userType;
		this.ipaddress = ipaddress;
		this.browserName = browserName;
		this.browserVersion = browserVersion;
		this.osName = osName;
		this.deviceType = deviceType;
		this.manufactur = manufactur;
		this.deviceId = deviceId;
		this.imeiId=imeiId;
		this.suscriberId=suscriberId;
		this.fcmId=fcmId;
	}

	public String getIpaddress() {
		return ipaddress;
	}

	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}

	public String getBrowserName() {
		return browserName;
	}

	public void setBrowserName(String browserName) {
		this.browserName = browserName;
	}

	public String getBrowserVersion() {
		return browserVersion;
	}

	public void setBrowserVersion(String browserVersion) {
		this.browserVersion = browserVersion;
	}

	public String getOsName() {
		return osName;
	}

	public void setOsName(String osName) {
		this.osName = osName;
	}

	public String getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}

	public String getManufactur() {
		return manufactur;
	}

	public void setManufactur(String manufactur) {
		this.manufactur = manufactur;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getImeiId() {
		return imeiId;
	}

	public void setImeiId(String imeiId) {
		this.imeiId = imeiId;
	}

	public String getSuscriberId() {
		return suscriberId;
	}

	public void setSuscriberId(String suscriberId) {
		this.suscriberId = suscriberId;
	}

	public String getFcmId() {
		return fcmId;
	}

	public void setFcmId(String fcmId) {
		this.fcmId = fcmId;
	}

	@Override
	public String toString() {
		return "LoginReqDto [username=" + username + ", password=" + password + ", userType=" + userType
				+ ", ipaddress=" + ipaddress + ", browserName=" + browserName + ", browserVersion=" + browserVersion
				+ ", osName=" + osName + ", deviceType=" + deviceType + ", manufactur=" + manufactur 
				+ ", deviceId=" + deviceId + ", imeiId=" + imeiId + ", suscriberId=" + suscriberId + ", fcmId=" + fcmId + "]";
	}

}
