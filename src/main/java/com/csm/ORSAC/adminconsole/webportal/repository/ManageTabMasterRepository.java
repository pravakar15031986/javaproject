package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csm.ORSAC.adminconsole.webportal.bean.TabMasterVo;

@Repository("tabMasterRepository")
public interface ManageTabMasterRepository extends JpaRepository<TabMasterVo, Integer> {

	@Query("select distinct functionId,functionName FROM FunctionMasterVo")
	List<Object[]> getFuctionList();

	

	@Query("select distinct buttonId,buttonName FROM ButtonMasterVo where functionId= :id")
	List<Object[]> getButtonList(@Param("id") int id);

	@Query(" select t.tabId,t.tabName,t.description,t.addData,t.viewData,"
			+ "t.manageData,t.bitStatus,t.intSortNum,t.fileName,"
			+ "f.functionId,f.functionName,b.buttonId,b.buttonName "
			+ "from FunctionMasterVo f inner join ButtonMasterVo b on f.functionId=b.functionId "
			+ "inner join TabMasterVo t on b.buttonId=t.buttonId ORDER BY t.tabId DESC")
	List<Object[]> getTabRecords();

	@Query(" select t.tabId,t.tabName,t.description,t.addData,t.viewData,"
			+ "t.manageData,t.bitStatus,t.intSortNum,t.fileName,"
			+ "f.functionId,f.functionName,b.buttonId,b.buttonName "
			+ "from FunctionMasterVo f inner join ButtonMasterVo b on f.functionId=b.functionId "
			+ "inner join TabMasterVo t on b.buttonId=t.buttonId where t.bitStatus= :condition ORDER BY t.tabId DESC")
	List<Object[]> searchTabRecordsByStatus(@Param("condition") int condition);

	TabMasterVo findByTabId(@Param("tabId") int tabId);

	@Transactional
	@Modifying
	@Query("UPDATE TabMasterVo  SET bitStatus =1 WHERE tabId = :#{#tabId}")
	void deleteTabMaster(@Param("tabId") int tabId);

	@Query("select tabName from TabMasterVo  where tabName like :tabName")
	List<TabMasterVo> findByTabNameByName(@Param("tabName") String tabName);

	@Query("select fileName from TabMasterVo  where fileName like :tab_file_name")
	List<TabMasterVo> findByTabFileNameByFileName(@Param("tab_file_name") String tab_file_name);

	@Query("select max(intSortNum) from TabMasterVo ")
	int getMaxSlNo();

}
