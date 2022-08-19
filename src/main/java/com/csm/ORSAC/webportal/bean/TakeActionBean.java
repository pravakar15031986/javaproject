package com.csm.ORSAC.webportal.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TakeActionBean {

	private String userId;
	private String plotNo;
	private String dateTime;
	private String adjoiningPlot;
	private String fieldDetails;

	private String remarks;
	private MultipartFile selfieImage;
	private List<MultipartFile> landImage;
	private String surveyAction;
	private String surveyDistance;
	private String latUser;
	private String lngUser;
	private String plotCode;
	private String kms;
	private String season;
	private String areaValid;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPlotNo() {
		return plotNo;
	}
	public void setPlotNo(String plotNo) {
		this.plotNo = plotNo;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getFieldDetails() {
		return fieldDetails;
	}
	public void setFieldDetails(String fieldDetails) {
		this.fieldDetails = fieldDetails;
	}

	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public MultipartFile getSelfieImage() {
		return selfieImage;
	}
	public void setSelfieImage(MultipartFile selfieImage) {
		this.selfieImage = selfieImage;
	}
	public List<MultipartFile> getLandImage() {
		return landImage;
	}
	public void setLandImage(List<MultipartFile> landImage) {
		this.landImage = landImage;
	}
	public String getAdjoiningPlot() {
		return adjoiningPlot;
	}
	public void setAdjoiningPlot(String adjoiningPlot) {
		this.adjoiningPlot = adjoiningPlot;
	}
	public String getSurveyAction() {
		return surveyAction;
	}
	public void setSurveyAction(String surveyAction) {
		this.surveyAction = surveyAction;
	}
	public String getSurveyDistance() {
		return surveyDistance;
	}
	public void setSurveyDistance(String surveyDistance) {
		this.surveyDistance = surveyDistance;
	}
	public String getLatUser() {
		return latUser;
	}
	public void setLatUser(String latUser) {
		this.latUser = latUser;
	}
	public String getLngUser() {
		return lngUser;
	}
	public void setLngUser(String lngUser) {
		this.lngUser = lngUser;
	}
	public String getPlotCode() {
		return plotCode;
	}
	public void setPlotCode(String plotCode) {
		this.plotCode = plotCode;
	}
	
	public String getKms() {
		return kms;
	}
	public void setKms(String kms) {
		this.kms = kms;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getAreaValid() {
		return areaValid;
	}
	public void setAreaValid(String areaValid) {
		this.areaValid = areaValid;
	}
	@Override
	public String toString() {
		return "TakeActionBean [userId=" + userId + ", plotNo=" + plotNo + ", dateTime=" + dateTime + ", adjoiningPlot="
				+ adjoiningPlot + ", fieldDetails=" + fieldDetails + ", remarks=" + remarks + ", selfieImage="
				+ selfieImage + ", landImage=" + landImage + ", surveyAction=" + surveyAction + ", surveyDistance="
				+ surveyDistance + ", latUser=" + latUser + ", lngUser=" + lngUser + ", plotCode=" + plotCode + ", kms="
				+ kms + ", season=" + season + ", areaValid=" + areaValid + "]";
	}
	
	
	

}
