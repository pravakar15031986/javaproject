package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csm.ORSAC.adminconsole.webportal.bean.PrimaryLinkBean;
import com.csm.ORSAC.adminconsole.webportal.entity.PrimaryLink;

@Repository("primaryLinkRepository")
public interface ManagePrimaryLinkRepository extends JpaRepository<PrimaryLinkBean, Integer> {

	@Query("select distinct globalLinkId,globalLinkName FROM GlobalLinkVo ORDER BY globalLinkName")
	List<Object[]> getGloballink();

	@Query("select distinct globalLinkId,globalLinkName,bitStatus FROM GlobalLinkVo ORDER BY globalLinkName")
	List<Object[]> getActiveGloballink();

	@Query("select distinct functionId,functionName FROM FunctionMasterVo ORDER BY functionName")
	List<Object[]> getFuctionList();

	@Query("select p.primaryLinkId,p.primaryLinkName,p.bitLinkType,p.bitShowOnHomePage,p.bitStatus,"
			+ "g.globalLinkId,g.globalLinkName,f.functionId,f.functionName "
			+ "from PrimaryLinkBean p inner join GlobalLinkVo g on p.globalLinkId=g.globalLinkId "
			+ "inner join FunctionMasterVo f  on p.functionId=f.functionId where p.bitStatus=:condition ORDER BY p.primaryLinkId DESC")
	List<Object[]> viewPrimaryLinkList(@Param("condition") boolean condition);

	@Query("select p.primaryLinkId,p.primaryLinkName,p.bitLinkType,p.bitShowOnHomePage,p.bitStatus,"
			+ "g.globalLinkId,g.globalLinkName,f.functionId,f.functionName "
			+ "from PrimaryLinkBean p inner join GlobalLinkVo g on p.globalLinkId=g.globalLinkId "
			+ "inner join FunctionMasterVo f  on p.functionId=f.functionId ORDER BY p.primaryLinkId DESC")
	List<Object[]> viewPrimaryLinkList();

	PrimaryLinkBean findByPrimaryLinkId(@Param("primaryLinkId") int primaryLinkId);

	@Transactional
	@Modifying
	@Query("UPDATE PrimaryLinkBean  SET bitStatus =1 WHERE primaryLinkId = :#{#primaryLinkId}")
	void deletePrimaryLink(@Param("primaryLinkId") int primaryLinkId);

	@Query("select primaryLinkName from PrimaryLinkBean where LOWER(primaryLinkName) LIKE LOWER(:name)")
	List<PrimaryLinkBean> chkDuplicatePrimaryLinkNameByName(@Param("name") String name);

	@Query("select max(slNo) from PrimaryLinkBean ")
	int getMaxSerialNo();

	@Query("select  pml from  PrimaryLink pml ,User usr, GlobalLinkAccess  gpl "
			+ "where gpl.adm_role = usr.groupId and gpl.primaryLink = pml.primaryLinkId "
			+ "and pml.bitStatus = false and gpl.status = false and usr.userId = :userId order by pml.globalLinkId asc")
	List<PrimaryLink> findUserPrimaryLinkById(@Param("userId") int userId);

	@Query("select primaryLinkName from PrimaryLinkBean where primaryLinkId!=?1 and LOWER(primaryLinkName) LIKE LOWER(?2)")
	List<PrimaryLinkBean> chkDuplicatePrimaryLinkNameByName(int plid, String name);



}
