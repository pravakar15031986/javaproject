package com.csm.ORSAC.webportal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author dibyamohan.panda
 *
 */
@Entity
@Table(name = "t_ppasgis_pacsinspector")
public class PacsInspectorDto implements  Serializable {

	private static final long serialVersionUID = 1L;
	
	
	@Id
	@Column(name = "intpacsinpsid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int intpacsinpsid;
	
	@Column(name = "vchusername")
	private String username;
	
	@Column(name = "vchmobile")
	private String mobile;
	
	@Column(name = "intdesgid")
	private int desgid;
	
	@Column(name = "intstateid")
	private int stateid;
	
	@Column(name = "intgpid")
	private int gpid;
	
	@Column(name = "intvillageid")
	private int villageid;
	
	@Column(name = "vchotp")
	private String otp;
	
	@Column(name = "intstatusid")
	private int status;
	
	@Column(name = "intdeletedflag")
	private boolean deletedflag;
	
	@Column(name = "dtmCreatedOn")
	private Timestamp created_on;
	
	@Column(name = "dtmotpexpiryon")
	private Timestamp otpexpiry_on;
	
	@Column(name = "deviceid")
	private String deviceId;
	
	@Column(name = "pacsid")
	private String pacsId;
	
	@Column(name = "intdistictid")
	private String districtId;
	
	@Column(name = "intblockid")
	private String blockId;
	
	@Column(name = "vchprofileimagename")
	private String profileImageName;
	
	@Column(name = "vchemail")
	private String vchEmail;
	
	@Column(name = "dtmotpgenerateon")
	private Timestamp otpgenerated_on;
	
	@Column(name = "vchrejremark")
	private String rejRemark;
	
	@Column(name = "intapprovedby")
	private int approvedby;
	
	@Column(name = "vch_otp_rescode")
	private String otp_rescode;
	


	public int getIntpacsinpsid() {
		return intpacsinpsid;
	}

	public void setIntpacsinpsid(int intpacsinpsid) {
		this.intpacsinpsid = intpacsinpsid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getDesgid() {
		return desgid;
	}

	public void setDesgid(int desgid) {
		this.desgid = desgid;
	}

	public int getStateid() {
		return stateid;
	}

	public void setStateid(int stateid) {
		this.stateid = stateid;
	}

	public int getGpid() {
		return gpid;
	}

	public void setGpid(int gpid) {
		this.gpid = gpid;
	}

	public int getVillageid() {
		return villageid;
	}

	public void setVillageid(int villageid) {
		this.villageid = villageid;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public boolean isDeletedflag() {
		return deletedflag;
	}

	public void setDeletedflag(boolean deletedflag) {
		this.deletedflag = deletedflag;
	}

	public Timestamp getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Timestamp created_on) {
		this.created_on = created_on;
	}

	public Timestamp getOtpexpiry_on() {
		return otpexpiry_on;
	}

	public void setOtpexpiry_on(Timestamp otpexpiry_on) {
		this.otpexpiry_on = otpexpiry_on;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getPacsId() {
		return pacsId;
	}

	public void setPacsId(String pacsId) {
		this.pacsId = pacsId;
	}

	public String getDistrictId() {
		return districtId;
	}

	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}

	public String getBlockId() {
		return blockId;
	}

	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}

	public String getProfileImageName() {
		return profileImageName;
	}

	public void setProfileImageName(String profileImageName) {
		this.profileImageName = profileImageName;
	}

	public String getVchEmail() {
		return vchEmail;
	}

	public void setVchEmail(String vchEmail) {
		this.vchEmail = vchEmail;
	}

	public Timestamp getOtpgenerated_on() {
		return otpgenerated_on;
	}

	public void setOtpgenerated_on(Timestamp otpgenerated_on) {
		this.otpgenerated_on = otpgenerated_on;
	}

	public String getRejRemark() {
		return rejRemark;
	}

	public void setRejRemark(String rejRemark) {
		this.rejRemark = rejRemark;
	}

	public int getApprovedby() {
		return approvedby;
	}

	public void setApprovedby(int approvedby) {
		this.approvedby = approvedby;
	}

	public String getOtp_rescode() {
		return otp_rescode;
	}

	public void setOtp_rescode(String otp_rescode) {
		this.otp_rescode = otp_rescode;
	}
	
	
	
	
	
	
	
	
	

}
