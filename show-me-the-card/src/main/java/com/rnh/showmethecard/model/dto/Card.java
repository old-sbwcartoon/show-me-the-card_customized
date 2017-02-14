package com.rnh.showmethecard.model.dto;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class Card implements Serializable {
	
	//정규식 전체적으로 수정하기
	@NotEmpty
	@Pattern(regexp = "[A-Za-z0-9]{8,15}", message = "아이디 형식 오류")
	private String id;
	//정규식
	@NotEmpty
	private String name;
	
	@NotEmpty
	@Pattern(regexp = "[A-Za-z0-9]{8,15}", message = "아이디 형식 오류")
	private String passwd;
	@NotEmpty
	//email 정규식 넣기
	private String email;
	@NotEmpty
	private String phone;
	@NotEmpty
	private String userType;
	private String profilePhoto;
	private boolean deleted;
	private boolean permission;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getProfilePhoto() {
		return profilePhoto;
	}
	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public boolean isPermission() {
		return permission;
	}
	public void setPermission(boolean permission) {
		this.permission = permission;
	}

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
