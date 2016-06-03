package org.project.model.entity;

import java.util.HashMap;
import java.util.Map;

public class TestUserAnswer {
    private Test test;
    private User user;
    private Map<Question, UserTest> questionUserTestMap;
    private String xxx;

    public String getXxx() {
        return xxx;
    }

    public void setXxx(String xxx) {
        this.xxx = xxx;
    }

    public TestUserAnswer() {
    }

    public TestUserAnswer(Test test, User user) {
        this.test = test;
        this.user = user;
        this.questionUserTestMap = new HashMap<>();
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
