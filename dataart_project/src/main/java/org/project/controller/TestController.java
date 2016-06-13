package org.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.ListIterator;

import org.project.model.entity.Test;
import org.project.model.entity.UserTest;
import org.project.model.repository.AnswerRepository;
import org.project.model.repository.TypeRepository;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/test")
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


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goTest(Model model) {
		model.addAttribute("tests", testService.getTests());
		return "test";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String goAddTest(Model model) {
		model.addAttribute("newTest", new Test());
		model.addAttribute("types", typeRepository.findAll());
		return "addTest";
	}

	@RequestMapping(value = "/add/saved", method = RequestMethod.POST)
	public String saveTest(@ModelAttribute Test test, @RequestParam("imageLoaderQst") MultipartFile questionImage[],
			@RequestParam("imageLoaderAnsw") MultipartFile answerImage[]) {

		test = cleanExtra(test);
		test = addImages(test, questionImage, answerImage);

		testService.addTest(test);
		return "redirect:/test/";
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
		testService.updateTest(test);
		return "redirect:/test/";
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
		return "redirect:/test/";
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
		// for test, need delete
		ListIterator iteratorTest = userTestsForResult.listIterator();
		while (iteratorTest.hasNext()) {
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! " + iteratorTest.next().toString());	
		}

		model.addAttribute("userTests", userTestsForResult);

		return "resultsPage";
	}

}
