package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;

public class SearchVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private String approvalProcessName;

	private String organizationName;

	private int dataId;

	private String dataName;

	private int levelDetailId;

	private String levelName;

	private int countryId;
	private int regionId;
	private int zoneId;
	private int woredaId;
	private int kebeleId;
	private String regionName;
	private String zoneName;
	private String woredaName;
	private String kebeleName;
	private String surveyNo;
	private String sampleId;
	private String surveyDateFrom;
	private String surveyDateTo;
	private int rustTypeId;
	private int diffSetNo;
	private int isFirstDiffLine;
	private int deleteFlag;

	// Search filter parameter in viewadvisory page
	private String advNo;
	private String advUploadDtFrom;
	private String advUploadDtTo;
	// Search filter parameter in view Published advisory
	private String advDtFrom;
	private String advDtTo;

	// Search filter for forward recommendation by boa
	private String recNo;
	private String recDtFrom;
	private String recDtTo;
	private int recomType;
	private String raceResult;
	private Integer labId;

	private int userId;
	private String mobileno;
	private String email;
	private String fullname;
	private String center;
	private String desn;
	private String year;
	private int seasonId;
	private String currentYear;

	// search filter for View Yellow Race Phenotype
	private int genGroupId;
	private String raceName;
	private String status;

	private String startDate;
	private String endDate;
	private String rustTypeName;

	private int labtroyId;
	private int rcId;

	private String hlId;

	private Integer rustId;

	private Integer servRegionId;
	private Integer servZoneId;
	private Integer servWoredaId;
	private Integer servKebeleId;
	private Integer servRustId;
	private int yearId;
	private String ntfDateFrom;
	private String ntfDateTo;
	private String createdDateFrom;
	private String createdDateTo;
	private Integer pageSize;
	private Integer pageLength;
	private Integer searchBySeason;
	private Integer searchByDate;

	public String getNtfDateFrom() {
		return ntfDateFrom;
	}

	public String getNtfDateTo() {
		return ntfDateTo;
	}

	public String getCreatedDateFrom() {
		return createdDateFrom;
	}

	public String getCreatedDateTo() {
		return createdDateTo;
	}

	public void setNtfDateFrom(String ntfDateFrom) {
		this.ntfDateFrom = ntfDateFrom;
	}

	public void setNtfDateTo(String ntfDateTo) {
		this.ntfDateTo = ntfDateTo;
	}

	public void setCreatedDateFrom(String createdDateFrom) {
		this.createdDateFrom = createdDateFrom;
	}

	public void setCreatedDateTo(String createdDateTo) {
		this.createdDateTo = createdDateTo;
	}

	public Integer getServRegionId() {
		return servRegionId;
	}

	public void setServRegionId(Integer servRegionId) {
		this.servRegionId = servRegionId;
	}

	public Integer getServZoneId() {
		return servZoneId;
	}

	public void setServZoneId(Integer servZoneId) {
		this.servZoneId = servZoneId;
	}

	public Integer getServWoredaId() {
		return servWoredaId;
	}

	public void setServWoredaId(Integer servWoredaId) {
		this.servWoredaId = servWoredaId;
	}

	public Integer getServKebeleId() {
		return servKebeleId;
	}

	public void setServKebeleId(Integer servKebeleId) {
		this.servKebeleId = servKebeleId;
	}

	public Integer getServRustId() {
		return servRustId;
	}

	public void setServRustId(Integer servRustId) {
		this.servRustId = servRustId;
	}

	public void setLabId(Integer labId) {
		this.labId = labId;
	}

	private int seasonTypeId;

	public int getYearId() {
		return yearId;
	}

	public int getSeasonTypeId() {
		return seasonTypeId;
	}

	public void setYearId(int yearId) {
		this.yearId = yearId;
	}

	public void setSeasonTypeId(int seasonTypeId) {
		this.seasonTypeId = seasonTypeId;
	}

	public String getHlId() {
		return hlId;
	}

	public void setHlId(String hlId) {
		this.hlId = hlId;
	}

	public int getLabtroyId() {
		return labtroyId;
	}

	public void setLabtroyId(int labtroyId) {
		this.labtroyId = labtroyId;
	}

	public void setRcId(int rcId) {
		this.rcId = rcId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getGenGroupId() {
		return genGroupId;
	}

	public String getRaceName() {
		return raceName;
	}

	public void setGenGroupId(int genGroupId) {
		this.genGroupId = genGroupId;
	}

	public void setRaceName(String raceName) {
		this.raceName = raceName;
	}

	private String monitorRefNumber;
	private String recommendNumber;
	private String monitorStartDate;
	private String monitorEndDate;

	public int getRcId() {
		return rcId;
	}

	public void setRcId(Integer rcId) {
		this.rcId = rcId;
	}

	public Integer getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	public String getRustTypeName() {
		return rustTypeName;
	}

	public void setRustTypeName(String rustTypeName) {
		this.rustTypeName = rustTypeName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getCurrentYear() {
		return currentYear;
	}

	public void setCurrentYear(String currentYear) {
		this.currentYear = currentYear;
	}

	public String getYear() {
		return year;
	}

	public int getSeasonId() {
		return seasonId;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public void setSeasonId(int seasonId) {
		this.seasonId = seasonId;
	}

	public String getMobileno() {
		return mobileno;
	}

	public String getEmail() {
		return email;
	}

	public String getFullname() {
		return fullname;
	}

	public String getCenter() {
		return center;
	}

	public String getDesn() {
		return desn;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public void setCenter(String center) {
		this.center = center;
	}

	public void setDesn(String desn) {
		this.desn = desn;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getKebeleId() {
		return kebeleId;
	}

	public String getRecNo() {
		return recNo;
	}

	public String getRecDtFrom() {
		return recDtFrom;
	}

	public String getRecDtTo() {
		return recDtTo;
	}

	public void setKebeleId(int kebeleId) {
		this.kebeleId = kebeleId;
	}

	public void setRecNo(String recNo) {
		this.recNo = recNo;
	}

	public void setRecDtFrom(String recDtFrom) {
		this.recDtFrom = recDtFrom;
	}

	public void setRecDtTo(String recDtTo) {
		this.recDtTo = recDtTo;
	}

	public String getAdvDtFrom() {
		return advDtFrom;
	}

	public String getAdvDtTo() {
		return advDtTo;
	}

	public void setAdvDtFrom(String advDtFrom) {
		this.advDtFrom = advDtFrom;
	}

	public void setAdvDtTo(String advDtTo) {
		this.advDtTo = advDtTo;
	}

	public String getAdvUploadDtFrom() {
		return advUploadDtFrom;
	}

	public String getAdvUploadDtTo() {
		return advUploadDtTo;
	}

	public void setAdvUploadDtFrom(String advUploadDtFrom) {
		this.advUploadDtFrom = advUploadDtFrom;
	}

	public void setAdvUploadDtTo(String advUploadDtTo) {
		this.advUploadDtTo = advUploadDtTo;
	}

	public String getAdvNo() {
		return advNo;
	}

	public void setAdvNo(String advNo) {
		this.advNo = advNo;
	}

	public int getDiffSetNo() {
		return diffSetNo;
	}

	public int getIsFirstDiffLine() {
		return isFirstDiffLine;
	}

	public void setDiffSetNo(int diffSetNo) {
		this.diffSetNo = diffSetNo;
	}

	public void setIsFirstDiffLine(int isFirstDiffLine) {
		this.isFirstDiffLine = isFirstDiffLine;
	}

	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(String surveyNo) {
		this.surveyNo = surveyNo;
	}

	public String getSampleId() {
		return sampleId;
	}

	public void setSampleId(String sampleId) {
		this.sampleId = sampleId;
	}

	public String getSurveyDateFrom() {
		return surveyDateFrom;
	}

	public void setSurveyDateFrom(String surveyDateFrom) {
		this.surveyDateFrom = surveyDateFrom;
	}

	public String getSurveyDateTo() {
		return surveyDateTo;
	}

	public void setSurveyDateTo(String surveyDateTo) {
		this.surveyDateTo = surveyDateTo;
	}

	public int getRustTypeId() {
		return rustTypeId;
	}

	public void setRustTypeId(int rustTypeId) {
		this.rustTypeId = rustTypeId;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getZoneName() {
		return zoneName;
	}

	public void setZoneName(String zoneName) {
		this.zoneName = zoneName;
	}

	public String getWoredaName() {
		return woredaName;
	}

	public void setWoredaName(String woredaName) {
		this.woredaName = woredaName;
	}

	public String getKebeleName() {
		return kebeleName;
	}

	public void setKebeleName(String kebeleName) {
		this.kebeleName = kebeleName;
	}

	public int getDataId() {
		return dataId;
	}

	public void setDataId(int dataId) {
		this.dataId = dataId;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public int getLevelDetailId() {
		return levelDetailId;
	}

	public void setLevelDetailId(int levelDetailId) {
		this.levelDetailId = levelDetailId;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	@Override
	public String toString() {
		return "SearchVo [approvalProcessName=" + approvalProcessName + ", organizationName=" + organizationName
				+ ", dataId=" + dataId + ", dataName=" + dataName + ", levelDetailId=" + levelDetailId + ", levelName="
				+ levelName + ", countryId=" + countryId + ", regionId=" + regionId + ", zoneId=" + zoneId
				+ ", woredaId=" + woredaId + ", kebeleId=" + kebeleId + ", regionName=" + regionName + ", zoneName="
				+ zoneName + ", woredaName=" + woredaName + ", kebeleName=" + kebeleName + ", surveyNo=" + surveyNo
				+ ", sampleId=" + sampleId + ", surveyDateFrom=" + surveyDateFrom + ", surveyDateTo=" + surveyDateTo
				+ ", rustTypeId=" + rustTypeId + ", diffSetNo=" + diffSetNo + ", isFirstDiffLine=" + isFirstDiffLine
				+ ", deleteFlag=" + deleteFlag + ", advNo=" + advNo + ", advUploadDtFrom=" + advUploadDtFrom
				+ ", advUploadDtTo=" + advUploadDtTo + ", advDtFrom=" + advDtFrom + ", advDtTo=" + advDtTo + ", recNo="
				+ recNo + ", recDtFrom=" + recDtFrom + ", recDtTo=" + recDtTo + ", raceResult=" + raceResult
				+ ", labId=" + labId + ", userId=" + userId + ", mobileno=" + mobileno + ", email=" + email
				+ ", fullname=" + fullname + ", center=" + center + ", desn=" + desn + ", year=" + year + ", seasonId="
				+ seasonId + ", currentYear=" + currentYear + ", genGroupId=" + genGroupId + ", raceName=" + raceName
				+ ", status=" + status + ", startDate=" + startDate + ", endDate=" + endDate + ", rustTypeName="
				+ rustTypeName + ", labtroyId=" + labtroyId + ", rcId=" + rcId + ", hlId=" + hlId + ", rustId=" + rustId
				+ ", monitorRefNumber=" + monitorRefNumber + ", recommendNumber=" + recommendNumber
				+ ", monitorStartDate=" + monitorStartDate + ", monitorEndDate=" + monitorEndDate + ", getHlId()="
				+ getHlId() + ", getLabtroyId()=" + getLabtroyId() + ", getStatus()=" + getStatus()
				+ ", getGenGroupId()=" + getGenGroupId() + ", getRaceName()=" + getRaceName() + ", getRcId()="
				+ getRcId() + ", getLabId()=" + getLabId() + ", getRustTypeName()=" + getRustTypeName()
				+ ", getStartDate()=" + getStartDate() + ", getEndDate()=" + getEndDate() + ", getCurrentYear()="
				+ getCurrentYear() + ", getYear()=" + getYear() + ", getSeasonId()=" + getSeasonId()
				+ ", getMobileno()=" + getMobileno() + ", getEmail()=" + getEmail() + ", getFullname()=" + getFullname()
				+ ", getCenter()=" + getCenter() + ", getDesn()=" + getDesn() + ", getUserId()=" + getUserId()
				+ ", getKebeleId()=" + getKebeleId() + ", getRecNo()=" + getRecNo() + ", getRecDtFrom()="
				+ getRecDtFrom() + ", getRecDtTo()=" + getRecDtTo() + ", getAdvDtFrom()=" + getAdvDtFrom()
				+ ", getAdvDtTo()=" + getAdvDtTo() + ", getAdvUploadDtFrom()=" + getAdvUploadDtFrom()
				+ ", getAdvUploadDtTo()=" + getAdvUploadDtTo() + ", getAdvNo()=" + getAdvNo() + ", getDiffSetNo()="
				+ getDiffSetNo() + ", getIsFirstDiffLine()=" + getIsFirstDiffLine() + ", getDeleteFlag()="
				+ getDeleteFlag() + ", getSurveyNo()=" + getSurveyNo() + ", getSampleId()=" + getSampleId()
				+ ", getSurveyDateFrom()=" + getSurveyDateFrom() + ", getSurveyDateTo()=" + getSurveyDateTo()
				+ ", getRustTypeId()=" + getRustTypeId() + ", getRegionName()=" + getRegionName() + ", getZoneName()="
				+ getZoneName() + ", getWoredaName()=" + getWoredaName() + ", getKebeleName()=" + getKebeleName()
				+ ", getDataId()=" + getDataId() + ", getDataName()=" + getDataName() + ", getCountryId()="
				+ getCountryId() + ", getLevelDetailId()=" + getLevelDetailId() + ", getLevelName()=" + getLevelName()
				+ ", getApprovalProcessName()=" + getApprovalProcessName() + ", getOrganizationName()="
				+ getOrganizationName() + ", getRegionId()=" + getRegionId() + ", getZoneId()=" + getZoneId()
				+ ", getWoredaId()=" + getWoredaId() + ", getRaceResult()=" + getRaceResult()
				+ ", getMonitorRefNumber()=" + getMonitorRefNumber() + ", getRecommendNumber()=" + getRecommendNumber()
				+ ", getMonitorStartDate()=" + getMonitorStartDate() + ", getMonitorEndDate()=" + getMonitorEndDate()
				+ ", getRustId()=" + getRustId() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	public String getApprovalProcessName() {
		return approvalProcessName;
	}

	public void setApprovalProcessName(String approvalProcessName) {
		this.approvalProcessName = approvalProcessName;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public int getRegionId() {
		return regionId;
	}

	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}

	public int getZoneId() {
		return zoneId;
	}

	public void setZoneId(int zoneId) {
		this.zoneId = zoneId;
	}

	public int getWoredaId() {
		return woredaId;
	}

	public void setWoredaId(int woredaId) {
		this.woredaId = woredaId;
	}

	public String getRaceResult() {
		return raceResult;
	}

	public void setRaceResult(String raceResult) {
		this.raceResult = raceResult;
	}

	public String getMonitorRefNumber() {
		return monitorRefNumber;
	}

	public void setMonitorRefNumber(String monitorRefNumber) {
		this.monitorRefNumber = monitorRefNumber;
	}

	public String getRecommendNumber() {
		return recommendNumber;
	}

	public void setRecommendNumber(String recommendNumber) {
		this.recommendNumber = recommendNumber;
	}

	public String getMonitorStartDate() {
		return monitorStartDate;
	}

	public void setMonitorStartDate(String monitorStartDate) {
		this.monitorStartDate = monitorStartDate;
	}

	public String getMonitorEndDate() {
		return monitorEndDate;
	}

	public void setMonitorEndDate(String monitorEndDate) {
		this.monitorEndDate = monitorEndDate;
	}

	public Integer getRustId() {
		return rustId;
	}

	public void setRustId(Integer rustId) {
		this.rustId = rustId;
	}

	public int getRecomType() {
		return recomType;
	}

	public void setRecomType(int recomType) {
		this.recomType = recomType;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageLength() {
		return pageLength;
	}

	public void setPageLength(Integer pageLength) {
		this.pageLength = pageLength;
	}

	public Integer getSearchBySeason() {
		return searchBySeason;
	}

	public void setSearchBySeason(Integer searchBySeason) {
		this.searchBySeason = searchBySeason;
	}

	public Integer getSearchByDate() {
		return searchByDate;
	}

	public void setSearchByDate(Integer searchByDate) {
		this.searchByDate = searchByDate;
	}

}
