package com.saltlux.mysite.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogoutInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(true);
		if(session!=null) {
			//로그아웃처리
			session.removeAttribute("memName");
			session.removeAttribute("memId");
			session.removeAttribute("memEmail");
			
			session.invalidate();
		}
		
		response.sendRedirect(request.getContextPath());
		return false;
	}

}
