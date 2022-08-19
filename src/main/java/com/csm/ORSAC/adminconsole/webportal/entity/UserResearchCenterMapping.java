package com.csm.ORSAC.adminconsole.webportal.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity(name = "m_wr_user_rc_mapping")
public class UserResearchCenterMapping {


	@Id
	@Column(name = "int_usr_rc_map_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userResearchCenterMapId;

	@Column(name = "int_user_id")
	private Integer userId;

	@Column(name = "int_research_center_id")
	private Integer recearchCenterId;

	@Column(name = "bitstatus")
	private boolean bitStatus;

	public Integer getUserResearchCenterMapId() {
		return userResearchCenterMapId;
	}

	public void setUserResearchCenterMapId(Integer userResearchCenterMapId) {
		this.userResearchCenterMapId = userResearchCenterMapId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRecearchCenterId() {
		return recearchCenterId;
	}

	public void setRecearchCenterId(Integer recearchCenterId) {
		this.recearchCenterId = recearchCenterId;
	}

	public boolean isBitStatus() {
		return bitStatus;
	}

	public void setBitStatus(boolean bitStatus) {
		this.bitStatus = bitStatus;
	}

	


}
