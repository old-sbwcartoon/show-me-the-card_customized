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

	
	public static class Point {
		
		/**
		 * 회원 포인트 히스토리 content
		 * 사용 예 : int memberFinalPoint = memberPoint + Literal.Point.Member.COMMENT_FIRST_TIME;
		 * @author ghoul
		 */
		public static class Member {
			
			public static final int ATTENDANCE           = 30;
			public static final int DISCOVERY_NEW_CARD   = 5;
			public static final int COMMENT_FIRST_TIME   = 1;
			public static final int EVALUATION           = 20;
			public static final int SCRAPPED             = 10;
			public static final int VISITOR_PER_HUNDRED  = 1;
			public static final int FOLLOWER_PER_ONE     = 5;
			
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
