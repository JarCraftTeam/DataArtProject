package org.project.controller;

import java.io.IOException;

import org.project.model.entity.Test;
import org.project.model.repository.TypeRepository;
import org.project.model.service.TestService;
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
	TypeRepository typeRepository;

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
	public String saveTest(@ModelAttribute Test test,@RequestParam("imageLoaderQst") MultipartFile questionImage[],
			@RequestParam("imageLoaderAnsw") MultipartFile answerImage[]) {
		
		
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
			System.out.println("Need some validation!");
		}
		
		
		
		System.out.println(test.getQuestions().get(0).getAnswers().get(0).getText());
		testService.addTest(test);
		return "redirect:/test/";
	}
	
	@RequestMapping(value="/view/{test.id}")
	public String viewTest(Model model, @PathVariable("test.id") Long testId){
		model.addAttribute("test",testService.getTestById(testId));
		return "updateTest";
	}
	
	@RequestMapping(value = "/update/saved", method = RequestMethod.POST)
	public String saveChangedTest(@ModelAttribute Test test) {
		testService.updateTest(test);
		return "redirect:/test/";
	}

	@RequestMapping(value="/update/{test.id}",method=RequestMethod.GET)
	public String goUpdateTest(Model model, @PathVariable("test.id") Long testId){
		model.addAttribute("test", testService.getTestById(testId));
		model.addAttribute("types", typeRepository.findAll());
		return "changeTest";
	}
	
	
	@RequestMapping(value = "/delete/{test.id}", method = RequestMethod.GET)
	public String deleteTest(@PathVariable("test.id") Long testId) {
		testService.deleteTest(testId);
		return "redirect:/test/";
	}
}
