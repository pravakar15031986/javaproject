package com.csm.ORSAC.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.csm.ORSAC.webportal.entity.QueryBuilderLogEntity;

public interface QueryBuilderLogRepository extends JpaRepository<QueryBuilderLogEntity, Integer> {

	@Query(nativeQuery = true, value = "select * from wrsis.sp_wr_view_query_log_details_test(?1,?2,?3,?4,?5)")
	List<Object[]> getQueryList(String startDate, String endDate, Integer start, Integer length, Integer logId);

	@Query(nativeQuery = true, value = "select count(*) from wrsis.sp_wr_view_query_log_details_test(?1,?2,?3,?4,?5)")
	int getQueryListCount(String startDate, String endDate, Integer pstart, Integer plength, Integer logId);

	/**
	 * @param logId
	 * @return
	 * QueryBuilderLogEntity
	 * @author  Shaktimaan Panda
	 * @version 1.0
	 * @since  17-09-2020
	 */
	QueryBuilderLogEntity findByQueryBuilderLogId(Integer logId);

}

