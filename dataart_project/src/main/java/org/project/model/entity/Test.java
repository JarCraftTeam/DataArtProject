package org.project.model.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class Test {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

//	@OneToMany(mappedBy = "test", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//	private List<UserTest> userTests = new ArrayList<>();

	@OneToMany(cascade=CascadeType.ALL, orphanRemoval=true) 
	@JoinColumn(name = "test_id")
	List<Question> questions = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name = "test_id")
	List<UserTest> userTests = new ArrayList<>();

	@Column(name = "name")
	private String name;

	@Column(name = "text")
	private String text;

	@Column(name = "private")
	private boolean priv;

	@Column(name = "date_start")
	private Date date_start;

	@Column(name = "date_end")
	private Date date_end;

	@Column(name = "mark")
	private int mark;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<UserTest> getUserTests() {
		return userTests;
	}

	public void setUserTests(List<UserTest> userTests) {
		this.userTests = userTests;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isPriv() {
		return priv;
	}

	public void setPriv(boolean priv) {
		this.priv = priv;
	}

	public Date getDate_start() {
		return date_start;
	}

	public void setDate_start(Date date_start) {
		this.date_start = date_start;
	}

	public Date getDate_end() {
		return date_end;
	}

	public void setDate_end(Date date_end) {
		this.date_end = date_end;
	}

	public int getMark() {
		return mark;
	}

	public void setMark(int mark) {
		this.mark = mark;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
