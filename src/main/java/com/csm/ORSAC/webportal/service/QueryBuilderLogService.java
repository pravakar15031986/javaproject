package com.csm.ORSAC.webportal.service;

import java.util.List;

import com.csm.ORSAC.webportal.bean.QueryLogViewBean;
import com.csm.ORSAC.webportal.entity.QueryBuilderLogEntity;


public interface QueryBuilderLogService {

	QueryBuilderLogEntity saveQueryBuilder(QueryBuilderLogEntity qblEntity);

	String addQueryBuilderLog(String query, String ipaddress, int userId);

	String getQueryResponse(Integer logId);

	List<QueryLogViewBean> getQueryList(String startDate, String endDate, Integer start, Integer length);

	Integer getQueryListCount(String startDate, String endDate, Integer pstart, Integer plength);

}
