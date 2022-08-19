package com.csm.ORSAC.adminconsole.webportal.bean;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class AdminRole {

	private int roleId;

	private String roleName;

	private String description;

	private Timestamp created_on;

	private int created_by;

	private Timestamp updated_on;

	private int updated_by;

	private int bitStatus;

	private String aliasName;

	private Set<GlobalLinkAccess> adminRolePermissions = new HashSet<>(0);

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Timestamp created_on) {
		this.created_on = created_on;
	}

	public int getCreated_by() {
		return created_by;
	}

	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}

	public Timestamp getUpdated_on() {
		return updated_on;
	}

	public void setUpdated_on(Timestamp updated_on) {
		this.updated_on = updated_on;
	}

	public int getUpdated_by() {
		return updated_by;
	}

	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}

	public int getBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(int bitStatus) {
		this.bitStatus = bitStatus;
	}

	public String getAliasName() {
		return aliasName;
	}

	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}

	public Set<GlobalLinkAccess> getAdminRolePermissions() {
		return adminRolePermissions;
	}

	public void setAdminRolePermissions(Set<GlobalLinkAccess> adminRolePermissions) {
		this.adminRolePermissions = adminRolePermissions;
	}

}
