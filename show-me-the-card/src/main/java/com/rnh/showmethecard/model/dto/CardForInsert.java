package com.rnh.showmethecard.model.dto;

import java.io.Serializable;

public class CardForInsert implements Serializable {
	
	private String siteUrl;
	private String discoverer;
	private String cName;
	private int cardNo;
	private String mycComment;
	private String[] mycTagsArr;
	private String imgSrc;
	
	
	public String getSiteUrl() {
		return siteUrl;
	}
	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}
	public String getDiscoverer() {
		return discoverer;
	}
	public void setDiscoverer(String discoverer) {
		this.discoverer = discoverer;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
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
	public String[] getMycTagsArr() {
		return mycTagsArr;
	}
	public void setMycTagsArr(String[] mycTagsArr) {
		this.mycTagsArr = mycTagsArr;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	
}
