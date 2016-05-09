package org.project.model.repository;

import org.project.model.entity.Test;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TestRepository extends JpaRepository<Test, Long> {

	public Test findById(Long id);
	
}
