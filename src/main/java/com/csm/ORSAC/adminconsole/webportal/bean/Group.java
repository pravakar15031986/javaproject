package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;



public class Group implements Serializable{

	
	private static final long serialVersionUID = 1L;

	private int id;
	
	private String name;
	
	private String aliasName;
	
	private String desc;
	
	private int create_by;
	
	private Timestamp creat_date;
	
	private int updated_by;
	
	private Timestamp update_on;
	
	private boolean status;
	
	
	private Set<GlobalLinkAccess> adminRolePermissions =new HashSet<>(0);

	public Group() {

		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAliasName() {
		return aliasName;
	}

	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public int getCreate_by() {
		return create_by;
	}

	public void setCreate_by(int create_by) {
		this.create_by = create_by;
	}

	public Timestamp getCreat_date() {
		return creat_date;
	}

	public void setCreat_date(Timestamp creat_date) {
		this.creat_date = creat_date;
	}

	public int getUpdated_by() {
		return updated_by;
	}

	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}

	public Timestamp getUpdate_on() {
		return update_on;
	}

	public void setUpdate_on(Timestamp update_on) {
		this.update_on = update_on;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Set<GlobalLinkAccess> getAdminRolePermissions() {
		return adminRolePermissions;
	}

	public void setAdminRolePermissions(Set<GlobalLinkAccess> adminRolePermissions) {
		this.adminRolePermissions = adminRolePermissions;
	}

	@Override
	public String toString() {
		return "Group [id=" + id + ", name=" + name + ", aliasName=" + aliasName + ", desc=" + desc + ", create_by="
				+ create_by + ", creat_date=" + creat_date + ", updated_by=" + updated_by + ", update_on=" + update_on
				+ ", status=" + status + ", adminRolePermissions=" + adminRolePermissions + "]";
	}

	
	
}
