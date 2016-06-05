package org.project.model.service;

import java.util.List;

import org.project.model.entity.UserTest;
import org.project.model.repository.UserTestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserTestService {

    @Autowired
    UserTestRepository userTestRepository;

    public List<UserTest> getUserTests(){
        return userTestRepository.findAll();
    }

    public void addUserTest(UserTest userTest){
        userTestRepository.save(userTest);
    }
}
