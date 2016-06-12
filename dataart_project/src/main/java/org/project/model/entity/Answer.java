package org.project.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "answer")
public class Answer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@Column(name = "text")
	private String text;

	@Column(name = "picture")
	private byte[] picture;

	@Column(name = "`right`")
	private boolean right;
	
	@Transient
	private String encryptedImage;

	public String getEncryptedImage() {
		return encryptedImage;
	}

	public void setEncryptedImage(String encryptedImage) {
		this.encryptedImage = encryptedImage;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

    public void setText(String text) {
		this.text = text;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public boolean isRight() {
		return right;
	}

	public void setRight(boolean right) {
		this.right = right;
	}

    @Override
    public String toString() {
        return text;
    }

}
