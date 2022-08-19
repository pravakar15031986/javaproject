package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csm.ORSAC.adminconsole.webportal.bean.FunctionMasterVo;

@Repository("functionMasterRepository")
public interface ManageFunctionMasterRepository extends JpaRepository<FunctionMasterVo, Integer> {

	@Query("SELECT functionId,functionName,fileName,description,bitStatus FROM FunctionMasterVo where bitStatus= :id")
	List<Object[]> findByBitStatus(@Param("id") boolean id);


	FunctionMasterVo findByFunctionId(@Param("functionId") int functionId);

	@Transactional
	@Modifying
	@Query("UPDATE FunctionMasterVo  SET bitStatus =1 WHERE functionId = :#{#functionId}")
	void deleteFunctionMaster(@Param("functionId") int functionId);

	@Query("select functionName from FunctionMasterVo  where LOWER(functionName) LIKE LOWER(:name)")
	List<FunctionMasterVo> findByDuplicateFunctionname(@Param("name") String name);

	@Query("select fileName from FunctionMasterVo  where LOWER(fileName) LIKE LOWER(:name)")
	List<FunctionMasterVo> checkDuplicateFileNameByName(@Param("name") String name);

	@Query("select functionName from FunctionMasterVo  where functionId!=?1 and LOWER(functionName) LIKE LOWER(?2)")
	List<FunctionMasterVo> findByDuplicateFunctionname(int id, String name);

	@Query("select fileName from FunctionMasterVo  where functionId!=?1 and LOWER(fileName) LIKE LOWER(?2)")
	List<FunctionMasterVo> checkDuplicateFileNameByName(int id, String name);

	


}