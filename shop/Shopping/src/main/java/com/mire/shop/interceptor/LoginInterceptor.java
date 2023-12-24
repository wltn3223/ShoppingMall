package com.mire.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("인터셉터 호출");
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		if(session == null || session.getAttribute("memberId") ==null) {
			
			response.sendRedirect("/login.jsp");
			return false;
		}
		
		
		return true;
	}
	
	

}
