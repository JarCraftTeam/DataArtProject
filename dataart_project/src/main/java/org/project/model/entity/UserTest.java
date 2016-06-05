package org.project.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "user_test")
public class UserTest {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private Long id;

//	@ManyToOne
//	@JoinColumn(name = "user_id")
//	private User user;

//	@ManyToOne
//	@JoinColumn(name = "test_id")
//	private Test test;

    @Override
    public String toString() {
        return "UserTest{" +
                "id=" + id +
                ", mark=" + mark +
                ", answerText='" + answerText + '\'' +
                '}';
    }

    @Column(name = "mark")
	private int mark;

	@Column(name = "answer_id")
	private int answer;

	@Column(name = "answer_text")
	private String answerText;

    public String getAnswerText() {
        return answerText;
    }

    public void setAnswerText(String answerText) {
        this.answerText = answerText;
    }


    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getMark() {
		return mark;
	}

	public void setMark(int mark) {
		this.mark = mark;
	}

}
