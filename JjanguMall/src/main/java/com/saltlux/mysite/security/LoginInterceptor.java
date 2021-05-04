package com.saltlux.mysite.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.saltlux.mysite.dto.UserDTO;
import com.saltlux.mysite.service.UserService;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private UserService userService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		/*
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(userId);
		userDTO.setUserPwd(userPwd);
		
		UserDTO authUser = userService.getUser(userDTO);
		System.out.println("로그인정보[userDTO]="+userDTO);
		System.out.println("db확인정보[authUser]="+authUser);
		System.out.println(request.getContextPath());
		
		if(authUser==null) {			
			response.setHeader("result", "fail");
			//response.sendRedirect(request.getContextPath()+"/user/loginForm?result=fail");
			return false;
		}
		
		//session처리
		HttpSession session = request.getSession(true);
		//session.setAttribute("authUser", authUser);
		String enuserPwd=passwordEncoder.encode(userPwd);
		System.out.println("enuserPwd="+enuserPwd);
		
		if(passwordEncoder.matches(enuserPwd, userDTO.getUserPwd())) {
			System.out.println("비밀번호 맞아");
			session.setAttribute("memName", userDTO.getUserName());
			session.setAttribute("memId", userDTO.getUserId());
			session.setAttribute("memEmail", userDTO.getUserEmail());
			response.sendRedirect(request.getContextPath());
		}else {
			System.out.println("비밀번호 틀려");
			response.sendRedirect(request.getContextPath()+"/user/loginForm?result=fail");			
		}
		*/
		return true;
				
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
			//session처리
			HttpSession session = request.getSession(true);
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			
			UserDTO userDTO = new UserDTO();
			userDTO.setUserId(userId);
			userDTO.setUserPwd(userPwd);
			
			if(passwordEncoder.matches(userPwd, userDTO.getUserPwd())) {
				System.out.println("비밀번호 맞아");
				session.setAttribute("memName", userDTO.getUserName());
				session.setAttribute("memId", userDTO.getUserId());
				session.setAttribute("memEmail", userDTO.getUserEmail());
				response.sendRedirect(request.getContextPath());
			}else {
				System.out.println("비밀번호 틀려");
				modelAndView.addObject("result", "fail");
				response.sendRedirect(request.getContextPath()+"/user/loginForm?result=fail");			
			}
	}
	
	

}
