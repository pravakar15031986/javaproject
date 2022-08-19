package com.csm.ORSAC.webportal.entity;

import java.io.Serializable;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author dibyamohan.panda
 *
 */

@Entity
@Table(name = "t_mis_reporting_survey")
public class SurveyDto implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@Column(name = "plot_code")
	private String plot_code;
	
	@Column(name = "crop_status")
	private int crop_status;
	
	@Column(name = "surveyor_position")
	private String surveyor_position;
	
	@Column(name = "surveyor_distance")
	private double 	surveyor_distance;
	
	@Column(name = "area_vald")
	private double area_vald;
	
	@Column(name = "photo_land1")
	private String photo_land1;
	
	@Column(name = "photo_land2")
	private String photo_land2;
	
	@Column(name = "photo_land3")
	private String photo_land3;
	
	@Column(name = "photo_land4")
	private String photo_land4;
	
	@Column(name = "photo_selfie")
	private String photo_selfie;
	
	@Column(name = "nh_paddy")
	private String nerabyField;
	
	@Column(name = "remark")
	private String remark;
	
	@Column(name = "latlong")
	private String latlong;
	
	@Column(name = "kms_year")
	private String kms_year;
	
	@Column(name = "season")
	private String season;
	
	@Column(name = "intCreatedBy")
	private int created_by;
	
	@Column(name = "dtmCreatedOn")
	private Timestamp created_on;
	
	@Column(name = "intUpdatedBy")
	private int modified_by;
	
	@Column(name = "dtmUpdatedOn")
	private Timestamp modified_on;
	
	@Column(name = "deleted_flag")
	private int deleted_flag;
	
	@Column(name = "status")
	private int status;
	
	@Column(name = "dtmSyncOn")
	private Timestamp sync_on;
	
	@Column(name = "rejremark")
	private String rejremark;

	public String getPlot_code() {
		return plot_code;
	}

	public void setPlot_code(String plot_code) {
		this.plot_code = plot_code;
	}

	public int getCrop_status() {
		return crop_status;
	}

	public void setCrop_status(int crop_status) {
		this.crop_status = crop_status;
	}

	public String getSurveyor_position() {
		return surveyor_position;
	}

	public void setSurveyor_position(String surveyor_position) {
		this.surveyor_position = surveyor_position;
	}

	public double getSurveyor_distance() {
		return surveyor_distance;
	}

	public void setSurveyor_distance(double surveyor_distance) {
		this.surveyor_distance = surveyor_distance;
	}

	public double getArea_vald() {
		return area_vald;
	}

	public void setArea_vald(double area_vald) {
		this.area_vald = area_vald;
	}

	public String getPhoto_land1() {
		return photo_land1;
	}

	public void setPhoto_land1(String photo_land1) {
		this.photo_land1 = photo_land1;
	}

	public String getPhoto_land2() {
		return photo_land2;
	}

	public void setPhoto_land2(String photo_land2) {
		this.photo_land2 = photo_land2;
	}

	public String getPhoto_land3() {
		return photo_land3;
	}

	public void setPhoto_land3(String photo_land3) {
		this.photo_land3 = photo_land3;
	}

	public String getPhoto_land4() {
		return photo_land4;
	}

	public void setPhoto_land4(String photo_land4) {
		this.photo_land4 = photo_land4;
	}

	public String getPhoto_selfie() {
		return photo_selfie;
	}

	public void setPhoto_selfie(String photo_selfie) {
		this.photo_selfie = photo_selfie;
	}

	public String getNerabyField() {
		return nerabyField;
	}

	public void setNerabyField(String nerabyField) {
		this.nerabyField = nerabyField;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getLatlong() {
		return latlong;
	}

	public void setLatlong(String latlong) {
		this.latlong = latlong;
	}

	public String getKms_year() {
		return kms_year;
	}

	public void setKms_year(String kms_year) {
		this.kms_year = kms_year;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public int getCreated_by() {
		return created_by;
	}

	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}

	public Timestamp getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Timestamp created_on) {
		this.created_on = created_on;
	}

	public int getModified_by() {
		return modified_by;
	}

	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
	}

	public Timestamp getModified_on() {
		return modified_on;
	}

	public void setModified_on(Timestamp modified_on) {
		this.modified_on = modified_on;
	}

	public int getDeleted_flag() {
		return deleted_flag;
	}

	public void setDeleted_flag(int deleted_flag) {
		this.deleted_flag = deleted_flag;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Timestamp getSync_on() {
		return sync_on;
	}

	public void setSync_on(Timestamp sync_on) {
		this.sync_on = sync_on;
	}

	public String getRejremark() {
		return rejremark;
	}

	public void setRejremark(String rejremark) {
		this.rejremark = rejremark;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	

}
