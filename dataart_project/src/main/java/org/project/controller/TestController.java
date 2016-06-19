package org.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import org.project.model.entity.Answer;
import org.project.model.entity.Question;
import org.project.model.entity.Test;
import org.project.model.entity.TestUserAnswer;
import org.project.model.entity.UserAnswer;
import org.project.model.entity.UserTest;
import org.project.model.repository.AnswerRepository;
import org.project.model.repository.TypeRepository;
import org.project.model.repository.UserAnswerRepository;
import org.project.model.service.QuestionService;
import org.project.model.service.TestService;
import org.project.model.service.UserAnswerService;
import org.project.model.service.UserService;
import org.project.model.service.UserTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class TestController {

	@Autowired
	TestService testService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	TypeRepository typeRepository;
	
	@Autowired
	AnswerRepository answerRepository;
	
	@Autowired
	UserTestService userTestService;
	
	@Autowired
    QuestionService questionService;

    @Autowired
    UserAnswerService userAnswerService;

    @Autowired
    UserAnswerRepository userAnswerRepository;


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goTest(Model model) {
		model.addAttribute("tests", testService.getTests());
		return "test";
	}
	
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String goHelp() {
		return "Help";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String goAddTest(Model model) {
		model.addAttribute("newTest", new Test());
		model.addAttribute("types", typeRepository.findAll());
		return "addTest";
	}
	
	@RequestMapping(value = "/copy", method = RequestMethod.POST)
	public String copyTest(@RequestParam("test-id") Long id,
			@RequestParam("name") String name,
			@RequestParam("about") String about,
			@RequestParam("publicity_check") int priv,
			@RequestParam("date_start") Date dateStart,
			@RequestParam("date_end") Date dateEnd) {

		Test originalTest=testService.getTestById(id);
		Test copyTest=new Test();
		
		boolean privat;
		if(priv==1) privat=true;
		else privat=false;
		
		copyTest.setName(name);
		copyTest.setText(about);
		copyTest.setPriv(privat);
		copyTest.setDate_start(dateStart);
		copyTest.setDate_end(dateEnd);
		for(Question que: originalTest.getQuestions()){
			Question copyQue=new Question();
			copyQue.setText(que.getText());
			copyQue.setType(que.getType());
			copyQue.setPicture(que.getPicture());
			copyQue.setMark(que.getMark());
			for(Answer ans: que.getAnswers()){
				Answer copyAns=new Answer();
				copyAns.setText(ans.getText());
				copyAns.setRight(ans.isRight());
				copyAns.setPicture(ans.getPicture());
				copyQue.getAnswers().add(copyAns);
			}
			copyTest.getQuestions().add(copyQue);
		}
		
		testService.addTest(copyTest);
		return "redirect:/admin/";
	}

	@RequestMapping(value = "/add/saved", method = RequestMethod.POST)
	public String saveTest(@ModelAttribute Test test, @RequestParam("imageLoaderQst") MultipartFile questionImage[],
			@RequestParam("imageLoaderAnsw") MultipartFile answerImage[]) {

		test = cleanExtra(test);
		test = addImages(test, questionImage, answerImage);

		testService.addTest(test);
		return "redirect:/admin/";
	}

	@RequestMapping(value = "/view/{test.id}")
	public String viewTest(Model model, @PathVariable("test.id") Long testId) {
		model.addAttribute("test", testService.getTestById(testId));
		return "updateTest";
	}

	@RequestMapping(value = "/updated", method = RequestMethod.POST)
	public String saveChangedTest(@ModelAttribute Test nTest,
			@RequestParam("imageLoaderQst") MultipartFile questionImage[],
			@RequestParam("imageLoaderAnsw") MultipartFile answerImage[]) {

		Test test = testService.getTestById(nTest.getId());
		nTest = cleanExtra(nTest);
		nTest = addImages(nTest, questionImage, answerImage);
		test = compareImages(test, nTest);
		
		test.getUserTests().clear();
		
		testService.updateTest(test);
		return "redirect:/admin/";
	}

	@RequestMapping(value = "/update/{test.id}", method = RequestMethod.GET)
	public String goUpdateTest(Model model, @PathVariable("test.id") Long testId) {

		model.addAttribute("test", encryptImages(testService.getTestById(testId)));
		model.addAttribute("types", typeRepository.findAll());
		return "changeTest";
	}

	@RequestMapping(value = "/delete/{test.id}", method = RequestMethod.GET)
	public String deleteTest(@PathVariable("test.id") Long testId) {
		testService.deleteTest(testId);
		return "redirect:/admin/";
	}

	private Test cleanExtra(Test test) {
		for (int i = 0; i < test.getQuestions().size(); i++) {
			if (test.getQuestions().get(i).getText() == null)
				test.getQuestions().remove(i);
			else
				for (int j = 0; j < test.getQuestions().get(i).getAnswers().size(); j++)
					if (test.getQuestions().get(i).getAnswers().get(j).getText() == null)
						test.getQuestions().get(i).getAnswers().remove(j);
		}
		return test;
	}

	private Test addImages(Test test, MultipartFile questionImage[], MultipartFile answerImage[]) {
		try {
			int jimg = 0;
			for (int i = 0; i < test.getQuestions().size(); i++) {
				if (!questionImage[i].isEmpty())
					test.getQuestions().get(i).setPicture(questionImage[i].getBytes());
				for (int j = 0; j < test.getQuestions().get(i).getAnswers().size(); j++) {
					if (!answerImage[jimg].isEmpty())
						test.getQuestions().get(i).getAnswers().get(j).setPicture(answerImage[jimg].getBytes());
					jimg++;
				}
			}
		} catch (IOException e) {
			System.out.println("Error!" + e);
		}
		return test;
	}

	private Test compareImages(Test testOld, Test testNew) {
		for (int i = 0; i < testOld.getQuestions().size(); i++) {
			if ((i < testOld.getQuestions().size()) && (i < testNew.getQuestions().size()))
				if (testOld.getQuestions().get(i).getPicture() != null)
					testNew.getQuestions().get(i).setPicture(testOld.getQuestions().get(i).getPicture());
			for (int j = 0; j < testOld.getQuestions().get(i).getAnswers().size(); j++) {
				if ((j < testOld.getQuestions().get(i).getAnswers().size())
						&& (j < testNew.getQuestions().get(i).getAnswers().size()))
					if (testOld.getQuestions().get(i).getAnswers().get(j).getPicture() != null)
						testNew.getQuestions().get(i).getAnswers().get(j)
								.setPicture(testOld.getQuestions().get(i).getAnswers().get(j).getPicture());
			}
		}
		return testNew;
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
	
	@RequestMapping(value = "/results/{test.id}", method = RequestMethod.GET)
	public String resultsOfTest(Model model, @PathVariable("test.id") Long testId) {
		List<UserTest> userTestsAll = userTestService.getUserTests();
		List<UserTest> userTestsForResult = new ArrayList<UserTest>();
		ListIterator iterator = userTestsAll.listIterator();
		while (iterator.hasNext()) {
			UserTest userTest = (UserTest) iterator.next();
			if (userTest.getTest().getId().equals(testId)) {
				userTestsForResult.add(userTest);
			}	
		}
		model.addAttribute("userTests", userTestsForResult);
		model.addAttribute("test", testService.getTestById(testId));
		return "resultsPage";
	}
	
	@RequestMapping(value = "/results/downloadExcel/{test.id}", method = RequestMethod.GET)
	public ModelAndView downloadExcel(@PathVariable("test.id") Long testId) {
		Test test = testService.getTestById(testId);
		ModelAndView mdv = new ModelAndView("excelView","test",test);
		return mdv;
	}
	
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
                if (question.getType().getType().equals("Full") && userAnswer.getMark() == -1) {
                    userAnswer.setOpenQuestionText(question.getText());
                    userAnswers.add(userAnswer);
                }
            }
        }

        final TestUserAnswer testUserAnswer = new TestUserAnswer();
        testUserAnswer.setUserAnswers(userAnswers);
        if (userAnswers.size() == 0) {
            return "redirect:/admin/?nothing=true"; //nothing to check
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

                int markForUserTest = userTest.getMark();
                for (UserAnswer userAnswer : userAnswersForCurrentUserTest) {
                    if (userAnswer.getMaxMark() < userAnswer.getMark()) {
                        markForUserTest += userAnswer.getMaxMark();
                        if(userAnswer.getAnswerText()!=null) userAnswer.setMark(userAnswer.getMaxMark());
                    } else {
                        markForUserTest += userAnswer.getMark();
                    }
                }
                userTest.setMark(markForUserTest);
                userTestService.updateUserTest(userTest);
            }
        }
        status.setComplete();
        return "redirect:/admin/";
    }

}
