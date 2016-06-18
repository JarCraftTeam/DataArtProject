package org.project.controller;

import org.project.model.entity.*;
import org.project.model.repository.UserAnswerRepository;
import org.project.model.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/CheckTest")
public class CheckTestController {

    @Autowired
    TestService testService;

    @Autowired
    UserTestService userTestService;

    @Autowired
    CheckBoxListService checkBoxListService;

    @Autowired
    QuestionService questionService;

    @Autowired
    UserAnswerService userAnswerService;

    @Autowired
    UserAnswerRepository userAnswerRepository;


    @RequestMapping(value = "/check/{test.id}", method = RequestMethod.GET)
    public String checkTheTest(Model model, @PathVariable("test.id") Long testId) {
        final Test test = testService.getTestById(testId);
        List<UserTest> userTestsByTestId = new ArrayList<>();
        final List<UserTest> userTests = userTestService.getUserTests();
        userTestsByTestId.addAll(userTests.stream().filter(userTest -> Objects.equals(userTest.getTest().getId(), testId)).collect(Collectors.toList()));
        List<UserAnswer> userAnswers = new ArrayList<>();
        for (UserTest userTest : userTestsByTestId) {
            final List<UserAnswer> answers = userTest.getUserAnswers();
            for (UserAnswer userAnswer : answers) {
                final Question question = questionService.getQuestionById(userAnswer.getQuestionId());
                if (question.getType().getType().equals("Full") && userAnswer.getMark() == 0 && userTest.getMark() == 0) {
                    userAnswer.setOpenQuestionText(question.getText());
                    userAnswers.add(userAnswer);
                }
            }
        }

        final TestUserAnswer testUserAnswer = new TestUserAnswer();
        testUserAnswer.setUserAnswers(userAnswers);
        if (userAnswers.size() == 0) {
            return "redirect:/"; //nothing to check
        }
        model.addAttribute("testUserAnswer", testUserAnswer);

        return "checkOpenQuestions";
    }

    @RequestMapping(value = "/saveCheckResult", method = RequestMethod.POST)
    public String saveUserTest(@ModelAttribute("testUserAnswer") TestUserAnswer testUserAnswer, SessionStatus status) {

        //// TODO: 16.06.2016 запись оценки в userAnswer
        final List<UserAnswer> userAnswers = testUserAnswer.getUserAnswers();
        userAnswerRepository.save(userAnswers);
        //// TODO: 16.06.2016 запись общей оценки в userTest
        if (userAnswers != null && !userAnswers.isEmpty()) {
            Set<UserTest> userTestSet = new HashSet<>();
            for (UserAnswer userAnswer : userAnswers) {
                final Long userTestId = userAnswer.getUserTestId();
                userTestSet.add(userTestService.getUserTestById(userTestId));
            }
            for (UserTest userTest : userTestSet) {
                final Long userTestId = userTest.getId();

                List<UserAnswer> userAnswersForCurrentUserTest = userAnswerService.getUserAnswers().stream().filter(
                        userAnswer -> userAnswer.getUserTestId().equals(userTestId)).collect(Collectors.toList());

                int markForUserTest = 0;
                for (UserAnswer userAnswer : userAnswersForCurrentUserTest) {
                    if (userAnswer.getMaxMark() < userAnswer.getMark()) {
                        markForUserTest += userAnswer.getMaxMark();
                    } else {
                        markForUserTest += userAnswer.getMark();
                    }
                }
                userTest.setMark(markForUserTest);
                userTestService.updateUserTest(userTest);
            }
        }
        status.setComplete();
        return "redirect:/";
    }
}
