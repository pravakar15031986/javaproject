package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;

public class UserRoleDto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2641642625743651040L;
	private Integer userRoleId;
	private Integer userId;
	private Short roleId;
	private String roleName;

	public Integer getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(Integer userRoleId) {
		this.userRoleId = userRoleId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Short getRoleId() {
		return roleId;
	}

	public void setRoleId(Short roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
