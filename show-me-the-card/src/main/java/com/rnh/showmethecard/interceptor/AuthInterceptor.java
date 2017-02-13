package com.rnh.showmethecard.interceptor;

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
		if (url.contains("/*/")) {

		}
		if (redirect) {
			response.sendRedirect(
				"/showmethecard/account/login.action");
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
