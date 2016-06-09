package org.project.model.entity;

public class TestUserAnswer {
    private Test test;
    private User user;

    public TestUserAnswer() {
    }

    public TestUserAnswer(Test test, User user) {
        this.test = test;
        this.user = user;
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
}
