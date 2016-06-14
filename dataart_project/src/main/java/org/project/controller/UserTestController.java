package org.project.controller;


import org.project.model.entity.*;
import org.project.model.repository.*;
import org.project.model.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/UserTest")
public class UserTestController {

    @Autowired
    TestService testService;

    @Autowired
    UserService userService;

    @Autowired
    UserTestService userTestService;

    @Autowired
    UserAnswerService userAnswerService;

    @Autowired
    CheckBoxListService checkBoxListService;

    @Autowired
    TypeRepository typeRepository;

    @Autowired
    AnswerRepository answerRepository;

    @Autowired
    UserTestRepository userTestRepository;

    @Autowired
    UserAnswerRepository userAnswerRepository;

    @Autowired
    CheckBoxListRepository checkBoxListRepository;

    @RequestMapping(value = "/take/{test.id}", method = RequestMethod.GET)
    public String passTheTest(Model model, @PathVariable("test.id") Long testId) {
        UserTest userTest = new UserTest();
        Test test=testService.getTestById(testId);
        userTest.setTest(encryptImages(test));
        userTest.setUser(new User());
        userTest.setAnswers(new ArrayList<>());
        model.addAttribute("userTest", userTest);
        return "takeTest";
//        return "takeTest2";
    }

    @RequestMapping(value = "/saveAnswers", method = RequestMethod.POST)
//    public String saveUserTest(@ModelAttribute List<UserTest> userTests, SessionStatus status) {
//    public String saveUserTest(@ModelAttribute ArrayList<UserTest> userTests, @ModelAttribute UserTest userTest1, @ModelAttribute User user, SessionStatus status) {
    public String saveUserTest(@ModelAttribute("userTest") UserTest userTest, SessionStatus status) {

//        System.out.println("Test name --------------------------------------------------------------->>> " + testForTaking.getTest().getName());
//        System.out.println("Test id --------------------------------------------------------------->>> " + testForTaking.getTest().getId());
//        System.out.println("User name ---------------------------------------------------------------->>> " + testForTaking.getUser().getFirst_name());
//        System.out.println("User id ---------------------------------------------------------------->>> " + testForTaking.getUser().getId());
//        System.out.println("Questions1 Answer ID ----------->>> " + testForTaking.getTest().getQuestions().get(0).getUserAnswers());
//        System.out.println("Questions2 Answer ID ----------->>> " + testForTaking.getTest().getQuestions().get(1).getUserAnswers());
        Test takenTest = testService.getTestById(userTest.getTest().getId());

        ArrayList<UserAnswer> userAnswers = new ArrayList<>();
        List<Question> questions = takenTest.getQuestions();
        for (int i = 0; i < questions.size(); i++) {
            UserAnswer userAnswer = new UserAnswer();
            Question question = questions.get(i);
            Long questionId = question.getId();
            userAnswer.setQuestionId(questionId);
            boolean right = false;
            String questionType = question.getType().getType();
            List<String> userAnswerList = userTest.getTest().getQuestions().get(i).getUserAnswers();
            if (userAnswerList != null && !userAnswerList.isEmpty()) {
                if ("One".equals(questionType)) {
                    Long userAnswerId = Long.parseLong(userAnswerList.get(0));
                    userAnswer.setAnswerId(userAnswerId);
                    Long rightAnswerId = 0L;
                    for (Answer answer : question.getAnswers()) {
                        if (answer.isRight()) {
                            rightAnswerId = answer.getId();
                        }
                    }
                    if (rightAnswerId.equals(userAnswerId)) {
                        right = true;
                    }
                } else if ("Several".equals(questionType)) {
                    Set<Long> userCheckBoxAnswerIds = new HashSet<>();
                    ArrayList<CheckBoxList> checkBoxLists = new ArrayList<>();
                    for (String userCheckBoxAnswer : userAnswerList) {
                        CheckBoxList checkBoxList = new CheckBoxList();
                        Long userCheckBoxAnswerId = Long.parseLong(userCheckBoxAnswer);
                        checkBoxList.setAnswerId(userCheckBoxAnswerId);
                        checkBoxLists.add(checkBoxList);
                        userCheckBoxAnswerIds.add(userCheckBoxAnswerId);
                    }
                    userAnswer.setChAnswers(checkBoxLists);
                    Set<Long> rightAnswers = new HashSet<>();
                    for (Answer answer : question.getAnswers()) {
                        if (answer.isRight()) {
                            rightAnswers.add(answer.getId());
                        }
                    }
                    if (userCheckBoxAnswerIds.equals(rightAnswers)) {
                        right = true;
                    }

                } else if ("Full".equals(questionType)) {

                    userAnswer.setAnswerText(userAnswerList.get(0));

                }
            }
            userAnswer.setAnswerRight(right);
            userAnswers.add(userAnswer);
        }

        User user = userTest.getUser();
        userService.addUser(user);
        UserTest userTestMy = new UserTest();
        userTestMy.setTest(takenTest);
        userTestMy.setUser(user);
        userTestMy.setAnswers(userAnswers);
//        userAnswerService.addUserAnswer();
        userTestService.addUserTest(userTestMy);
        status.setComplete();
//        return "redirect:/testPassed/" + userTestMy.getId();
        return "redirect:/";
    }
    
    private Test encryptImages(Test test) {

		for (int i = 0; i < test.getQuestions().size(); i++) {
			String encrypted = "null";
			byte[] photo = test.getQuestions().get(i).getPicture();
			if (photo != null)
				encrypted = Base64.getEncoder().encodeToString((photo));
			test.getQuestions().get(i).setEncryptedImage(encrypted);
			for (int j = 0; j < test.getQuestions().get(i).getAnswers().size(); j++) {
				encrypted = "null";
				photo = test.getQuestions().get(i).getAnswers().get(j).getPicture();
				if (photo != null)
					encrypted = Base64.getEncoder().encodeToString((photo));
				test.getQuestions().get(i).getAnswers().get(j).setEncryptedImage(encrypted);
			}
		}
		return test;
	}


//    @RequestMapping(value = "/testPassed/{usertest.id}")
//    public String viewPassedTest(Model model, @PathVariable("usertest.id") Long usertestId) {
//        model.addAttribute("passedUserTest", userTestRepository.findOne(usertestId));
//        return "usersFirstPage";
//    }

}
