package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
	import java.util.Date;

	
	public class AdmLevelDetails implements Serializable {
		

		private static final long serialVersionUID = 1L;

		 private int levelDetailId;
		
		private String levelName;

		private int levelId;

		private int parentId;

		private String alias;

		private String telNo;
	 
		private String faxNo;

		private int createdBy;

		private Date createdOn;

		

		private Date updatedOn;
		
		private int bitStatus;

		private String address;
		
		private int hierarchyId;
		private int subHierarchyId;
		
		
		
		private String hdn_PageNo;
		
		private String hdn_RecNo;
		
		private String hdn_IsPaging;
		
		private int countryId;
		
		private int countyId;
		
		private String  CountryName;
		
		private String  CountyName;
		
		
		

		public String getCountryName() {
			return CountryName;
		}

		public void setCountryName(String countryName) {
			CountryName = countryName;
		}

		public String getCountyName() {
			return CountyName;
		}

		public void setCountyName(String countyName) {
			CountyName = countyName;
		}

		public int getLevelDetailId() {
			return levelDetailId;
		}

		public int getCountryId() {
			return countryId;
		}

		public void setCountryId(int countryId) {
			this.countryId = countryId;
		}

		public int getCountyId() {
			return countyId;
		}

		public void setCountyId(int countyId) {
			this.countyId = countyId;
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

		public int getLevelId() {
			return levelId;
		}

		public void setLevelId(int levelId) {
			this.levelId = levelId;
		}

		public int getParentId() {
			return parentId;
		}

		public void setParentId(int parentId) {
			this.parentId = parentId;
		}

		public String getAlias() {
			return alias;
		}

		public void setAlias(String alias) {
			this.alias = alias;
		}

		public String getTelNo() {
			return telNo;
		}

		public void setTelNo(String telNo) {
			this.telNo = telNo;
		}

		public String getFaxNo() {
			return faxNo;
		}

		public void setFaxNo(String faxNo) {
			this.faxNo = faxNo;
		}

		public int getCreatedBy() {
			return createdBy;
		}

		public void setCreatedBy(int createdBy) {
			this.createdBy = createdBy;
		}

		public Date getCreatedOn() {
			return createdOn;
		}

		public void setCreatedOn(Date createdOn) {
			this.createdOn = createdOn;
		}

		public Date getUpdatedOn() {
			return updatedOn;
		}

		public void setUpdatedOn(Date updatedOn) {
			this.updatedOn = updatedOn;
		}

		public int getBitStatus() {
			return bitStatus;
		}

		public void setBitStatus(int bitStatus) {
			this.bitStatus = bitStatus;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public int getHierarchyId() {
			return hierarchyId;
		}

		public void setHierarchyId(int hierarchyId) {
			this.hierarchyId = hierarchyId;
		}

		public int getSubHierarchyId() {
			return subHierarchyId;
		}

		public void setSubHierarchyId(int subHierarchyId) {
			this.subHierarchyId = subHierarchyId;
		}

		public String getHdn_PageNo() {
			return hdn_PageNo;
		}

		public void setHdn_PageNo(String hdn_PageNo) {
			this.hdn_PageNo = hdn_PageNo;
		}

		public String getHdn_RecNo() {
			return hdn_RecNo;
		}

		public void setHdn_RecNo(String hdn_RecNo) {
			this.hdn_RecNo = hdn_RecNo;
		}

		public String getHdn_IsPaging() {
			return hdn_IsPaging;
		}

		public void setHdn_IsPaging(String hdn_IsPaging) {
			this.hdn_IsPaging = hdn_IsPaging;
		}
		

		
		
		
	}
