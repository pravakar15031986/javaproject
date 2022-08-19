package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;

import com.csm.ORSAC.adminconsole.webportal.util.Pagination;


public class UserSearchReqDto  implements Serializable{
	
	
	
	private static final long serialVersionUID = 1L;
	
	
	private String name;
	private int groupId;
	private int userId;
	
	private Pagination pagination;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "UserSearchReqDto [name=" + name + ", groupId=" + groupId + ", userId=" + userId + ", pagination="
				+ pagination + "]";
	}
	
}
