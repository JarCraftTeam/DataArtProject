package org.project.model.service;

import org.project.model.entity.Question;
import org.project.model.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {

    @Autowired
    QuestionRepository questionRepository;

    public Question getQuestionById(Long id) {
        return questionRepository.findById(id);
    }
}
