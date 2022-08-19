package com.csm.ORSAC.webportal.bean;

public class QueryLogViewBean {
	private Integer sNo;
	private Integer userId;
	private String userName;
	private String fullName;
	private String role;
	private String ipAddress;
	private String query;
	private String queryTime;
	private String modalLink;

	public Integer getsNo() {
		return sNo;
	}

	public void setsNo(Integer sNo) {
		this.sNo = sNo;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getQueryTime() {
		return queryTime;
	}

	public void setQueryTime(String queryTime) {
		this.queryTime = queryTime;
	}

	public String getModalLink() {
		return modalLink;
	}

	public void setModalLink(String modalLink) {
		this.modalLink = modalLink;
	}

	@Override
	public String toString() {
		return "QueryLogViewBean [sNo=" + sNo + ", userId=" + userId + ", userName=" + userName + ", fullName="
				+ fullName + ", role=" + role + ", ipAddress=" + ipAddress + ", query=" + query + ", queryTime="
				+ queryTime + ", modalLink=" + modalLink + "]";
	}


}
