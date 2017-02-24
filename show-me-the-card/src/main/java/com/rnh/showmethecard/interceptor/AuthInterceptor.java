package com.rnh.showmethecard.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
				
		String url = request.getRequestURI();
		
		
		boolean redirect = false;
		if (url.contains("home.action") || url.contains("login.action") ) {
			redirect = false;
			
		} else {
			System.out.println(redirect+"1");
			if (request.getSession().getAttribute("loginuser") == null){
				redirect = true;
			}
			
		}
		if (redirect) {
			System.out.println(redirect+"2");			 
			response.sendRedirect(
				"/showmethecard/home.action");
		}
		System.out.println(redirect+"3");
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
