package com.rnh.showmethecard.model.dto;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class MyCardList implements Serializable {
	
	private String url;
	private String title;
	private String desc;
	private String img;
	private int cardNo;
	private String mycComment;
	private int mycNo;
	private int scrapCount;
	private String imgSrc;
	
	
	public int getMycNo() {
		return mycNo;
	}
	public void setMycNo(int mycNo) {
		this.mycNo = mycNo;
	}
	public int getScrapCount() {
		return scrapCount;
	}
	public void setScrapCount(int scrapCount) {
		this.scrapCount = scrapCount;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public String getMycComment() {
		return mycComment;
	}
	public void setMycComment(String mycComment) {
		this.mycComment = mycComment;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
}
