package com.saltlux.mysite.security;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.saltlux.mysite.dto.UserDTO;


public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//1. handler 종류 확인
		if(handler instanceof HandlerMethod == false) {
			// DeafultServletHandler가 처리하는 경우(보통, assets의 정정 자원 접근)
			return true;
		}
		
		//2. casting
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		
		//3. Method에 @Auth 달려 있는 지 확인
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

		//4. Method에 @Auth가 안달려 있으면
		if(auth == null) {
			return true;
		}
		
		//5. type(class)에 달려있는지?
		
		//6. @Auth가 달려 있는 경우에는 인증(Authetication) 여부 확인
		HttpSession session = request.getSession();
		if(session == null) {
			response.sendRedirect(request.getContextPath() + "/user/loginForm");
			return false;
		}
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("memName", (String)session.getAttribute("memName"));
		map.put("memId", (String)session.getAttribute("memId"));
		map.put("memEmail", (String)session.getAttribute("memEmail"));
		
		if(map == null) {
			response.sendRedirect(request.getContextPath() + "/user/loginForm");
			return false;			
		}
		
		//7.role까지 체크(권한)
		String roleAnnotation = auth.role();
		//String roleUser=authUser.getRole();
		
		
		return true;
	}

}
