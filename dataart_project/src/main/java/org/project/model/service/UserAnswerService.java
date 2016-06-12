package org.project.model.service;


import org.project.model.entity.UserAnswer;
import org.project.model.repository.UserAnswerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserAnswerService {

    @Autowired
    UserAnswerRepository userAnswerRepository;

    public List<UserAnswer> getUserAnswers(){
        return userAnswerRepository.findAll();
    }

    public void addUserAnswer(UserAnswer userAnswer){
        userAnswerRepository.save(userAnswer);
    }
}
