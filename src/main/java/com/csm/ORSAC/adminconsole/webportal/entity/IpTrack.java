package com.csm.ORSAC.adminconsole.webportal.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_por_iptracking")
public class IpTrack {

	@Id
	@Column(name = "intIPTrackId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "vchIPAddress")
	private String ipaddress;

	@Column(name = "dtmLogin")
	private Timestamp logintime;

	@Column(name = "chrLoginSucessFailure")
	private char loginSuccess;

	@Column(name = "vchFalierReason")
	private String failReason;

	@Column(name = "dtmLogout")
	private Timestamp logoutime;

	@Column(name = "intCreatedBy")
	private int createdBy;

	@Column(name = "dtmCreatedOn")
	private Timestamp createOn;

	@Column(name = "tintDeletedStatus")
	private boolean deleteStatus;

	@Column(name = "vchBrowserName")
	private String browserName;

	@Column(name = "vchBrowserVersion")
	private String browserVersion;

	@Column(name = "vchOSName")
	private String OsName;

	@Column(name = "vchDeviceType")
	private String vchDeviceType;

	@Column(name = "vchDeviceBrand")
	private String deviceBrand;


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIpaddress() {
		return ipaddress;
	}

	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}

	public Timestamp getLogintime() {
		return logintime;
	}

	public void setLogintime(Timestamp logintime) {
		this.logintime = logintime;
	}

	public char getLoginSuccess() {
		return loginSuccess;
	}

	public void setLoginSuccess(char loginSuccess) {
		this.loginSuccess = loginSuccess;
	}

	public String getFailReason() {
		return failReason;
	}

	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}

	public Timestamp getLogoutime() {
		return logoutime;
	}

	public void setLogoutime(Timestamp logoutime) {
		this.logoutime = logoutime;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreateOn() {
		return createOn;
	}

	public void setCreateOn(Timestamp createOn) {
		this.createOn = createOn;
	}

	public boolean isDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(boolean deleteStatus) {
		this.deleteStatus = deleteStatus;
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
		return OsName;
	}

	public void setOsName(String osName) {
		OsName = osName;
	}

	public String getVchDeviceType() {
		return vchDeviceType;
	}

	public void setVchDeviceType(String vchDeviceType) {
		this.vchDeviceType = vchDeviceType;
	}

	public String getDeviceBrand() {
		return deviceBrand;
	}

	public void setDeviceBrand(String deviceBrand) {
		this.deviceBrand = deviceBrand;
	}

	@Override
	public String toString() {
		return "IpTrack [id=" + id + ", ipaddress=" + ipaddress + ", logintime=" + logintime + ", loginSuccess="
				+ loginSuccess + ", failReason=" + failReason + ", logoutime=" + logoutime + ", createdBy=" + createdBy
				+ ", createOn=" + createOn + ", deleteStatus=" + deleteStatus + ", browserName=" + browserName
				+ ", browserVersion=" + browserVersion + ", OsName=" + OsName + ", vchDeviceType=" + vchDeviceType
				+ ", deviceBrand=" + deviceBrand + "]";
	}

}
