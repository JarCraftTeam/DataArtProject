package org.project.model.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user_answer")
public class UserAnswer {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column(name = "question_id")
    private Long questionId;

    @Column(name = "answer_id")
    private Long answerId;

    @Column(name = "answer_text")
    private String answerText;

    @Column(name = "answer_right")
    private boolean answerRight;

    @Column(name = "usertest_id")
    private Long userTestId;

    @Column(name = "mark")
    private int mark;

    @Column(name = "max_mark")
    private int maxMark;

    @Transient
    private String openQuestionText;

    // link to checkbox
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "useranswer_id")
    List<CheckBoxList> chAnswers = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public Long getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Long answerId) {
        this.answerId = answerId;
    }

    public String getAnswerText() {
        return answerText;
    }

    public void setAnswerText(String answerText) {
        this.answerText = answerText;
    }

    public boolean isAnswerRight() {
        return answerRight;
    }

    public void setAnswerRight(boolean answerRight) {
        this.answerRight = answerRight;
    }

    public Long getUserTestId() {
        return userTestId;
    }

    public void setUserTestId(Long userTestId) {
        this.userTestId = userTestId;
    }

    public List<CheckBoxList> getChAnswers() {
        return chAnswers;
    }

    public void setChAnswers(List<CheckBoxList> chAnswers) {
        this.chAnswers = chAnswers;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public int getMaxMark() {
        return maxMark;
    }

    public void setMaxMark(int maxMark) {
        this.maxMark = maxMark;
    }

    public String getOpenQuestionText() {
        return openQuestionText;
    }

    public void setOpenQuestionText(String openQuestionText) {
        this.openQuestionText = openQuestionText;
    }
}
