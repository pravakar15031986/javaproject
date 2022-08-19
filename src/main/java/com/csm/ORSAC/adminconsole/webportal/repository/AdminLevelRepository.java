/**
 * 
 */
package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.csm.ORSAC.adminconsole.webportal.entity.AdmLevelDetails;

@Repository("adminLevelRepository")
public interface AdminLevelRepository extends JpaRepository<AdmLevelDetails, Integer> {

	//

	@Query("select levelDetailId,levelName,alias,levelId,parentId,hierarchyId,bitStatus from AdmLevelDetails  where levelId= :levelId AND parentId= :pId AND hierarchyId= :hId  ") // AND
																																													// bitStatus=
																																													// 0
	List<Object[]> retriveAdminLeveldetails(@Param("levelId") int levelId, @Param("pId") int pId,
			@Param("hId") int hId);

	@Query("select levelDetailId,levelName,alias,levelId,parentId,hierarchyId,bitStatus from AdmLevelDetails  where levelId= :levelId AND hierarchyId= :hId  ") // AND
																																								// bitStatus=
																																								// 0
	List<Object[]> retriveAdminLeveldetails(@Param("levelId") int levelId, @Param("hId") int hierarchyId);

	@Query("  SELECT A.levelId,A.levelDetailId,A.levelName,A.alias,A.parentId,B.levelDetailId,B.levelName,A.bitStatus\r\n"
			+ " FROM AdmLevelDetails A JOIN AdmLevelDetails B \r\n"
			+ " ON B.levelDetailId = A.parentId where  A.levelId =:levelId and A.hierarchyId=:hId") // AND bitStatus= 0
	List<Object[]> retriveAdminLeveldetails2(@Param("levelId") int levelId, @Param("hId") int hierarchyId);

	@Query("SELECT A.levelId,A.levelDetailId,A.levelName,A.parentId,B.levelDetailId,B.levelName,C.levelDetailId,C.levelName,A.bitStatus\r\n"
			+ "FROM AdmLevelDetails A JOIN AdmLevelDetails B \r\n"
			+ "ON B.levelDetailId = A.parentId JOIN AdmLevelDetails C \r\n"
			+ "ON C.levelDetailId = B.parentId where  A.levelId =:levelId and A.hierarchyId=:hId")
	List<Object[]> retriveAdminLeveldetails3(@Param("levelId") int levelId, @Param("hId") int hierarchyId);

	@Query("SELECT A.levelId,A.levelDetailId,A.levelName,A.parentId,B.levelDetailId,B.levelName,C.levelDetailId,C.levelName,\r\n"
			+ "D.levelDetailId,D.levelName,A.bitStatus\r\n" + "FROM AdmLevelDetails A JOIN AdmLevelDetails B \r\n"
			+ "ON B.levelDetailId = A.parentId JOIN AdmLevelDetails C \r\n"
			+ "ON C.levelDetailId = B.parentId join AdmLevelDetails D\r\n" + "ON D.levelDetailId = C.parentId\r\n"
			+ "where  A.levelId =:levelId and A.hierarchyId=:hId")
	List<Object[]> retriveAdminLeveldetails4(@Param("levelId") int levelId, @Param("hId") int hierarchyId);

	@Query("SELECT A.levelId,A.levelDetailId,A.levelName,A.parentId,B.levelDetailId,B.levelName,C.levelDetailId,C.levelName,\r\n"
			+ "D.levelDetailId,D.levelName, E.levelDetailId,E.levelName,A.bitStatus\r\n"
			+ "FROM AdmLevelDetails A JOIN AdmLevelDetails B \r\n"
			+ "ON B.levelDetailId = A.parentId JOIN AdmLevelDetails C \r\n"
			+ "ON C.levelDetailId = B.parentId join AdmLevelDetails D\r\n"
			+ "ON D.levelDetailId = C.parentId JOIN AdmLevelDetails E\r\n" + "ON E.levelDetailId = D.parentId\r\n"
			+ "where  A.levelId =:levelId and A.hierarchyId=:hId")
	List<Object[]> retriveAdminLeveldetails5(@Param("levelId") int levelId, @Param("hId") int hierarchyId);

	@Query("SELECT A.levelId,A.levelDetailId,A.levelName,A.parentId,B.levelDetailId,B.levelName,C.levelDetailId,C.levelName,\r\n"
			+ "D.levelDetailId,D.levelName,E.levelDetailId,E.levelName,\r\n"
			+ "F.levelDetailId,F.levelName,A.bitStatus \r\n" + "FROM AdmLevelDetails A JOIN AdmLevelDetails B \r\n"
			+ "ON B.levelDetailId = A.parentId JOIN AdmLevelDetails C \r\n"
			+ "ON C.levelDetailId = B.parentId JOIN AdmLevelDetails D \r\n"
			+ "ON D.levelDetailId = C.parentId JOIN AdmLevelDetails E\r\n"
			+ "ON E.levelDetailId = D.parentId JOIN AdmLevelDetails F\r\n" + "ON F.levelDetailId = E.parentId\r\n"
			+ "where  A.levelId =:levelId and A.hierarchyId=:hId")
	List<Object[]> retriveAdminLeveldetails6(@Param("levelId") int levelId, @Param("hId") int hierarchyId);

	@Query("SELECT A.levelId,A.levelName,A.levelDetailId,A.parentId,A.alias,"
			+ "B.levelName,B.levelDetailId FROM AdmLevelDetails A JOIN AdmLevelDetails B "
			+ "ON B.levelDetailId = A.parentId where  A.levelDetailId  = :leveldtId and "
			+ "A.levelId =:levelId and A.hierarchyId=:hId")
	Object[] retriveSubObj(@Param("hId") int hierarchyMasterID, @Param("levelId") int levelId,
			@Param("leveldtId") int leveldtlId);

	List<AdmLevelDetails> findByLevelIdAndBitStatus(int levelId, boolean deleteStatus);

	@Query(value = "SELECT * FROM m_adm_leveldetails where intleveldetailid=:levelId And bitstatus='false' ", nativeQuery = true)
	AdmLevelDetails findLevelDetailsByUserId(Integer levelId);

}