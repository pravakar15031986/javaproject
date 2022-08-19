package com.csm.ORSAC.adminconsole.webportal.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity(name = "m_adm_user_role")
public class UserRole {



	@Id
	@Column(name = "int_user_role_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userRoleId;

	@Column(name = "int_user_id")
	private Integer userId;


	@Column(name = "int_role_id")
	private Integer roleId;

	@Column(name = "bitstatus")
	private boolean bitstatus;

	
	

	public boolean isBitstatus() {
		return bitstatus;
	}

	public void setBitstatus(boolean bitstatus) {
		this.bitstatus = bitstatus;
	}

	public Integer getUserId() {
		return userId;
	}

	public Integer getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(Integer userRoleId) {
		this.userRoleId = userRoleId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}
