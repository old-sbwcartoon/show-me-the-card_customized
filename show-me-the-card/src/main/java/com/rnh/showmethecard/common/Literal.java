package com.rnh.showmethecard.common;

public class Literal {

	/**
	 * Html 파싱시 키워드로 사용
	 * 사용 예 : case Literal.ParseKeyword.DESCRIPTION: .. break;
	 * @author ghoul
	 */
	public static class ParseKeyword {
		
		public static final String TITLE         = "t";
		public static final String DESCRIPTION   = "d";
		public static final String IMAGE         = "i";
		
	}

	
	public static class Content {
		
		/**
		 * 회원 포인트 히스토리 content
		 * 사용 예 : String memberCommentFirstTimeContent = Literal.Content.Member.COMMENT_FIRST_TIME;
		 * @author ghoul
		 */
		public static class Member {
			
			
			public static final String ATTENDANCE           = "로그인";
			public static final String DISCOVERY_NEW_CARD   = "카드 첫등록";
			public static final String COMMENT_FIRST_TIME   = "첫댓글";
			public static final String EVALUATION           = "첫품평";
			public static final String SCRAPPED             = "스크랩";
			public static final String VISITOR_PER_HUNDRED  = "방문/100";
			public static final String FOLLOWER_PER_ONE     = "팔로/1";
			
			
			/*
			 * 회원 포인트 히스토리 point
			 * 사용 예 : int memberCommentFirstTimePoint = Literal.Content.Member.getPoint(Literal.Content.Member.COMMENT_FIRST_TIME);
			 */
			public static final int getPoint(String content) {
				
				int point = 0;
				
				switch (content) {
					case ATTENDANCE :           point = 30;  break;
					case DISCOVERY_NEW_CARD :   point = 5;   break;
					case COMMENT_FIRST_TIME :   point = 1;   break;
					case EVALUATION :           point = 20;  break;
					case SCRAPPED :             point = 10;  break;
					case VISITOR_PER_HUNDRED :  point = 1;   break;
					case FOLLOWER_PER_ONE :     point = 5;   break;
				}
				
				return point;
			}
		}
		
		/**
		 * 카드 별점 가중치
		 * 사용 예 : double cardFinalPoint = cardPoint * Litral.Point.CardRatingRatio.STAR3;
		 * @author ghoul
		 */
		public static class CardRatingRatio {
			
			public static final double STAR0 = 1;
			public static final double STAR1 = 2;
			public static final double STAR2 = 3;
			public static final double STAR3 = 4;
			public static final double STAR4 = 5;
			public static final double STAR5 = 6;
			
		}
	}
	
	
	public static class Ui {
		
		public static final int LIMIT = 3;
		
	}
	
}
