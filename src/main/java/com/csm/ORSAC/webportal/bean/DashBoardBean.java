package com.csm.ORSAC.webportal.bean;

public class DashBoardBean {
	
	private long distCount;
	private String distName;
	private String pacsName;
	private long totalSurveyors;
	private long completedSurvey;
	private long pendingSurvey;
	private long totalSurvey;
	public long getDistCount() {
		return distCount;
	}
	public void setDistCount(long distCount) {
		this.distCount = distCount;
	}
	public String getDistName() {
		return distName;
	}
	public void setDistName(String distName) {
		this.distName = distName;
	}
	public long getTotalSurveyors() {
		return totalSurveyors;
	}
	public void setTotalSurveyors(long totalSurveyors) {
		this.totalSurveyors = totalSurveyors;
	}
	public long getCompletedSurvey() {
		return completedSurvey;
	}
	public void setCompletedSurvey(long completedSurvey) {
		this.completedSurvey = completedSurvey;
	}
	public long getPendingSurvey() {
		return pendingSurvey;
	}
	public void setPendingSurvey(long pendingSurvey) {
		this.pendingSurvey = pendingSurvey;
	}
	public long getTotalSurvey() {
		return totalSurvey;
	}
	public void setTotalSurvey(long totalSurvey) {
		this.totalSurvey = totalSurvey;
	}
	public String getPacsName() {
		return pacsName;
	}
	public void setPacsName(String pacsName) {
		this.pacsName = pacsName;
	}
	
	

}
