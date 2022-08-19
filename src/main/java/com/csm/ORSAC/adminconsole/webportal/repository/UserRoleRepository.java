package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.csm.ORSAC.adminconsole.webportal.entity.UserRole;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {

	@Query(nativeQuery = true, value = " select urol.int_user_role_id,urol.int_user_id,urol.int_role_id from m_adm_user_role urol where urol.int_user_id =:userId ")
	List<UserRole> findByRoleIdByUserId(@Param("userId") int userId);

	@Query(nativeQuery = true, value = " select urole.int_role_id,STRING_AGG (role.description,',') as description "
			+ " from m_adm_user_role urole inner join m_adm_role role on urole.int_role_id=role.role_id "
			+ " where  urole.int_user_id=:userId and urole.bitstatus=false group by urole.int_role_id ")
	List<Object[]> getAllRoleIds(@Param("userId") Integer userId);

	@Query(nativeQuery = true, value = " select urol.int_user_role_id,urol.int_user_id,urol.int_role_id from m_adm_user_role urol where urol.int_user_id =:userId ")
	List<Integer> viewUserRoleList(@Param("userId") Integer userId);

	@Query(nativeQuery = true, value = " select urol.int_user_role_id,urol.int_user_id,urol.int_role_id from m_adm_user_role urol where urol.int_user_id =:userId ")
	List<Object[]> viewUserRoleListTest(@Param("userId") Integer userId);
	

	List<UserRole> findByRoleIdAndUserId(int roleId, Integer userId);

	List<UserRole> findByUserId(int userId);

	List<UserRole> findRoleIdByUserId(Integer userId);

	@Query(nativeQuery = true, value = " select DISTINCT usr.intuserid,usr.vchuserfullname FROM m_adm_user_role rol "
			+ " inner join  t_user usr on rol.int_user_id = usr.intuserid "
			+ " where rol.bitstatus= false and usr.tintdeletedstatus=false and rol.int_role_id=:roleId ")
	List<Object[]> getUsersByRoleId(@Param("roleId") Integer roleId);

	@Query(value = "select rol.role_id,rol.role_name from m_adm_user_role usrl\r\n"
			+ "    inner join m_adm_role rol on usrl.int_role_id=rol.role_id\r\n"
			+ "    where usrl.int_user_id=?1 and rol.bit_location_taging_required='true'", nativeQuery = true)
	List<Object[]> findUserRoleNameByUserId(Integer userId);

	List<UserRole> findByRoleIdAndBitstatus(Integer role_id, boolean b);

	List<UserRole> findByRoleId(Integer role_id);

}