package com.rnh.showmethecard.model.dto;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class Card implements Serializable {
	
	@NotEmpty
	private int cardNo;
	private String siteUrl;
	private int cPoint;
	private Date regDate;
	private String discover;
	private String cName;
	private float cRating;
	
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public String getSiteUrl() {
		return siteUrl;
	}
	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}
	public int getcPoint() {
		return cPoint;
	}
	public void setcPoint(int cPoint) {
		this.cPoint = cPoint;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getDiscover() {
		return discover;
	}
	public void setDiscover(String discover) {
		this.discover = discover;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public float getcRating() {
		return cRating;
	}
	public void setcRating(float cRating) {
		this.cRating = cRating;
	}
}
