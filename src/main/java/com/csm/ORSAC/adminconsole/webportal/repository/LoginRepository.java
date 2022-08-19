/**
 * 
 */
package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.csm.ORSAC.adminconsole.webportal.entity.User;

@Repository("loginRepository")
public interface LoginRepository extends JpaRepository<User, Integer> {

	@Query("select usr from User usr where usr.userName= :userName")
	User findByUserName(@Param("userName") String userName);

	@Query("select distinct globalName,GlobalId FROM UserPermission where userId=?1")
	List<Object[]> findByUserId(int userId);

	@Query("select primaryName, fileName FROM UserPermission where globalName = :globalval and userId = :userid")
	List<Object[]> findByGlobalNameAndUserId(@Param("globalval") String valueOf, @Param("userid") int userId);

	User findByUserNameAndBitStatus(String userName, boolean b);

	@Query(nativeQuery = true, value = " select a.role_name,a.alias_name,a.role_id from m_adm_role a inner join t_user b on a.role_id = b.intgroupid "
			+ " where b.intuserid =:userId and b.tintdeletedstatus = false")
	List<Object[]> findRoleByUserId(@Param("userId") int userId);


}