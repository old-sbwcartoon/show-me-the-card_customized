package com.rnh.showmethecard.common;

public class Literal {

	
	public static class ParseHtml {
		
		/**
		 * Html 파싱시 키워드로 사용
		 * 사용 예 : case Literal.ParseKeyword.DESCRIPTION: .. break;
		 * @author ghoul
		 */
		public static class Keyword {
			
			public static final String TITLE         = "t";
			public static final String DESCRIPTION   = "d";
			public static final String IMAGE         = "i";
			
		}
		
		
		public static class From {
			
			public static final String WEB  = "w";
			public static final String DB   = "d";
			
		}
		
	}
	

	
	public static class Content {
		
		/**
		 * 회원 포인트 히스토리 content
		 * 사용 예 : String memberCommentFirstTimeContent = Literal.Content.Member.COMMENT_FIRST_TIME;
		 * @author ghoul
		 */
		public static class Member {
			
			
			public static final String ATTENDANCE                      = "로그인";
			public static final String DISCOVERY_NEW_CARD              = "카드 첫등록";
			
			public static final String SCRAPPED                        = "스크랩";
			public static final String VISITOR_PER_HUNDRED             = "방문/100";
			public static final String FOLLOWER_PER_ONE                = "팔로/1";

			public static final String EVALUATION_RATING               = "첫품평";	
			public static final String DEL_EVALUATION_RATING           = "품평 삭제";
			
			public static final String EVALUATION_COMMENT_FIRST_TIME   = "첫댓글";
			public static final String DEL_EVALUATION_COMMENT_ALL      = "최후의 댓글 삭제";
			
			/*
			 * 회원 포인트 히스토리 point
			 * 사용 예 : int memberCommentFirstTimePoint = Literal.Content.Member.getPoint(Literal.Content.Member.COMMENT_FIRST_TIME);
			 */
			public static final int getPoint(String content) {
				
				int point = 0;
				
				switch (content) {
					case ATTENDANCE :                      point = 30;  break;
					case DISCOVERY_NEW_CARD :              point = 5;   break;					
					case SCRAPPED :                        point = 10;  break;
					case VISITOR_PER_HUNDRED :             point = 1;   break;
					case FOLLOWER_PER_ONE :                point = 5;   break;

					case EVALUATION_RATING :               point = 20;  break;
					case DEL_EVALUATION_RATING :           point = -20; break;
					
					case EVALUATION_COMMENT_FIRST_TIME :   point = 1;   break;
					case DEL_EVALUATION_COMMENT_ALL :      point = -1;  break;
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
		
		public static final int PAGER_LIMIT = 3;
		public static final int BEST_EVALUATION_RATING_LIST_LIMIT = 10;
		
	}
	
	
	public static class Table {
		
		public static class Name {
			
			public static final String EVALUATION_RATING  = "EVALUATION_RATING";
			public static final String EVALUATION_COMMENT = "EVALUATION_COMMENT";
		}

		public static class Column {
			
			public static final String CARD_NO  = "CARD_NO";
		}
	}
	
	
	public static class Analysis {
		
		public static class Average {
			
			public static final int MIN_ARTICLE_NO = 2;
		}
	}
	
	public static class Search {
		
		public static final int THRESHOLD  = 10; // 검색어 count 최소 percent
	}
	
	public static class CardPoint {
		
		public static final double TOP_OF_TENPERCENT  = 0.1;
		
		public static class Type{
			public static final String SCRAP = "scrap";
			public static final String MOVEURL = "moveurl";
			public static final String RATINGCARD = "ratingcard";
		}
	}
}
