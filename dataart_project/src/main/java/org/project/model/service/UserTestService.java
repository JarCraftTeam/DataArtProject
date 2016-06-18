package org.project.model.service;

import org.project.model.entity.UserTest;
import org.project.model.repository.UserTestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserTestService {

    @Autowired
    UserTestRepository userTestRepository;

    public List<UserTest> getUserTests() {
        return userTestRepository.findAll();
    }
    
    public List<UserTest> getUserTestsByTestId(Long id){
    	return userTestRepository.findAllByTestId(id);
    }
    
    public void deleteUserTest(Long id){
    	userTestRepository.delete(id);
    }

    public UserTest getUserTestById(Long id) {
        return userTestRepository.findById(id);
    }

    public void addUserTest(UserTest userTest) {
        userTestRepository.save(userTest);
    }

    public void updateUserTest(UserTest userTest) {
        userTestRepository.save(userTest);
    }
}
