package com.rnh.showmethecard.model.dto;

public class EvaluationComment {
	
	
	private int eCommentNo;
	private String mId;
	private int cardNo;
	private String content;
	private String regDate;
	private boolean deleted;
	
	
	public int geteCommentNo() {
		return eCommentNo;
	}
	public void seteCommentNo(int eCommentNo) {
		this.eCommentNo = eCommentNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
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
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	
	
}
