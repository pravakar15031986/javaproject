package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLinkAccess;
import com.csm.ORSAC.adminconsole.webportal.entity.User;
import com.csm.ORSAC.adminconsole.webportal.entity.UserLinkAccess;

@Repository("userLinkAccessRepository")
public interface UserLinkAccessRepository extends JpaRepository<UserLinkAccess, Integer> {

	@Query("select usrlink from UserLinkAccess usrlink  where usrlink.userID= :userid and  usrlink.primaryLinkID = :primaryLinkID ")
	UserLinkAccess getAccessLinkByUserIdAndPLinkId(@Param("userid") int userID,
			@Param("primaryLinkID") int primaryLinkID);

	@Query("SELECT usr  FROM User usr where usr.userId in (select usrlnk.userID from  UserLinkAccess usrlnk )")
	Page<User> getPermissionAssignedUser(Pageable pageable);

	@Query("SELECT prmlink.globalLinkId ,glnk.globalLinkName, linkaccs.primaryLinkID ,prmlink.primaryLinkName , linkaccs.action FROM User usr , UserLinkAccess linkaccs ,PrimaryLink prmlink ,GlobalLink glnk where"
			+ " glnk.globalLinkId = prmlink.globalLinkId  and usr.userId  = linkaccs.userID  and prmlink.primaryLinkId = linkaccs.primaryLinkID and linkaccs.status = false and usr.userId = :userid")
	Object[] getLinksAccessPermissionByUserId(@Param("userid") int userId);

	@Query("SELECT grplnkaccess FROM GlobalLinkAccess grplnkaccess , User usr where usr.groupId = grplnkaccess.adm_role and usr.userId= :userId")
	List<GlobalLinkAccess> getGroupLinkAccessPermissionByUserId(@Param("userId") int userId);

	@Query("select usrlink from UserLinkAccess usrlink  where usrlink.userID= :userid")
	List<UserLinkAccess> getPrimaryLinkAccessListByUserId(@Param("userid") int userID);

	@Query("SELECT grplnkaccess FROM GlobalLinkAccess grplnkaccess , User usr where usr.groupId = grplnkaccess.adm_role.id and usr.userId= :userid and grplnkaccess.primaryLink.primaryLinkId = :primaryLinkID")
	GlobalLinkAccess getGroupLinkAccessByUserIdAndPlnkId(@Param("userid") int userID,
			@Param("primaryLinkID") int primaryLinkID);
}
