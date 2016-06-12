package org.project.model.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

//	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//	private List<UserTest> userTests = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	List<UserTest> userTests = new ArrayList<>();

	@Column(name = "first_name")
	private String first_name;

	@Column(name = "second_name")
	private String second_name;

	@Column(name = "telephone")
	private String telephone;

	@Column(name = "email")
	private String email;

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

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getSecond_name() {
		return second_name;
	}

	public void setSecond_name(String second_name) {
		this.second_name = second_name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
