package com.csm.ORSAC.webportal.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;
import com.csm.ORSAC.webportal.bean.QueryLogViewBean;
import com.csm.ORSAC.webportal.entity.QueryBuilderLogEntity;
import com.csm.ORSAC.webportal.repository.QueryBuilderLogRepository;
import com.csm.ORSAC.webportal.service.QueryBuilderLogService;
import com.csm.ORSAC.webportal.util.DateUtil;



@Service
public class QueryBuilderLogServiceImpl implements QueryBuilderLogService {

	public static final Logger LOG = LoggerFactory.getLogger(QueryBuilderLogServiceImpl.class);

	@Autowired
	QueryBuilderLogRepository queryBuilderrepo;

	List<String> modalist = new ArrayList<>();
	int totalCount = 0;

	@Override
	public QueryBuilderLogEntity saveQueryBuilder(QueryBuilderLogEntity qblEntity) {

		return queryBuilderrepo.save(qblEntity);
	}

	@Override
	public String addQueryBuilderLog(String query, String ipaddress, int userId) {
		QueryBuilderLogEntity qblObj = new QueryBuilderLogEntity();
		String status = null;
		try {
			qblObj.setIpAddress(ipaddress);
			qblObj.setQuery(query);
			qblObj.setUserId(userId);
			qblObj.setQueryTime(new Date());
			queryBuilderrepo.save(qblObj);
			status = OrsacPortalConstant.SUCCESS;
		} catch (Exception e) {
			LOG.error("QueryBuilderLogServiceImpl::addQueryBuilderLog():" + e);
			status = OrsacPortalConstant.FAILURE;
		}
		return status;
	}

	@Override
	public List<QueryLogViewBean> getQueryList(String startDate, String endDate, Integer start, Integer length) {

		ArrayList<QueryLogViewBean> qlist = new ArrayList<>();

		QueryLogViewBean vo = null;
		Integer count = 0;

		try {
			if (startDate == null || startDate.equalsIgnoreCase("")) {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD);
				LocalDateTime now = LocalDateTime.now();
				String tdate = dtf.format(now).toString();
				startDate = tdate;
			} else {
				startDate = DateUtil.StringMMMToDate(startDate).toString();
			}

			if (endDate == null || endDate.equalsIgnoreCase("")) {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD);
				LocalDateTime now = LocalDateTime.now();
				String tdate = dtf.format(now);
				endDate = tdate;
			} else {
				endDate = DateUtil.StringMMMToDate(endDate).toString();
			}

		} catch (Exception ee) {
			LOG.error("QueryBuilderLogServiceImpl::getQueryList():" + ee);

		}

		try {
			List<Object[]> objList = queryBuilderrepo.getQueryList(startDate, endDate, start, length, -1);

			if (!objList.isEmpty()) {
				for (Object[] obj : objList) {
					vo = new QueryLogViewBean();

					vo.setsNo((start) + (++count));
					vo.setUserName(String.valueOf(obj[0]));
					vo.setFullName(String.valueOf(obj[1]));
					vo.setRole(String.valueOf(obj[2]));
					vo.setIpAddress(String.valueOf(obj[3]));

					vo.setModalLink("<button class=\"btn btn-primary\"	onclick=\"userQueryInfo(" + (String) obj[6]
							+ ")\"><i class=\"fa fa-info\" aria-hidden=\"true\"></i></button>");
					vo.setQueryTime(String.valueOf(obj[5]));

					qlist.add(vo);
					modalist.add(String.valueOf(obj[1]));

				}
			}
		} catch (Exception e) {
			LOG.error("QueryBuilderLogServiceImpl::getQueryList():" + e);

		}

		return qlist;

	}

	@Override
	public Integer getQueryListCount(String startDate, String endDate, Integer pstart, Integer plength) {

		Integer totalCount = 0;

		try {
			if (startDate == null || startDate.equalsIgnoreCase("")) {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD);
				LocalDateTime now = LocalDateTime.now();
				String tdate = dtf.format(now);

				startDate = tdate;

			} else {

				startDate = DateUtil.StringMMMToDate(startDate).toString();

			}

			if (endDate == null || endDate.equalsIgnoreCase("")) {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD);
				LocalDateTime now = LocalDateTime.now();
				String tdate = dtf.format(now);

				endDate = tdate;

			} else {

				endDate = DateUtil.StringMMMToDate(endDate).toString();

			}
			totalCount = queryBuilderrepo.getQueryListCount(startDate, endDate, pstart, plength, -1);
		} catch (Exception e) {
			LOG.error("QueryBuilderLogServiceImpl::getQueryListCount():" + e);

		}

		return totalCount;

	}

	@Override
	public String getQueryResponse(Integer logId) {

		JSONObject jobj = new JSONObject();
		try {
			QueryBuilderLogEntity qObj=queryBuilderrepo.findByQueryBuilderLogId(logId);
			if(qObj!=null) {
				
				jobj.put("queryVal", qObj.getQuery());
			}
			

		} catch (Exception e) {
			LOG.error("QueryBuilderLogServiceImpl::getQueryResponse():" + e);

		}
		return jobj.toString();
	}

}

