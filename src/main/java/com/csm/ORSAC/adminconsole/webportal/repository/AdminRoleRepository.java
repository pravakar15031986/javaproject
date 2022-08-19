package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.csm.ORSAC.adminconsole.webportal.entity.AdminRole;

@Repository("adminRoleRepository")
public interface AdminRoleRepository extends JpaRepository<AdminRole, Integer> {

	@Query("select role FROM AdminRole role")
	List<AdminRole> findAllGroup();

	@Query("select role FROM AdminRole role  where role.roleId not in  (select gblnkacc.adm_role.id from GlobalLinkAccess gblnkacc) and status = false order by role.aliasName asc")
	List<AdminRole> findNewAdmRoles();

	@Query("FROM AdminRole ar where roleId = :roleId ")
	List<AdminRole> viewRoleDeatails(Integer roleId);

	@Query(value = "select * from m_adm_role where  bit_location_taging_required='true' and status='false'", nativeQuery = true)
	List<AdminRole> getRoleName();

	List<AdminRole> findByBitStatus(boolean status);

	List<AdminRole> findByBitStatusOrderByRoleNameAsc(boolean b);

	@Query("select role from AdminRole role where role.roleName=?1")
	List<Object[]> checkRoleExist(String name);

	@Query("select role from AdminRole role where role.roleId !=?1 and role.roleName=?2")
	List<Object[]> checkRoleExist(int roleId, String roleName);

	@Query("select aliasName from AdminRole where UPPER(aliasName) LIKE ?1")
	List<Object[]> checkExistingAlias(String aliasName);

	@Query("select aliasName from AdminRole where roleId!=?1 and UPPER(aliasName) LIKE ?2")
	List<Object[]> checkAlias(int roleId, String aliasName);

}