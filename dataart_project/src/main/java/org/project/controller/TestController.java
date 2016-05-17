package org.project.controller;

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
	public String saveTest(@ModelAttribute Test test) {
		System.out.println(test.getQuestions().get(0).getAnswers().get(0).getText());
		testService.addTest(test);
		return "redirect:/test/";
	}
	
	@RequestMapping(value = "/add/changed", method = RequestMethod.POST)
	public String saveChangedTest(@ModelAttribute Test test) {
		testService.updateTest(test);
		return "redirect:/test/";
	}

	@RequestMapping(value="/{test.id}",method=RequestMethod.GET)
	public String goUpdateTest(Model model, @PathVariable("test.id") Long testId){
		model.addAttribute("test", testService.getTestById(testId));
		model.addAttribute("types", typeRepository.findAll());
		return "changeTest";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateTest(Model model) {
		model.addAttribute("tests", testService.getTests());
		return "updateTest";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteTest(@ModelAttribute Test test) {
		testService.deleteTest(test.getId());
		return "redirect:/test/";
	}
}
