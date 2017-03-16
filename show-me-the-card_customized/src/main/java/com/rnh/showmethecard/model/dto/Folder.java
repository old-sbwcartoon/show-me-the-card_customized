package com.rnh.showmethecard.model.dto;

import java.io.Serializable;

public class Folder implements Serializable {
	
	
	
	private String fName;
	private int fPoint;
	private Boolean secret;
	private Boolean deleted;
	private String mId;
	private String bestTag;
	private int fNo;	
	
	public String getBestTag() {
		return bestTag;
	}
	public void setBestTag(String bestTag) {
		this.bestTag = bestTag;
	}
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public int getfPoint() {
		return fPoint;
	}
	public void setfPoint(int fPoint) {
		this.fPoint = fPoint;
	}
	public Boolean getSecret() {
		return secret;
	}
	public void setSecret(Boolean secret) {
		this.secret = secret;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	
	
	
}