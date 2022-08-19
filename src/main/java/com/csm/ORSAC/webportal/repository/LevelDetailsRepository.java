package com.csm.ORSAC.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.csm.ORSAC.adminconsole.webportal.entity.LevelDetails;

public interface LevelDetailsRepository extends JpaRepository<LevelDetails, Integer> {

	
	@Query(nativeQuery = true, value = "select rcen.int_research_center_id,rcen.vch_research_center_name from m_wr_user_rc_mapping rcmap inner join m_wr_research_center rcen on rcmap.int_research_center_id = rcen.int_research_center_id where rcmap.int_user_id = :userId")
	List<Object[]> getInstituonName(@Param("userId") Integer userId);

	@Query(value = "select rle.int_user_id,(select vchuserfullname from t_user where intuserid=rle.int_user_id ) from\r\n"
			+ "m_wr_user_rc_mapping rcmap inner join m_adm_user_role rle on   rcmap.int_user_id=rle.int_user_id \r\n"
			+ "where int_research_center_id =:researchCenterId and rle.int_role_id=8", nativeQuery = true)
	List<Object[]> getAllSurveyor(@Param("researchCenterId") Integer researchCenterId);

	@Query(nativeQuery = true, value = "select rcen.int_research_center_id,rcen.vch_research_center_name from m_wr_user_rc_mapping rcmap inner join m_wr_research_center rcen on rcmap.int_research_center_id = rcen.int_research_center_id")
	List<Object[]> getInstituonName();
	
	@Query(nativeQuery = true, value = "select dist_code,district from m_district_master order by district asc")
	List<Object[]> getDistrictList();
	
	@Query(nativeQuery = true, value = "select block_code,block,dist_code from m_block_master order by block asc")
	List<Object[]> getBlockList();
	
	@Query(nativeQuery = true, value = "select pac_code,pac_name,block_code from m_pac_master order by pac_name asc")
	List<Object[]> getPacsList();
	
	@Query(nativeQuery = true, value = "select block_code,block from m_block_master where dist_code=:distCode")
	List<Object[]> fetchBlockDetailsByDistId(@Param("distCode") String distCode);
	
	@Query(nativeQuery = true, value = "select pac_code,pac_name from m_pac_master where block_code=:blockId")
	List<Object[]> fetchPacsDetailsByBlockId(@Param("blockId") String blockId);
	
	@Query(nativeQuery = true, value = "select vill_code,vill_name,count(plot_no) from suspected_plot_boundary \n"
			+ "WHERE pac_nos=:pacsCode \n"
			+ "group by vill_name,vill_code")
	List<Object[]> getVillageList(@Param("pacsCode") String pacsCode);
	
	@Query(nativeQuery = true, value = "select plot_no,plot_code,khata_no,vill_code,vill_name,tahasil,district,\n"
			+ "fv_reason,tot_area,cast(ST_AsGeoJSON(geom) as text) from suspected_plot_boundary  where vill_code=:villageId and pac_nos=:pacsCode ")
	List<Object[]> getPendingPlots(@Param("villageId")  String villageId,@Param("pacsCode") String pacsCode);
	
	
	@Query(nativeQuery = true, value = "select dist_code from m_district_master where dist_id=:distId")
	Object getDistCodeByDistId(@Param("distId")  Integer distId);
	
	@Query(nativeQuery = true, value = "select district from m_district_master where dist_id=:distId")
	Object getDistrictNameBydistId(@Param("distId") Integer distId);

	@Query(nativeQuery = true, value = "select tah_code,tahasil from m_tahasil_master where dist_code=:distCode order by tahasil asc ")
	List<Object[]> fetchtahasilListByDistCode(@Param("distCode") String districtId);
	
	@Query(nativeQuery = true, value = "select vill_code,village from m_village_master where m_village_master.tah_code=:tahasilCode order by village asc")
	List<Object[]> fetchvillageListByTahasilCode(@Param("tahasilCode") String tahasilId);
	
	@Query(nativeQuery = true, value = "select count( distinct pac_nos) from suspected_plot_boundary where dist_code=:distCode")
	Object fetchPacsCount(@Param("distCode") String distCode);
	
	@Query(nativeQuery = true, value = "select distinct spb.pac_nos,pacs.pac_name from suspected_plot_boundary spb\n"
			+ "inner join m_pac_master pacs on pacs.pac_code=spb.pac_nos\n"
			+ "where dist_code=:distCode")
	List<Object[]> getPacsWiseSurveyList(@Param("distCode") String distcode);
	
	@Query(nativeQuery = true, value = "select dist_code,district from district_boundary where dist_code in(select dist_code from m_district_master) order by district")
	List<Object[]> getDistrictsMaster();
	
	@Query(nativeQuery = true, value = "select cast(st_extent(st_transform(geom,3857)) as text) from district_boundary where dist_code=:distCode")
	Object getDistrictBoundary(@Param("distCode") String distcode);
	
	@Query(nativeQuery = true, value = "select tahasil_cd,tahasil from tahasil_boundary where dist_code=:distCode order by tahasil")
	List<Object[]> getTahasilMaster(@Param("distCode") String distcode);
	
	@Query(nativeQuery = true, value = "select cast(st_extent(st_transform(geom,3857)) as text) from tahasil_boundary where tahasil_cd=:tahasilCode")
	Object getTahasilBoundary(@Param("tahasilCode") String tahasilCode);
	
	@Query(nativeQuery = true, value = "select vill_code,vill_name from village_boundary where tahasil_cd=:tahasilCode order by vill_name")
	List<Object[]> getVillageMaster(@Param("tahasilCode") String tahasil_code);
	
	@Query(nativeQuery = true, value = "select cast(st_extent(st_transform(geom,3857)) as text) from village_boundary where vill_code=:villageCode")
	Object getVillageBoundary(@Param("villageCode") String villageCode);
	
	@Query(nativeQuery = true, value = "select pacs.pac_code,pacs.pac_name from m_pac_master pacs inner join m_district_master dist\n"
			+ "			on dist.dist_id=pacs.dist_id where dist.dist_code=:distCode order by pacs.pac_name asc")
	List<Object[]> fetchPacsListByDistCode(@Param("distCode") String distCode);
	
	@Query(nativeQuery = true, value = "select pac_nos from suspected_plot_boundary where vill_code=:villageId")
	Object fetchPacscodeByVillageCode(@Param("villageId") String villageId);
	

	

	
	
}
