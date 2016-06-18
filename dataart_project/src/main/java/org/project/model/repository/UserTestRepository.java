package org.project.model.repository;

import java.util.List;

import org.project.model.entity.UserTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserTestRepository extends JpaRepository<UserTest, Long> {

    public UserTest findById(Long id);

    public List<UserTest> findAllByTestId(Long id);
}
