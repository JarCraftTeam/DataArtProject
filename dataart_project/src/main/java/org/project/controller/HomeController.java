package org.project.controller;

import org.project.model.entity.User;
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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goHome(Model model) {
		model.addAttribute("users", userService.getUsers());
		model.addAttribute("newUser", new User());
		return "index";
	}

	@RequestMapping(value = "/saved", method = RequestMethod.POST)
	public String addUser(@ModelAttribute User user) {
		userService.addUser(user);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String userHome(Model model) {
		model.addAttribute("openTests", testService.getTests());
		return "usersFirstPage";
	}

}
