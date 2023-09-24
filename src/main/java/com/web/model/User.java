package com.web.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	
	private Long userId;
	@NotEmpty(message = "can not be null name.")
	 @Size(max=10,min=2,message = "{user.name.invalid}")
	private String fname;
	@NotEmpty(message = "can not be null email.")
	  @Email(message = "{user.email.invalid}")
	private String email;
	@NotEmpty(message = "can not be null mobile.")
	@Size(min=10,max=10 ,message="{user.mobile.empty}")
	private String mobile;
	@NotEmpty(message = "can not be null password.")
	 @Size(min=3,max=10 ,message = "{user.password.invalid}")
	private String password;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
