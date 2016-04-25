package org.project.model.service;

import java.util.List;

import org.project.model.entity.User;
import org.project.model.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	UserRepository userRep;

	public List<User> getUsers(){
		return userRep.findAll();
	}
	
	public void addUser(User newUser){
		userRep.save(newUser);
	}
	
}
