package org.project.controller;


import java.util.ArrayList;
import java.util.List;

import org.project.model.entity.Test;
import org.project.model.entity.TestUserAnswer;
import org.project.model.entity.User;
import org.project.model.entity.Answer;
import org.project.model.repository.AnswerRepository;
import org.project.model.repository.TypeRepository;
import org.project.model.repository.UserTestRepository;
import org.project.model.service.TestService;
import org.project.model.service.UserService;
import org.project.model.service.UserTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@RequestMapping("/UserTest")
public class UserTestController {

    @Autowired
    TestService testService;

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

    @RequestMapping(value = "/take/{test.id}", method = RequestMethod.GET)
    public String passTheTest(Model model, @PathVariable("test.id") Long testId) {
        TestUserAnswer testForTaking = new TestUserAnswer(testService.getTestById(testId), new User());
        model.addAttribute("testForTaking", testForTaking);
        return "takeTest";
    }

    @RequestMapping(value = "/saveAnswers", method = RequestMethod.POST)
//    public String saveUserTest(@ModelAttribute List<UserTest> userTests, SessionStatus status) {
//    public String saveUserTest(@ModelAttribute ArrayList<UserTest> userTests, @ModelAttribute UserTest userTest1, @ModelAttribute User user, SessionStatus status) {
    public String saveUserTest(@ModelAttribute("testForTaking") TestUserAnswer testForTaking, SessionStatus status) {

        System.out.println("Test name --------------------------------------------------------------->>> " + testForTaking.getTest().getName());
        System.out.println("Test id --------------------------------------------------------------->>> " + testForTaking.getTest().getId());
        System.out.println("User name ---------------------------------------------------------------->>> " + testForTaking.getUser().getFirst_name());
        System.out.println("User id ---------------------------------------------------------------->>> " + testForTaking.getUser().getId());
        System.out.println("Questions1 Answer ID ----------->>> " + testForTaking.getTest().getQuestions().get(0).getUserAnswer());
        System.out.println("Questions2 Answer ID ----------->>> " + testForTaking.getTest().getQuestions().get(1).getUserAnswer());
        

        status.setComplete();
        return "redirect:/testPassed/" + testForTaking;
    }

    
    @RequestMapping(value = "/testPassed/{test.id}")
    public String viewPassedTest(Model model, @PathVariable("test.id") Long testId) {
        model.addAttribute("passedTest", testService.getTestById(testId));
        model.addAttribute("userTests", userTestRepository.findAll()); // надо бы по id теста
        return "usersFirstPage";
    }
}
