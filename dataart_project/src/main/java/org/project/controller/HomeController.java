package org.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import org.project.model.entity.Test;
import org.project.model.entity.User;
import org.project.model.entity.UserTest;
import org.project.model.service.TestService;
import org.project.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	
	@Autowired
	TestService testService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goLogin(Model model) {
		return "login";
	}

	@RequestMapping(value = "/saved", method = RequestMethod.POST)
	public String addUser(@ModelAttribute User user) {
		userService.addUser(user);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String userHome(Model model) {
		List<Test> allTests = testService.getTests();
		List<Test> notPrivateTests = new ArrayList<Test>();
		ListIterator iterator = allTests.listIterator();
		while (iterator.hasNext()) {
			Test eachTest = (Test) iterator.next();
			if (!eachTest.isPriv()) {
				notPrivateTests.add(eachTest);
			}	
		}
		model.addAttribute("openTests", notPrivateTests);
		return "usersFirstPage";
	}

}
