package com.rnh.showmethecard.model.dto;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class MyCardList implements Serializable {
	
	private String url;
	private String cName;
	private String desc;
	private String img;
	private int cardNo;
	private String mycComment;
	private int mycNo;
	private int scrapCount;
	private String imgSrc;
	private String discoverer;
	private String urlDesc;
	
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
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
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
	public String getDiscoverer() {
		return discoverer;
	}
	public void setDiscoverer(String discoverer) {
		this.discoverer = discoverer;
	}
	public String getUrlDesc() {
		return urlDesc;
	}
	public void setUrlDesc(String urlDesc) {
		this.urlDesc = urlDesc;
	}
}
