package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;


import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;



public class AdminRole1 implements Serializable{

	
	private static final long serialVersionUID = 1L;

	private int id;
	
	@NotEmpty
	@NotBlank
	private String name;
	
	private String desc;
	
	private Date create_date;
	
	private int created_by;
	
	private Date update_on;
	
	private Integer update_by;
	
	private boolean status;
	
	
	private Set<AdminRolePermission> adminRolePermissions =new HashSet<>(0);

	public AdminRole1() {

		
	}
	public AdminRole1(int role_id) {
		this.id=role_id;
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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public int getCreated_by() {
		return created_by;
	}

	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}

	public Date getUpdate_on() {
		return update_on;
	}

	public void setUpdate_on(Date update_on) {
		this.update_on = update_on;
	}

	public Integer getUpdate_by() {
		return update_by;
	}

	public void setUpdate_by(Integer update_by) {
		this.update_by = update_by;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Set<AdminRolePermission> getAdminRolePermissions() {
		return adminRolePermissions;
	}

	public void setAdminRolePermissions(Set<AdminRolePermission> adminRolePermissions) {
		this.adminRolePermissions = adminRolePermissions;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "AdminRole [id=" + id + ", name=" + name + ", desc=" + desc + ", create_date=" + create_date
				+ ", created_by=" + created_by + ", update_on=" + update_on + ", update_by=" + update_by + ", status="
				+ status + ", adminRolePermissions=" + adminRolePermissions + "]";
	}
	
}
