package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.csm.ORSAC.adminconsole.webportal.entity.PrimaryLink;

@Repository("primaryLnkRepository")
public interface PrimaryLinkRepository extends JpaRepository<PrimaryLink, Integer> {

	

	@Query(nativeQuery = true, value = " select * from  m_adm_primarylink pml,m_adm_grouplinkaccess glac, m_adm_role urol,t_user b "
			+ " where urol.role_id=glac.intgroupid and glac.intplinkid=pml.intplinkid and urol.role_id = b.intgroupid and "
			+ " b.intuserid=:userId and glac.bitStatus=false and pml.bitStatus=false and b.tintdeletedstatus = false ")
	List<PrimaryLink> findUserPrimaryLinkById(@Param("userId") int userId);

	List<PrimaryLink> findGlobalLinkIdByGlobalLinkId(Integer gl_id);

	List<PrimaryLink> findFunctionIdByFunctionId(Integer functn_id);

	

}