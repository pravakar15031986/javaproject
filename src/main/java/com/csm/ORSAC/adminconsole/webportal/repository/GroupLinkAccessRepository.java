package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLinkAccess;

@Repository("groupLinkAccessRepository")
public interface GroupLinkAccessRepository extends JpaRepository<GlobalLinkAccess, Integer> {

	@Query("SELECT glnk.globalLinkId , glnk.globalLinkName , glnkacc.primaryLink.primaryLinkId ,prmlink.primaryLinkName ,"
			+ " glnkacc.action  FROM GlobalLinkAccess glnkacc, GlobalLink glnk , AdminRole admrole , PrimaryLink prmlink "
			+ " where glnk.globalLinkId = prmlink.globalLinkId  and glnkacc.adm_role = admrole.roleId  "
			+ " and prmlink.primaryLinkId = glnkacc.primaryLink  and glnkacc.status = false and prmlink.bitStatus = false"
			+ " and glnk.bitStatus = false and glnkacc.adm_role.id = :groupId")
	Object[] getGroupLinkAccessByGroupId(@Param("groupId") int groupId);

	@Query("SELECT gblnk from  GlobalLinkAccess gblnk ,AdminRole admrole where gblnk.adm_role = admrole.roleId  and gblnk.adm_role.id = :groupId")
	List<GlobalLinkAccess> getGroupLinkAccessListByGroupId(@Param("groupId") int groupId);

	List<GlobalLinkAccess> findPrimaryLinkByPrimaryLink(Integer pl_id);
}
