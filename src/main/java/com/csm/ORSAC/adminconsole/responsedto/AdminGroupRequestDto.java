package com.csm.ORSAC.adminconsole.responsedto;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.validation.constraints.NotBlank;

import com.csm.ORSAC.adminconsole.webportal.bean.PrimaryLink;




public class AdminGroupRequestDto implements Serializable{

	private static final long serialVersionUID = 1L;
	
	
	
	private int  id;
	@NotBlank(message= "{validation.roleName.notBlank}")
	private String name;
	private String desc;
	private String aliasName;
	
	private Boolean locationTagged;
	
    private Set<PrimaryLink> primarylinks = new LinkedHashSet<>(0);
    
    
	
	


	public Boolean getLocationTagged() {
		return locationTagged;
	}

	public void setLocationTagged(Boolean locationTagged) {
		this.locationTagged = locationTagged;
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

	public String getAliasName() {
		return aliasName;
	}

	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}

	public Set<PrimaryLink> getPrimarylinks() {
		return primarylinks;
	}

	public void setPrimarylinks(Set<PrimaryLink> primarylinks) {
		this.primarylinks = primarylinks;
	}

	@Override
	public String toString() {
		return "AdminGroupRequestDto [id=" + id + ", name=" + name + ", desc=" + desc + ", aliasName=" + aliasName
				+ ", locationTagged=" + locationTagged + ", primarylinks=" + primarylinks + "]";
	}
	
}
