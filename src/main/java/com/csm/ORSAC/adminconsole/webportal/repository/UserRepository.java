package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csm.ORSAC.adminconsole.webportal.entity.User;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query("select usr from User usr where usr.userName= :userName")
	public User getUserByUserID(@Param("userName") String userName);

	@Query("select usr from User usr where usr.fullName like %:userName%")
	public Page<User> searchuserByName(@Param("userName") String userName, Pageable pageable);

	@Query("select usr from User usr where usr.groupId= :groupId")
	public Page<User> searchuserByGroupId(@Param("groupId") int groupId, Pageable pageable);



	@Query("select usr FROM User usr")
	List<User> getUserList();

	

	@Query("SELECT usr.userId , usr.userName , usr.fullName FROM User usr WHERE usr.userId not in(SELECT usrlink.userID FROM UserLinkAccess usrlink) and usr.groupId not in(SELECT grplnk.adm_role FROM GlobalLinkAccess grplnk)")
	Object[] getUnassignedPrimryLinkUserList();



	@Query("SELECT usr FROM User usr WHERE usr.userId  in(SELECT distinct usrlink.userID FROM UserLinkAccess usrlink) or usr.groupId  in(SELECT distinct grplnk.adm_role FROM GlobalLinkAccess grplnk)")
	public Page<User> getPermissionAssignedUserList(Pageable pageable);

	public List<User> findByEmail(String email);

	public List<User> findByEmailAndBitStatus(String email, boolean b);

	@Query(" Select max(userId) from User ")
	public String getMaxSlNo();

	
	
	@Query("from User")
	Page<User> viewAll(Pageable pageable);



	@Query(nativeQuery = true, value = "select * from sp_wr_user_details(?1,?2,?3,?4,?5,?6,?7,?8)")
	List<Object[]> viewAllPage(String mobileNo, String email, String name, String oname, String role, String center,
			String desig, String status);

	@Query(" from User u where u.userId=:userId")
	public User findByUserId(@Param("userId") int userId);

	@Query(nativeQuery = true, value = " select count(*) from t_user where vchemailid=:email and intuserid  !=:userId ")
	public Integer findByExitEmail(@Param("email") String email, @Param("userId") int userId);

	@Query(nativeQuery = true, value = " select count(*) from t_user where tintdeletedstatus='false' and vchmobileno=:mobile and intuserid  !=:userId ")
	public Integer findByExitMobile(@Param("mobile") String mobile, @Param("userId") int userId);

	@Query("select usr from User usr where usr.userId !=?1 and usr.mobile =?2")
	public List<Object[]> doesMobileNoExist(int userId, String mobile);

	@Query("select usr from User usr where usr.userId !=:userId ")
	public List<User> viewUserList(int userId);

	@Query(nativeQuery = true, value = " select usr.vchuserfullname,desi.nvchdesigname,usr.vchmobileno,usr.intuserid,usr.vchemailid,usr.int_gender,usr.vchphotofilename,usr.chrfirsttimelogin from t_user usr  inner join m_adm_designation desi on usr.intdesigid = desi.intdesigid "
			+ " where usr.tintdeletedstatus='false' and usr.vchusername=:userName ")
	public List<Object[]> mUserDetails(@Param("userName") String userName);

	@Query(nativeQuery = true, value = "select usr.intuserid,usr.vchusername,usr.vchuserfullname from t_user usr "
			+ " inner join m_adm_user_role usrol on usr.intuserid=usrol.int_user_id"
			+ " where usrol.int_role_id =?1 and usr.intleveldetailid =?2 and usr.tintdeletedstatus=false ") //
	List<Object[]> getUserByRoleAndOrgId(int roleId, int intLevelDetailId);

	@Query("select usr from User usr where usr.userId !=:userId and usr.intLevelDetailId=:orgId and usr.bitStatus=false and usr.userId not in(1,2) ")
	public List<User> retriveUsersByLevelId(Integer userId, Integer orgId);

	@Query(value = "select u.intuserid,u.vchusername,u.vchuserfullname from t_user u"
			+ " inner join m_adm_user_role ur on u.intuserid=ur.int_user_id"
			+ " where ur.int_role_id=?1 and u.intleveldetailid=?2 and u.tintdeletedstatus=false and ur.bitstatus=false", nativeQuery = true)
	public List<Object[]> findUserNameByRoleIdAndOrganizationId(@Param("roleId") Integer roleId,
			@Param("orgId") Integer organizationId);

	@Query(nativeQuery = true, value = " select urole.int_user_id,usr.vchuserfullname,desg.nvchdesigname,STRING_AGG (role.description,',') as description,"
			+ " usr.dtmcreatedon ,usr.vchmobileno,usr.vchemailid,usr.tintDeletedStatus,levl.nvchlevelname,rc.vch_research_center_name from t_user usr "
			+ " inner join m_adm_leveldetails levl on usr.intleveldetailid=levl.intleveldetailid "
			+ " inner join m_adm_user_role urole on usr.intuserid=urole.int_user_id "
			+ " inner join m_adm_role as role on role.role_id = urole.int_role_id "
			+ " left join m_adm_designation desg on desg.intdesigid = usr.intdesigid "
			+ " left join m_wr_user_rc_mapping rcm on usr.intuserid = rcm.int_user_id "
			+ " left join m_wr_research_center rc on rcm.int_research_center_id = rc.int_research_center_id "
			+ " where role.role_id !=1 and urole.bitstatus=false  and (usr.vchuserfullname LIKE %:name% and usr.vchmobileno LIKE %:mob% and usr.vchemailid LIKE %:email% ) "
			// + " usr.tintdeletedstatus=:status and levl.intleveldetailid=:orgName ) "
			// //and role.role_id=:roleVal and desg.intdesigid=:intdesigid
			+ " group by urole.int_user_id,usr.vchuserfullname,usr.dtmcreatedon ,desg.nvchdesigname,usr.vchmobileno,"
			+ " usr.vchemailid,usr.tintDeletedStatus,levl.nvchlevelname,rc.vch_research_center_name order by levl.nvchlevelname,usr.vchuserfullname ")
	List<Object[]> viewSearchPage(@Param("email") String email, @Param("name") String name, @Param("mob") String mob,
			Pageable pageable);// ,@Param("roleVal")Integer roleVal

	@Query(nativeQuery = true, value = " select urole.int_user_id,usr.vchuserfullname,desg.nvchdesigname,STRING_AGG (role.description,',') as description,"
			+ " usr.dtmcreatedon ,usr.vchmobileno,usr.vchemailid,usr.tintDeletedStatus,levl.nvchlevelname,rc.vch_research_center_name,usr.chrloginfailattempt from t_user usr "
			+ " inner join m_adm_leveldetails levl on usr.intleveldetailid=levl.intleveldetailid "
			+ " inner join m_adm_user_role urole on usr.intuserid=urole.int_user_id "
			+ " inner join m_adm_role as role on role.role_id = urole.int_role_id "
			+ " left join m_adm_designation desg on desg.intdesigid = usr.intdesigid "
			+ " left join m_wr_user_rc_mapping rcm on usr.intuserid = rcm.int_user_id"
			+ " left join m_wr_research_center rc on rcm.int_research_center_id = rc.int_research_center_id "
			+ " where role.role_id !=1 and urole.bitstatus=false"
			+ " group by urole.int_user_id,usr.vchuserfullname,usr.dtmcreatedon ,desg.nvchdesigname,usr.vchmobileno,"
			+ " usr.vchemailid,usr.tintDeletedStatus,levl.nvchlevelname,rc.vch_research_center_name,usr.chrloginfailattempt order by levl.nvchlevelname,usr.vchuserfullname OFFSET :start limit :len")
	public List<Object[]> viewUserDetails(@Param(OrsacPortalConstant.START) int start, @Param("len") int len);

	@Query(nativeQuery = true, value = " select count(*) from t_user usr "
			+ " inner join m_adm_leveldetails levl on usr.intleveldetailid=levl.intleveldetailid "
			+ " inner join m_adm_user_role urole on usr.intuserid=urole.int_user_id "
			+ " inner join m_adm_role as role on role.role_id = urole.int_role_id "
			+ " left join m_adm_designation desg on desg.intdesigid = usr.intdesigid "
			+ " left join m_wr_user_rc_mapping rcm on usr.intuserid = rcm.int_user_id"
			+ " left join m_wr_research_center rc on rcm.int_research_center_id = rc.int_research_center_id "
			+ " where role.role_id !=1 and urole.bitstatus=false ")
	public Integer viewUserDetailsCount();

	@Query(nativeQuery = true, value = " select * from t_user where vchmobileno=:mobile and intuserid !=:userId ")
	List<Object[]> getMobileByUserId(@Param("mobile") String mobile, @Param("userId") int userId);

	public List<User> findByMobile(String mobileNo);

	@Query(nativeQuery = true, value = "update t_por_iptracking set chrloginsucessfailure='Y' where intiptrackid = (select ipl.intiptrackid  from  t_por_iptracking ipl where ipl.intcreatedby=:userId order by ipl.dtmcreatedon DESC LIMIT 1)")
	public void updateTrack(@Param("userId") Integer userId);

	@Query("FROM User where userName=:userName")
	public User findByUserName(@Param("userName") String userName);

	@Query("FROM User where userId=:userid")
	public List<User> getOrganizationIdByUserId(@Param("userid") int approvalTo);

	@Query("select usr from User usr where usr.intLevelDetailId =:orgId ")
	public List<User> viewUserListByOrgId(int orgId);

	@Query(nativeQuery = true, value = " select usr.vchuserfullname,desi.nvchdesigname,usr.vchmobileno,usr.intuserid,usr.vchemailid,usr.int_gender,usr.vchphotofilename from t_user usr  inner join m_adm_designation desi on usr.intdesigid = desi.intdesigid "
			+ " where usr.tintdeletedstatus='false' and usr.chrloginfailattempt='N' and usr.intuserid=:userId ")
	public List<Object[]> mUserProfileDetails(@Param("userId") Integer userId);

	@Query(nativeQuery = true, value = "select * from sp_wr_surveyor_details(?1,?2,?3,?4,?5,?6,?7)")
	public List<Object[]> fetchSurveyorList(String mobileno, String email, String fullname, String center, String desn, Integer start, Integer length);

	@Query(nativeQuery = true, value = "select * from sp_wr_pathologist_details(?1,?2,?3,?4,?5)")
	public List<Object[]> fetchPathologistList(String mobileno, String email, String fullname, String center,
			String desn);

	@Query(nativeQuery = true, value = "select * from sp_wr_woreda_experts_details(?1,?2,?3,?4)")
	public List<Object[]> fetchWoredaExpertList(String mobileno, String email, String fullname, String desn);

	@Query(nativeQuery = true, value = "select * from sp_wr_dev_agent_details(?1,?2,?3,?4)")
	public List<Object[]> fetchDevAgentList(String mobileno, String email, String fullname, String desn);

	@Query(nativeQuery = true, value = "select role.role_id,role.role_name,role.description from m_adm_user_role usrrole\r\n"
			+ "inner join m_adm_role role on role.role_id = usrrole.int_role_id\r\n"
			+ "where usrrole.int_user_id=?1 and role.status=false and usrrole.bitstatus=false")
	public List<Object[]> getRoleByUserId(Integer userId);

	@Query(nativeQuery = true, value = "select * from sp_wr_get_notification_users(?2,?3,?1);")
	public List<Object[]> getNotificationUserByRoleRCAndOrgId(int roleId, int intLevelDetailId, int rcId);

	@Query(nativeQuery = true, value = "select dashnotctn.vch_notification_msg,dashnotctn.bit_read_status,dashnotctn.dtmcreatedon,usr.vchuserfullname,dashnotctn.int_dashboard_notify_id\r\n"
			+ "from t_wr_dashboard_notification dashnotctn\r\n"
			+ "inner join t_user usr on dashnotctn.int_to_user_id = usr.intuserid\r\n"
			+ "where usr.tintdeletedstatus=false and dashnotctn.bitstatus=false and dashnotctn.int_to_user_id=?1 order by dashnotctn.dtmcreatedon desc")
	public List<Object[]> viewNotificationByUser(Integer userId);

	@Transactional
	@Modifying
	@Query(value = "update t_user  set chrloginfailattempt= 'N' where intuserid in (\r\n"
			+ "select distinct  users.intuserid from t_user users \r\n"
			+ "inner join t_por_iptracking ip on ip.intcreatedby = users.intuserid\r\n"
			+ "where  users.chrfirsttimelogin = 'N' and users.tintdeletedstatus=false and chrloginfailattempt = 'Y' \r\n"
			+ "and  (abs(extract(epoch from (select ip1.dtmcreatedon from t_por_iptracking ip1 where ip1.intcreatedby = users.intuserid order by ip1.dtmcreatedon desc limit 1) - CURRENT_TIMESTAMP)/3600) ) >= ?1) \r\n"
			+ "\r\n" + "", nativeQuery = true)
	public void activeBlockUsersAfterOneDay(Integer hour);

	@Query(nativeQuery = true, value = "select * from sp_wr_user_details_pagination(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10)")
	public List<Object[]> viewUserDataPagination(String mobile, String email, String fullName, String organizationId,
			String roleId, String researchCenterId, String intdesigid, String status, Integer pstart, Integer plength);

	@Query(nativeQuery = true, value = "select count(*) from sp_wr_user_details_pagination_count(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10)")
	public Integer viewUserDataPaginationCount(String mobile, String email, String fullName, String organizationId,
			String roleId, String researchCenterId, String intdesigid, String status, Integer pstart, Integer plength);

	public List<User> findIntdesigidByIntdesigid(Integer id);
	
	
	@Query(nativeQuery = true, value = " select usr.intuserid,usr.vchuserfullname from t_user usr "
			+ " where usr.tintdeletedstatus='false' and usr.intuserid=?1 ")
	public List<Object[]> getUserDetailsByUserId(int userId);

	@Query(nativeQuery = true, value = "select count(*) from sp_wr_surveyor_details(?1,?2,?3,?4,?5,?6,?7)")
	public Integer fetchSurveyorListCount(String mobile, String email, String name, String rcId, String desigId,
			int start, int length);

	/**
	 * @param Integer roleId
	 * @return
	 * List<Object []>
	 * @author  Shaktimaan Panda
	 * @version 1.0
	 * @since  29-10-2020
	 */
	@Query(nativeQuery = true, value = "select usr.intuserid,usr.vchuserfullname, usr.vchemailid, usr.vchmobileno from t_user usr \r\n"
			+ "inner join  m_adm_user_role usrrole on usr.intuserid=usrrole.int_user_id\r\n"
			+ "where usrrole.int_role_id=?1 and usrrole.bitstatus=false and usr.tintdeletedstatus=false;")
	public List<Object[]> getUserByRoleId(Integer roleId);

	
	@Query(nativeQuery = true, value ="select intuserid,vchuserfullname,vchemailid,vchmobileno from t_user where tintdeletedstatus=false AND intuserid=(\r\n"
			+ "    SELECT int_user_id from t_wr_user_location_tag where bitstatus=false AND int_user_loc_tag_id=(\r\n"
			+ "    SELECT int_user_loc_tag_id from t_wr_user_location_details where bitstatus=false AND int_demography_id=?1))")
	public List<Object[]> getUserByRegionId(Integer regId);

	@Query(nativeQuery = true, value ="select loc.int_demography_id from t_wr_user_location_details loc\r\n"
			+ "inner join t_wr_user_location_tag usertag on usertag.int_user_loc_tag_id=loc.int_user_loc_tag_id\r\n"
			+ "where usertag.int_user_id=?1 and usertag.int_level_id=2 and usertag.bitstatus=false and loc.bitstatus=false")
	public List<Short> getRegionIdByUserId(Integer loginUserId);

	
	@Query(nativeQuery = true, value ="select intuserid,vchuserfullname,vchemailid,vchmobileno from t_user where tintdeletedstatus=false AND intuserid=(\r\n"
			+ "    SELECT int_user_id from t_wr_user_location_tag where bitstatus=false AND int_user_loc_tag_id=(\r\n"
			+ "    SELECT int_user_loc_tag_id from t_wr_user_location_details where bitstatus=false AND int_demography_id=?1))")
	public List<Object[]> getUserByWoredaId(Integer woredaId);

	
	@Query(nativeQuery = true, value ="select usr.intuserid,usr.vchuserfullname, usr.vchemailid, usr.vchmobileno from t_user usr where usr.tintdeletedstatus=false and usr.intuserid  !=:userId ")
	public List<Object[]> getUserDetails(int userId);
}

