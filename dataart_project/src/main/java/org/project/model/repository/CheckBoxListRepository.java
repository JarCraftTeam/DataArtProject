package org.project.model.repository;

import org.project.model.entity.CheckBoxList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CheckBoxListRepository extends JpaRepository<CheckBoxList, Long> {
}
