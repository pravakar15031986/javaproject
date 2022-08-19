package com.csm.ORSAC.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.csm.ORSAC.webportal.entity.SurveyDto;

public interface SurveyRepository extends JpaRepository<SurveyDto, String> {
	
	@Query(nativeQuery = true, value = "select spb.district,spb.tahasil,spb.vill_name,\r\n"
			+ "			rs.crop_status,rs.surveyor_position,spb.tot_area,rs.area_vald,\r\n"
			+ "			rs.nh_paddy,spb.plot_no,spb.khata_no,cast(rs.dtmSyncOn as text) survey_time,\r\n"
			+ "			rs.status,rs.plot_code,spb.fv_reason from t_mis_reporting_survey rs\r\n"
			+ "			inner join suspected_plot_boundary spb on rs.plot_code=spb.plot_code\r\n"
			+ "			inner join m_pac_master pacs on pacs.pac_code=spb.pac_nos\r\n"
			+ "			where rs.deleted_flag=0 and \r\n"
			+ "			spb.dist_code=case when :distId <> '' then :distId else spb.dist_code end and\r\n"
			+ "			spb.pac_nos=case when :pacsId <> '' then :pacsId else spb.pac_nos end and\r\n"
			+ "			spb.tahasil_cd=case when :tahasilId <> '' then :tahasilId else spb.tahasil_cd end and\r\n"
			+ "			spb.vill_code=case when :villageId <> '' then :villageId else spb.vill_code end and\r\n"
			+ "			rs.crop_status=case when :crop_status <> 0 then :crop_status else rs.crop_status end and\r\n"
			+ "			spb.plot_no=case when :plotno <> '' then :plotno else spb.plot_no end and\r\n"
			+ "			rs.status=case when :status <> 0 then :status else rs.status end "
			+ "			and date(rs.dtmSyncOn)>=case when :fromDate <> '' \r\n"
			+ "			then to_date(:fromDate, 'DD-Mon-YYYY') \r\n"
			+ "			else rs.dtmSyncOn end and\r\n"
			+ "			date(rs.dtmSyncOn)<=case when :toDate <> '' \r\n"
			+ "			then to_date(:toDate, 'DD-Mon-YYYY') \r\n"
			+ "			else rs.dtmSyncOn end order by  rs.dtmSyncOn desc")
	List<Object[]> fetchSurveyReportDetails(@Param("distId")  String distId,@Param("pacsId")  String pacsId,
			@Param("tahasilId") String tahasilId,@Param("villageId") String villageId,@Param("crop_status") Integer crop_status,
			@Param("plotno") String plot_no,@Param("status") Integer status,@Param("fromDate") String fromDate,@Param("toDate") String toDate);
	
	@Query(nativeQuery = true, value = "select spb.district,spb.tahasil,spb.vill_name,\r\n"
			+ "			rs.crop_status,rs.surveyor_position,spb.tot_area,rs.area_vald,\r\n"
			+ "			rs.nh_paddy,spb.plot_no,spb.khata_no,cast(rs.dtmSyncOn as text) survey_time,\r\n"
			+ "			rs.status,rs.plot_code,spb.fv_reason from t_mis_reporting_survey rs\r\n"
			+ "			inner join suspected_plot_boundary spb on rs.plot_code=spb.plot_code\r\n"
			+ "			inner join m_pac_master pacs on pacs.pac_code=spb.pac_nos\r\n"
			+ "			where rs.deleted_flag=0 and \r\n"
			+ "			spb.dist_code=case when :distId <> '' then :distId else spb.dist_code end and\r\n"
			+ "			spb.pac_nos=case when :pacsId <> '' then :pacsId else spb.pac_nos end and\r\n"
			+ "			spb.tahasil_cd=case when :tahasilId <> '' then :tahasilId else spb.tahasil_cd end and\r\n"
			+ "			spb.vill_code=case when :villageId <> '' then :villageId else spb.vill_code end and\r\n"
			+ "			rs.crop_status=case when :crop_status <> 0 then :crop_status else rs.crop_status end and\r\n"
			+ "			spb.plot_no=case when :plotno <> '' then :plotno else spb.plot_no end and\r\n"
			+ "			rs.status=case when :status <> 0 then :status else rs.status end order by  rs.dtmSyncOn desc")
	List<Object[]> fetchSurveyReportDetails(@Param("distId")  String distId, @Param("pacsId")  String pacsId,
			@Param("tahasilId") String tahasilId,@Param("villageId") String villageId,@Param("crop_status") Integer crop_status,
			@Param("plotno") String plot_no,@Param("status") Integer status);
	
