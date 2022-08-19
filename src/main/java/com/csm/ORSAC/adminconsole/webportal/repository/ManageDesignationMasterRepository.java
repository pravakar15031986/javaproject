package com.csm.ORSAC.adminconsole.webportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.csm.ORSAC.adminconsole.webportal.entity.Designation;

@Repository
public interface ManageDesignationMasterRepository extends JpaRepository<Designation, Integer> {

	@Query(" from Designation d where d.id=:id")
	Designation findByDesignationId(@Param("id") int id);

	List<Designation> findByStatusOrderByDesignationAsc(boolean b);

	@Query("select des.designation from Designation des where LOWER(des.designation) LIKE LOWER(?1)")
	List<Object[]> getDesName(String designation);

	@Query("select des.designation from Designation des where des.id!=?1 and LOWER(des.designation) LIKE LOWER(?2)")
	List<Object[]> getDesName(Integer id, String designation);

}
