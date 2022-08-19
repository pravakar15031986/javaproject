package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLink;

@Repository("globalLinkRepository")
public interface ManageGlobalLinkRepository extends JpaRepository<GlobalLink, Integer> {

	@Query("select distinct glink from PrimaryLink plink, GlobalLink glink where plink.globalLinkId = glink.globalLinkId")
	List<GlobalLink> getGloballinkMappedPrimaryLinks();

	@Query("SELECT globalLinkId,globalLinkName,bitHomePage,bitStatus,vchicon FROM GlobalLink where bitStatus= :id order by globalLinkName")
	List<Object[]> findByBitStatus(@Param("id") boolean id);

	GlobalLink findByGlobalLinkId(@Param("globalLinkId") int globalLinkId);

	@Transactional
	@Modifying
	@Query("UPDATE GlobalLink  SET bitStatus =1 WHERE globalLinkId = :#{#globalLinkId}")
	void deleteGlobalLink(@Param("globalLinkId") int globalLinkId);

	@Query("select globalLinkName from GlobalLink  where LOWER(globalLinkName) LIKE LOWER(:glinkName)")
	List<GlobalLink> checkDuplicateGlobalLinkNameByName(@Param("glinkName") String glinkName);

	@Query("select max(intSortNum) from GlobalLink ")
	int getMaxSerialNo();

	@Query("select globalLinkName from GlobalLink  where LOWER(globalLinkName) LIKE LOWER(?1) and globalLinkId!=?2 ")
	List<GlobalLink> checkDuplicateGlobalLinkNameByName(String glinkName, int globalLinkId);

}
