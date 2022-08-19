package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.sql.Date;


public class AdminRolePermission implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private AdminRole1 adm_role;
	
	private PrimaryLinkVo primaryLink;
	
	private Date created_date;
	
	private Integer created_by;
	
	private Date updated_date;
	
	private Integer updated_by;
	
	private boolean  status;

	
	public AdminRolePermission() {
		super();
	}
		
	public AdminRolePermission(AdminRole1 adm_role, PrimaryLinkVo primaryLink, Integer created_by) {
		super();
		this.adm_role = adm_role;
		this.primaryLink = primaryLink;
		this.created_by = created_by;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public AdminRole1 getAdm_role() {
		return adm_role;
	}

	public void setAdm_role(AdminRole1 adm_role) {
		this.adm_role = adm_role;
	}

	public Date getCreated_date() {
		return created_date;
	}
	public PrimaryLinkVo getPrimaryLink() {
		return primaryLink;
	}

	public void setPrimaryLink(PrimaryLinkVo primaryLink) {
		this.primaryLink = primaryLink;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

	public Integer getCreated_by() {
		return created_by;
	}

	public void setCreated_by(Integer created_by) {
		this.created_by = created_by;
	}



	public Date getUpdated_date() {
		return updated_date;
	}



	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}



	public Integer getUpdated_by() {
		return updated_by;
	}


	public void setUpdated_by(Integer updated_by) {
		this.updated_by = updated_by;
	}


	public boolean isStatus() {
		return status;
	}


	public void setStatus(boolean status) {
		this.status = status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
