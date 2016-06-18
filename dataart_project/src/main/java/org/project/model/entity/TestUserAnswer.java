package org.project.model.entity;

import java.util.ArrayList;
import java.util.List;

public class TestUserAnswer {
    private List<UserAnswer> userAnswers;

    public TestUserAnswer() {
        userAnswers = new ArrayList<>();
    }

    public List<UserAnswer> getUserAnswers() {
        return userAnswers;
    }

    public void setUserAnswers(List<UserAnswer> userAnswers) {
        this.userAnswers = userAnswers;
    }
}
