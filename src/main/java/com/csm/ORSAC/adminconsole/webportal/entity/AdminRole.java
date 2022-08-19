package com.csm.ORSAC.adminconsole.webportal.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "m_adm_role")
public class AdminRole implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "role_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int roleId;

	@Column(name = "role_name")
	private String roleName;

	@Column(name = "description")
	private String description;

	@Column(name = "created_on")
	private Timestamp created_on;

	@Column(name = "created_by")
	private int created_by;

	@Column(name = "updated_on")
	private Timestamp updated_on;

	@Column(name = "updated_by")
	private int updated_by;

	@Column(name = "status")
	private boolean bitStatus;

	@Column(name = "alias_name")
	private String aliasName;


	@Column(name = "bit_location_taging_required")
	private Boolean locationTagged;

	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "adm_role", cascade = { CascadeType.ALL })
	private Set<GlobalLinkAccess> adminRolePermissions = new HashSet<>(0);

	public Boolean getLocationTagged() {
		return locationTagged;
	}

	public void setLocationTagged(Boolean locationTagged) {
		this.locationTagged = locationTagged;
	}

	public AdminRole() {
	}

	public AdminRole(int id) {
		this.roleId = id;
	}

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

	public boolean getBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(boolean bitStatus) {
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
