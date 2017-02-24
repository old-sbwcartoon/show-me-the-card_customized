package com.rnh.showmethecard.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.rnh.showmethecard.model.dto.Member;

public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
				
		String url = request.getRequestURI();
		boolean redirect = false;
		if (url.contains("/*/*")) {
			if (request.getSession().getAttribute("loginuser") == null) {
				
				PrintWriter writer;
				try {
					writer = response.getWriter();
					//writer.println("<script>alert('Need Login'); location.href='/showmethecard/home.action';</script>");
					writer.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				redirect = true;
			}		
		}
		if (redirect) {
			try {
				response.sendRedirect("/showmethecard/account/login.action");
//				response.sendRedirect("/showmethecard/home.action");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return !redirect;//false가 반환되면 요청 처리 중단
	}
	@Override //after returning of controller method
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//System.out.println("HandlerInterceptor.postHandle");		
	}
	@Override //after processing request
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//System.out.println("HandlerInterceptor.afterCompletion");		
	}

}
