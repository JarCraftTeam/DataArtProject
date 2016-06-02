package org.project.controller;


import java.util.List;

import org.project.model.entity.UserTest;
import org.project.model.repository.AnswerRepository;
import org.project.model.repository.TypeRepository;
import org.project.model.repository.UserTestRepository;
import org.project.model.service.UserTestService;
import org.project.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@RequestMapping("/UserTest")
public class UserTestController {

    @Autowired
    UserTestService userTestService;

    @Autowired
    UserService userService;

    @Autowired
    TypeRepository typeRepository;

    @Autowired
    AnswerRepository answerRepository;

    @Autowired
    UserTestRepository userTestRepository;

    @RequestMapping(value = "/saveAll", method = RequestMethod.POST)
    public String saveUserTest(@ModelAttribute List<UserTest> userTests, SessionStatus status) {
        for(UserTest userTest: userTests){
            System.out.println(userTest.getTest().getName());
            userTestService.addUserTest(userTest);
        }
        status.setComplete();
        return "redirect:/testPassed/";
    }
}
