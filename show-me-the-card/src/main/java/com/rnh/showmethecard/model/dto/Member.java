package com.rnh.showmethecard.model.dto;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class Member implements Serializable {
	
/*	//정규식 전체적으로 수정하기
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
*/
	
	@NotEmpty	
	private String mId;	
	@NotEmpty	
	private String password;
	@NotEmpty
	private String mName;
	@NotEmpty
	private String email;
	@NotEmpty
	private String phone;
	private int mCount;
	private int mPoint;
	private String userType;
	private boolean deleted;
	private Date regDate;
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
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
	public int getmCount() {
		return mCount;
	}
	public void setmCount(int mCount) {
		this.mCount = mCount;
	}
	public int getmPoint() {
		return mPoint;
	}
	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
