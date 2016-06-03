package org.project.model.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestUserAnswer {
    private Test test;
    private User user;
    private Map<Question, UserTest> questionUserTestMap;
    private List<String> testAnswText;

    public List<String> getTestAnswText() {
        return testAnswText;
    }

    public void setTestAnswText(List<String> testAnswText) {
        this.testAnswText = testAnswText;
    }

    public TestUserAnswer() {
    }

    public TestUserAnswer(Test test, User user) {
        this.test = test;
        this.user = user;
        this.questionUserTestMap = new HashMap<>();
        this.testAnswText = new ArrayList<>();
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Map<Question, UserTest> getQuestionUserTestMap() {
        return questionUserTestMap;
    }

    public void setQuestionUserTestMap(Map<Question, UserTest> questionUserTestMap) {
        this.questionUserTestMap = questionUserTestMap;
    }
}
