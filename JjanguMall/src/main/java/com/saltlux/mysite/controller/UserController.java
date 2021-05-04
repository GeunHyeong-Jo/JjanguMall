package com.saltlux.mysite.controller;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.mysite.dto.UserDTO;
import com.saltlux.mysite.security.Auth;
import com.saltlux.mysite.security.AuthUser;
import com.saltlux.mysite.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//회원가입폼 페이지
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView joinForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/joinForm.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}


	//로그인페이지
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/loginForm.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//회원가입시 중복아이디체크
	@RequestMapping(value="/checkId", method=RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam String userId) {
		UserDTO userDTO = userService.checkId(userId);
		if(userDTO == null) { //중복아이디 존재하지않음
			return "not_exist";
		}
		else {// (userDTO != null) 중복아이디 존재함 
			return "exist";
		}
	}
	
	
	//회원가입폼에서 submit 후 : 가입ok
	@RequestMapping(value="/joinOk", method=RequestMethod.POST)
	public ModelAndView joinOk(@ModelAttribute UserDTO userDTO, HttpSession session) {
		
		//session 생성
		session.setAttribute("memName", userDTO.getUserName());
		session.setAttribute("memId", userDTO.getUserId());
		session.setAttribute("memEmail", userDTO.getUserEmail());
		
		//회원가입폼을 DB로 전달 
		String encPassword = passwordEncoder.encode(userDTO.getUserPwd());
		System.out.println("비밀번호:"+userDTO.getUserPwd()+", 암호화한 비밀번호:"+encPassword);
		userDTO.setUserPwd(encPassword);
		userService.join(userDTO);
		System.out.println("회원가입완료");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/joinOk.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
		
	}
	
	
	//로그인 아이디/비밀번호 체크
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public String checkLogin(@RequestParam Map<String,String> map , HttpSession session) {
		
		UserDTO userDTO = userService.getUser(map);
		
		System.out.println("로그인정보[map]="+map);
		System.out.println("db확인정보[authUser]="+userDTO);		
		
		if(userDTO==null){
       	 	return "not_exist";
       	 	
		}else if(passwordEncoder.matches(map.get("userPwd"), userDTO.getUserPwd())) {
			session.setAttribute("memName", userDTO.getUserName());
			session.setAttribute("memId", userDTO.getUserId());
			session.setAttribute("memEmail", userDTO.getUserEmail());
			
			return "exist";
		}else {
			return "not_exist";
		}

	}

	
	
	//회원정보수정시 비밀번호 확인
	@RequestMapping(value="/checkPwd",method=RequestMethod.POST)
	@ResponseBody
	public String checkPwd(@RequestParam Map<String,String> map) {
		
		//로그인과 동일 sql사용
		UserDTO userDTO = userService.getUser(map);
		System.out.println("유저pwd /"+map.get("userPwd"));
		System.out.println("DB pwd /"+userDTO.getUserPwd());
		if(passwordEncoder.matches(map.get("userPwd"), userDTO.getUserPwd())) {
			return "exist";
		}else {
        	 return "not_exist";
		}
	}
	
	
	//회원정보수정 페이지
	@RequestMapping(value="/modifyForm",method=RequestMethod.POST)
	public ModelAndView modifyForm(@RequestParam Map<String,String> map) {
		
		UserDTO userDTO = userService.getUser(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/user/modifyForm.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.addObject("userDTO", userDTO);
		
		mav.setViewName("/main/nosIndex");
		
		return mav;
	}
	
	//회원정보수정
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public ModelAndView modify(@RequestParam Map<String,String> map) {
		
		System.out.println("수정할 id="+map.get("userId"));
		UserDTO userDTO = userService.checkId(map.get("userId"));
		System.out.println("이전 pwd="+map.get("userPwd"));
		System.out.println("수정할 pwd="+map.get("newPwd"));
		
		//비밀번호가 null때 이전 값 그대로
		if(map.get("userPwd")=="")
			map.put("userPwd",userDTO.getUserPwd());
		else {
			String encPassword = passwordEncoder.encode(map.get("newPwd"));
			userDTO.setUserPwd(encPassword);
			map.put("userPwd",userDTO.getUserPwd());
		}
		
		userService.modify(map);
		
		return new ModelAndView("redirect:/user/modifyForm"); 
	}
	
	//회원탈퇴페이지
	@GetMapping("/memberOut")
	public ModelAndView memberOut() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/user/memberOut.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");
		
		return mav;
	}

	//회원탈퇴
	@RequestMapping(value="/memberDelete",method=RequestMethod.POST)
	public String memberDelete(HttpSession session,@RequestParam Map<String,String> map) {
		//id,pwd전달
		userService.memberDelete(map);
		
		//세션 종료
		session.invalidate();
		return "redirect:/";
	}

}
