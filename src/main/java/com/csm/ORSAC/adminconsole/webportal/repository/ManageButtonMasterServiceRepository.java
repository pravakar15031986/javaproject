package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csm.ORSAC.adminconsole.webportal.bean.ButtonMasterVo;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Repository("buttonMasterRepository")
public interface ManageButtonMasterServiceRepository extends JpaRepository<ButtonMasterVo, Integer> {

	@Query("select distinct functionId,functionName FROM FunctionMasterVo")
	List<Object[]> getFuctionList();

	@Query("select b.buttonId,b.buttonName,b.fileName,b.description,b.addData,b.viewData,b.manageData,"
			+ "b.bitStatus,f.functionId,f.functionName from ButtonMasterVo b "
			+ "inner join FunctionMasterVo f  on f.functionId=b.functionId ORDER BY b.buttonId DESC")
	List<Object[]> viewButtonList();

	@Query("select b.buttonId,b.buttonName,b.fileName,b.description,b.addData,b.viewData,b.manageData,"
			+ "b.bitStatus,f.functionId,f.functionName from ButtonMasterVo b "
			+ "inner join FunctionMasterVo f  on f.functionId=b.functionId where b.bitStatus=:condition ORDER BY b.buttonId DESC")
	List<Object[]> searchButtonListByStatus(@Param("condition") int condition);

	ButtonMasterVo findByButtonId(@Param("buttonId") int buttonId);

	@Transactional
	@Modifying
	@Query("UPDATE ButtonMasterVo  SET bitStatus =1 WHERE buttonId = :#{#buttonId}")
	void deleteButtonMaster(@Param("buttonId") int buttonId);

	@Query("select buttonName from ButtonMasterVo  where buttonName like :buttonName")
	List<ButtonMasterVo> findByButtonNameByName(@Param("buttonName") String buttonName);

	@Query("select fileName from ButtonMasterVo  where fileName like :fileName")
	List<ButtonMasterVo> findByFileNameByName(@Param(OrsacPortalConstant.FILE_NAME) String fileName);

	@Query("select max(buttonId) from ButtonMasterVo")
	int getMaxSlNo();

}
