package com.rnh.showmethecard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.rnh.showmethecard.common.Literal;
import com.rnh.showmethecard.common.Point;
import com.rnh.showmethecard.model.dto.BestTag;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.EvaluationService;
import com.rnh.showmethecard.model.service.MemberService;
import com.rnh.showmethecard.webscraping.HtmlParser;

@Controller
@RequestMapping(value="/evaluation")
public class EvaluationController {

	@Autowired
	@Qualifier("evaluationService")
	private EvaluationService service;
	
	@Autowired
	@Qualifier("point")
	private Point point;	
	
	
	@RequestMapping(value={"/evaluationmain.action", "/", ""}, method=RequestMethod.GET)
	public String showEvaluation(int cardNo, Model model, HttpServletRequest req) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		int pageNo = 1;
		
		Card card = service.showCardDb(cardNo);
		HtmlParser htmlParser = new HtmlParser(card.getSiteUrl(), Literal.ParseHtml.From.DB);

		//card
		model.addAttribute("htmlParser", htmlParser);
		model.addAttribute("card", card);
		
		//evaluation
		int pageNoSum = service.showEvaluationRatingNoSum(Literal.Table.Name.EVALUATION_RATING, Literal.Table.Column.CARD_NO, String.valueOf(2));		
		model.addAttribute("evalPageNoMax", Math.ceil(pageNoSum / Literal.Ui.PAGER_LIMIT));
		model.addAttribute("isEvalRating", service.confirmEvaluationRatingOfmId(cardNo, member.getmId()));
		model.addAttribute("evalCommentList", service.showEvaluationCommentList(cardNo));
		model.addAttribute("evalRatingList", showEvaluationRatingListWithPageNo(cardNo, req, pageNo));		
		model.addAttribute("eRatingAvg", service.showEvaluationRatingAvg(cardNo));
		model.addAttribute("myRating", service.showEvaluationRatingBymId(cardNo, member.getmId()));
		
		
		List<BestTag> bestTag = service.showBestTag(cardNo, "CARD_NO");
		return "evaluation/evaluationmain";
	}
	
	@RequestMapping(value="showevalrating.action", method=RequestMethod.POST)
	@ResponseBody
	public List<EvaluationRating> showEvaluationRatingListWithPageNo(int cardNo, HttpServletRequest req, int pageNo) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		return service.showEvaluationRatingListWithPageNo(cardNo, member.getmId(), pageNo);
	}
	
	//합치기
	@RequestMapping(value="addevalrating.action", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String addEvaluationRating(int cardNo, HttpServletRequest req, String content, int eRating) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		EvaluationRating newRating = service.addEvaluationRating(cardNo, member.getmId(), content, eRating);
		
		
		point.updateMemberPointAndLevel(Literal.Content.Member.EVALUATION_RATING, member);
		
		return new Gson().toJson(newRating);
	}

	
	@RequestMapping(value="addevalcomment.action", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String addEvaluationComment(int cardNo, HttpServletRequest req, String content) {
		/////////////////////////////////// int cardNo
		Member member = (Member)req.getSession().getAttribute("loginuser");

		EvaluationComment newComment = new EvaluationComment();
		newComment.setCardNo(cardNo);
		newComment.setContent(content);
		newComment.setmId(member.getmId());
		
		boolean isExists = service.confirmEvaluationCommentOfmId(cardNo, member.getmId());
		if (!isExists) {
			point.updateMemberPointAndLevel(Literal.Content.Member.EVALUATION_COMMENT_FIRST_TIME, member);
		}
		service.addEvaluationComment(newComment);
		
		return new Gson().toJson(newComment);
	}
	

	
	@RequestMapping(value="addevalratingliked.action", method=RequestMethod.POST)
	@ResponseBody
	public String addEvaluationRatingLiked(int eRatingNo, String mId, HttpServletRequest req) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		service.addEvaluationRatingLiked(eRatingNo, mId, member.getmId());
		return null;
	}
	
	
	
	
	
	
	@RequestMapping(value="delevalrating.action", method=RequestMethod.POST)
	@ResponseBody
	public String deleteEvaluationRating(HttpServletRequest req, int eRatingNo) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		service.deleteEvaluationRatingByeRatingNo(eRatingNo);
		point.updateMemberPointAndLevel(Literal.Content.Member.DEL_EVALUATION_RATING, member);
		return null;
	}
	
	@RequestMapping(value="delevalcomment.action", method=RequestMethod.POST)
	@ResponseBody
	public String deleteEvaluationComment(HttpServletRequest req, int cardNo, int eCommentNo) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		service.deleteEvaluationCommentByeCommentNo(eCommentNo);
		boolean isExists = service.confirmEvaluationCommentOfmId(cardNo, member.getmId());
		if (!isExists) {
			point.updateMemberPointAndLevel(Literal.Content.Member.DEL_EVALUATION_COMMENT_ALL, member);
		}
		return null;
	}
	
	
}
