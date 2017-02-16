package com.rnh.showmethecard.model.dto;

public class EvaluationRating {

	
	private int cardNo;
	private String mId;
	private String content;
	private String regDate;
	private String eRating;
	private boolean deleted;
	
	private int eLikedSum; //EvaluationRatingLiked의 eLIked
	
	
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String geteRating() {
		return eRating;
	}
	public void seteRating(String eRating) {
		this.eRating = eRating;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public int geteLikedSum() {
		return eLikedSum;
	}
	public void seteLikedSum(int eLikedSum) {
		this.eLikedSum = eLikedSum;
	}
	
	
}
