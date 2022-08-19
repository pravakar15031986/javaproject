package com.csm.ORSAC.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.csm.ORSAC.webportal.entity.PacsInspectorDto;

/**
 * 
 * @author dibyamohan.panda
 *
 */
@Repository
public interface PacsInspectorRepository extends JpaRepository<PacsInspectorDto, Integer> {
	
	List<PacsInspectorDto> findByMobileAndDeletedflag(String mobile,boolean deletedFlag);
	
	@Query(nativeQuery = true,value="SELECT vchOtp,vchmobile,CAST(dtmotpgenerateon AS text) OTP_SEND_TIME,CAST(dtmotpexpiryon AS text)  OTP_EXPIRY_TIME,CAST(NOW() AS text) "
			+ " CURRENTTIME FROM  t_ppasgis_pacsinspector WHERE vchmobile=:mobile AND intdeletedflag=:deletedFlag")
	List<Object[]> fetchOtpDetails(@Param("mobile")  String mobile,@Param("deletedFlag") boolean deletedFlag);
	
	@Query(nativeQuery = true,value="select vchmobile,intstatusid  from t_ppasgis_pacsinspector where vchmobile=:mobile  and intdeletedflag=false")
	List<Object[]> checkSignup(@Param("mobile") String mobile);
	
	@Query(nativeQuery = true,value="select dist.district,blk.block,pac.pac_name from t_ppasgis_pacsinspector pgis\r\n"
			+ "inner join m_district_master dist on pgis.intdistictid=dist.dist_code\r\n"
			+ "inner join m_block_master blk on pgis.intblockid=blk.block_code\r\n"
			+ "inner join m_pac_master pac on pgis.pacsid=pac.pac_code\r\n"
			+ "where pgis.vchmobile=:mobileNumber and pgis.intdeletedflag=false")
	List<Object[]> fetchLocationDetails(@Param("mobileNumber")  String mobileNumber);
	
	@Query(nativeQuery = true,value="SELECT count(1) FROM  t_mis_reporting_survey where plot_code=:plotCode")
	Object checkTakeAction(@Param("plotCode") String plotCode);
	
	@Query(nativeQuery = true,value="select dist.district,blk.block,pacs.pac_name || '(' || ts.pacsid || ')' as pacs_name,ts.intpacsinpsid,ts.vchusername,ts.vchmobile,\r\n"
			+ "ts.intstatusid,cast(to_char(ts.dtmCreatedOn,'dd-MM-yyyy') as text) applied_date from t_ppasgis_pacsinspector ts \r\n"
			+ "inner join m_district_master dist on dist.dist_code=ts.intdistictid\r\n"
			+ "inner join m_block_master blk on blk.block_code=ts.intblockid\r\n"
			+ "inner join m_pac_master pacs on pacs.pac_code=ts.pacsid\r\n"
			+ "where ts.intdeletedflag=false and ts.intstatusid=:status \r\n"
			+ "and ts.intdistictid= case when :districtId <> '' then :districtId else ts.intdistictid end \r\n"
			+ "and ts.intblockid= case when :blockId <> '' then :blockId else ts.intblockid end \r\n"
			+ "and ts.pacsid= case when :pacsId <> '' then :pacsId else ts.pacsid end order by dtmCreatedOn desc ")
	List<Object[]> fetchRegisteredPacsInspector(@Param("districtId") String districtId,@Param("blockId") String blockId,@Param("pacsId") String pacsId,@Param("status") Integer status);

	List<PacsInspectorDto> findByDistrictId(String distCode);

	List<PacsInspectorDto> findByStatus(int status);
	
	List<PacsInspectorDto> findByPacsId(String pacsCode);
	
	
	

	
	
	

}
