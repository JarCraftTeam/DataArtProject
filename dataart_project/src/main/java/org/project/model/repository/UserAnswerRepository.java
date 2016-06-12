package org.project.model.repository;


import org.project.model.entity.UserAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAnswerRepository  extends JpaRepository<UserAnswer, Long> {
}
