package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.csm.ORSAC.adminconsole.webportal.entity.IpTrack;

@Repository("ipTrackingRepository")
public interface IPTrackingRepository extends JpaRepository<IpTrack, Integer> {

	
	@Query(value = "\r\n"
			+ "SELECT count(*) FROM t_por_iptracking ip  where ip.dtmcreatedon between :date and CURRENT_TIMESTAMP and ip.intcreatedby=:createdBy and \r\n"
			+ "			ip.intiptrackid >=    \r\n" + "            \r\n" + "            case when \r\n"
			+ "			(SELECT count(*) FROM t_por_iptracking ip1  \r\n"
			+ "             where ip1.dtmcreatedon between :date and CURRENT_TIMESTAMP and ip1.intcreatedby=:createdBy and ip1.chrloginsucessfailure = 'Y'  \r\n"
			+ "			 ) = 0 then \r\n" + "             \r\n"
			+ "             (SELECT ip1.intiptrackid FROM t_por_iptracking ip1  where ip1.dtmcreatedon between  :date and CURRENT_TIMESTAMP and ip1.intcreatedby=:createdBy and ip1.chrloginsucessfailure = 'N' \r\n"
			+ "			ORDER BY ip1.intiptrackid ASC LIMIT  1)\r\n" + "            else\r\n" + "            \r\n"
			+ "             (SELECT ip1.intiptrackid FROM t_por_iptracking ip1  where ip1.dtmcreatedon between  :date and CURRENT_TIMESTAMP and ip1.intcreatedby=:createdBy and ip1.chrloginsucessfailure = 'Y' \r\n"
			+ "			ORDER BY ip1.intiptrackid DESC LIMIT  1)\r\n"
			+ "            end  and ip.chrloginsucessfailure != 'Y'", nativeQuery = true)
	int countFailAttemptByUserIdDate(@Param("createdBy") int userId, @Param("date") Date date);

	@Query(nativeQuery = true, value = "select * from sp_wr_view_web_sucess_login_details (?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11)")
	List<Object[]> viewSucessWebLoginDetails(Integer organizationId, Integer roleId, Integer researchCenterId,
			Integer intdesigid, String startDate, String endDate, String fullName, Integer userId, String logStatus,
			Integer start, Integer length);

	@Query(nativeQuery = true, value = "select count(*) from sp_wr_view_web_sucess_login_details(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11)")
	Integer viewSucessWebLoginDetailsCount(Integer organizationId, Integer roleId, Integer researchCenterId,
			Integer intdesigid, String startDate, String endDate, String fullName, Integer userId, String logStatus,
			Integer pstart, Integer plength);

	@Query(nativeQuery = true, value = "select * from sp_wr_view_mob_sucess_login_details(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11)")
	List<Object[]> viewSucessMobLoginDetails(Integer organizationId, Integer roleId, Integer researchCenterId,
			Integer intdesigid, String startDate, String endDate, String fullName, Integer userId, String logStatus,
			Integer start, Integer length);

	@Query(nativeQuery = true, value = "select count(*) from sp_wr_view_mob_sucess_login_details(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11)")
	Integer viewSucessMobLoginDetailsCount(Integer organizationId, Integer roleId, Integer researchCenterId,
			Integer intdesigid, String startDate, String endDate, String fullName, Integer userId, String logStatus,
			Integer pstart, Integer plength);

}
