package com.csm.ORSAC.datatable;

import java.util.List;

import com.csm.ORSAC.adminconsole.webportal.bean.IPTrackBean;

public class SucessWebLoginDetailsDataTable {

	private List<IPTrackBean> data;

	private Integer recordsTotal;

	public List<IPTrackBean> getData() {
		return data;
	}

	public void setData(List<IPTrackBean> data) {
		this.data = data;
	}

	public Integer getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(Integer recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public Integer getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(Integer recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public Integer getDraw() {
		return draw;
	}

	public void setDraw(Integer draw) {
		this.draw = draw;
	}

	public Boolean getSearchable() {
		return searchable;
	}

	public void setSearchable(Boolean searchable) {
		this.searchable = searchable;
	}

	public Boolean getOrderable() {
		return orderable;
	}

	public void setOrderable(Boolean orderable) {
		this.orderable = orderable;
	}

	private Integer recordsFiltered;
	private Integer draw;
	private Boolean searchable = true;
	private Boolean orderable = true;

}
