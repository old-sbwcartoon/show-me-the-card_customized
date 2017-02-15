package com.rnh.showmethecard.model.dto;

public class EvaluationInfo {
	
	
	private int eCommentNo;
	private int eRating;
	private int liked;
	
	
	public int geteCommentNo() {
		return eCommentNo;
	}
	public void seteCommentNo(int eCommentNo) {
		this.eCommentNo = eCommentNo;
	}
	public int geteRating() {
		return eRating;
	}
	public void seteRating(int eRating) {
		this.eRating = eRating;
	}
	public int getLiked() {
		return liked;
	}
	public void setLiked(int liked) {
		this.liked = liked;
	}
	
}
