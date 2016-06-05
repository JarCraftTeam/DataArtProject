package org.project.model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.project.model.entity.Test;
import org.project.model.repository.TestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {

	@Autowired
	TestRepository testRepository;
	
	public List<Test> getTests(){
		return testRepository.findAll();
	}
	
	public void addTest(Test test){
		testRepository.save(test);
	}
	
	@Transactional
	public Test getTestById(Long id){
		return testRepository.findById(id);
	}
	
	public void updateTest(Test test){
		testRepository.save(test);
	}
	
	public void deleteTest(Long id){
		testRepository.delete(id);
	}
}
