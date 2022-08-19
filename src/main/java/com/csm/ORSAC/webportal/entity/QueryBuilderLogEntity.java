package com.csm.ORSAC.webportal.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_wr_query_builder_log")
public class QueryBuilderLogEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "int_qbl_id")
	private Integer queryBuilderLogId;

	

	@Column(name = "int_user_id")
	private Integer userId;

	@Column(name = "vch_ip_address")
	private String ipAddress;

	@Column(name = "vch_sql_query")
	private String query;

	@Column(name = "bitstatus")
	private boolean bitstatus;

	@Column(name = "dtm_query_time")
	private Date queryTime;

	public Integer getQueryBuilderLogId() {
		return queryBuilderLogId;
	}

	public void setQueryBuilderLogId(Integer queryBuilderLogId) {
		this.queryBuilderLogId = queryBuilderLogId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public boolean isBitstatus() {
		return bitstatus;
	}

	public void setBitstatus(boolean bitstatus) {
		this.bitstatus = bitstatus;
	}

	public Date getQueryTime() {
		return queryTime;
	}

	public void setQueryTime(Date queryTime) {
		this.queryTime = queryTime;
	}
	
	@Override
	public String toString() {
		return "QueryBuilderLogEntity [queryBuilderLogId=" + queryBuilderLogId + ", userId=" + userId + ", ipAddress="
				+ ipAddress + ", query=" + query + ", bitstatus=" + bitstatus + ", queryTime=" + queryTime + "]";
	}

}