	@Query(nativeQuery = true, value ="select spb.plot_no,spb.khata_no,rs.crop_status,rs.surveyor_position,\r\n"
			+ "rs.surveyor_distance,spb.tot_area,rs.area_vald,\r\n"
			+ "rs.photo_selfie,rs.photo_land1,rs.photo_land2,rs.photo_land3,\r\n"
			+ "rs.photo_land4,pgis.deviceid,pgis.vchmobile,rs.latlong,rs.dtmCreatedOn,\r\n"
			+ "rs.dtmSyncOn,rs.plot_code,pgis.vchusername,rs.status,spb.district,spb.tahasil,spb.vill_name,spb.fv_reason from t_mis_reporting_survey rs\r\n"
			+ "inner join suspected_plot_boundary spb on rs.plot_code=spb.plot_code\r\n"
			+ "inner join t_ppasgis_pacsinspector pgis on pgis.intpacsinpsid=rs.intCreatedBy\r\n"
			+ "where rs.deleted_flag=0 and pgis.intdeletedflag=false\r\n"
			+ "and rs.plot_code=:plotcode")
	List<Object[]> fetchPlotDetailsByPlotCode(@Param("plotcode") String plotcode);
	
	@Query(nativeQuery = true, value ="select count(*) from  t_mis_reporting_survey  rs inner join suspected_plot_boundary spb\r\n"
			+ "on rs.plot_code=spb.plot_code where spb.dist_code=:distCode")
	Object  fetchDistrictcompletedSurveyCount(@Param("distCode") String distCode);
	
	@Query(nativeQuery = true, value ="select count(*) from suspected_plot_boundary where dist_code=:distCode")
	Object fetchDistTotalSurveyCount(@Param("distCode") String distCode);
	
	@Query(nativeQuery = true, value ="select count(*) from suspected_plot_boundary")
	Object fetchTotalSurveyCount();
	
	@Query(nativeQuery = true, value ="select count(*) from  t_mis_reporting_survey  rs inner join suspected_plot_boundary spb\r\n"
			+ "on rs.plot_code=spb.plot_code")
	Object fetchCompletedSurveyCount();
	
	@Query(nativeQuery = true, value ="select count(*) from t_mis_reporting_survey rs\r\n"
			+ "inner join suspected_plot_boundary spb\r\n"
			+ "on rs.plot_code=spb.plot_code\r\n"
			+ "where spb.pac_nos=:pacsCode")
	Object fetchPacscompletedSurveyCount(@Param("pacsCode") String pacsCode);
	
	@Query(nativeQuery = true, value ="select count(*) from suspected_plot_boundary where pac_nos=:pacsCode")
	Object fetchPacsTotalSurveyCount(@Param("pacsCode") String pacsCode);
	
	@Query(nativeQuery = true, value ="select count(*) from  t_mis_reporting_survey  rs inner join suspected_plot_boundary spb\r\n"
			+ "on rs.plot_code=spb.plot_code where spb.dist_code=:distCode")
	Object fetchCompletedSurveyCount(@Param("distCode") String distCode);
	
	@Query(nativeQuery = true, value ="select count(*) from suspected_plot_boundary where dist_code=:distCode")
	Object fetchTotalSurveyCount(@Param("distCode") String distCode);
	
	@Query(nativeQuery = true, value ="select count(*) from t_mis_reporting_survey rs\r\n"
			+ "inner join suspected_plot_boundary spb\r\n"
			+ "on rs.plot_code=spb.plot_code\r\n"
			+ "where spb.dist_code=:distCode and rs.status=2")
	Object fetchApprovePlotCount(@Param("distCode") String distCode);
	
	@Query(nativeQuery = true, value ="select count(*) from m_district_master\r\n"
			+ "where dist_code not in (select spb.dist_code from suspected_plot_boundary spb\r\n"
			+ "inner join t_mis_reporting_survey rs\r\n"
			+ "on spb.plot_code=rs.plot_code)")
	Object fetchdistYetToCompleteCount();
	



	@Query(nativeQuery = true, value ="select  count(distinct spb.pac_nos) from suspected_plot_boundary spb\r\n"
			+ "			inner join t_mis_reporting_survey rs\r\n"
			+ "			on spb.plot_code=rs.plot_code where dist_code=:distCode")

	Object fetchPacsYetToCompleteCount(@Param("distCode") String distCode);

	@Query(nativeQuery=true,value="select a.plot_code,a.khata_no,a.district,a.tahasil,b.pac_name,a.pac_nos,a.vill_name,a.fv_reason,a.tot_area \r\n" + 
			"from suspected_plot_boundary a\r\n" + 
			"inner join m_pac_master b on a.pac_nos = b.pac_code\r\n" + 
			"where a.dist_code=:districtId and \r\n" + 
			"a.pac_nos=case when :pacsId <> '' then :pacsId else a.pac_nos end and\r\n"+
			"a.tahasil_cd=case when :tahasilId <> '' then :tahasilId else a.tahasil_cd end and " + 
			"a.vill_code=case when :villageId <> '' then :villageId else a.vill_code end and \r\n" + 
			"a.plot_no=case when :plot_no <> '' then :plot_no else a.plot_no end order by a.gid asc")
	List<Object[]> viewSuspectedPlotReport(@Param("districtId") String districtId,@Param("pacsId")  String pacsId,@Param("tahasilId") String tahasilId,@Param("villageId") String villageId,@Param("plot_no") String plot_no);
	
	@Query(nativeQuery = true, value ="select count(distinct pac_nos) from suspected_plot_boundary where dist_code=:distCode")
	Object fetchTotalPacsCount(@Param("distCode") String distCode);




	
	

}
