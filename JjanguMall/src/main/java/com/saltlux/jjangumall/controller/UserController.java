package com.saltlux.jjangumall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.jjangumall.dto.UserDTO;
import com.saltlux.jjangumall.service.store.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;	
	@Autowired
	private PasswordEncoder passwordEncoder;

	// 회원가입폼 페이지
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView joinForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/joinForm.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}

	// 로그인페이지
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/loginForm.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}

	// 회원가입시 중복아이디체크
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam String userId) {
		UserDTO userDTO = userService.checkId(userId);
		if (userDTO == null) { // 중복아이디 존재하지않음
			return "not_exist";
		} else {// (userDTO != null) 중복아이디 존재함
			return "exist";
		}
	}

	// 회원가입폼에서 submit 후 : 가입ok
	@RequestMapping(value = "/joinOk", method = RequestMethod.POST)
	public ModelAndView joinOk(@ModelAttribute UserDTO userDTO, HttpSession session) {

		// session 생성
		session.setAttribute("memName", userDTO.getUserName());
		session.setAttribute("memId", userDTO.getUserId());
		session.setAttribute("memEmail", userDTO.getEmail());

		// 회원가입폼을 DB로 전달
		String encPassword = passwordEncoder.encode(userDTO.getPassword());
		System.out.println("비밀번호:" + userDTO.getPassword() + ", 암호화한 비밀번호:" + encPassword);
		userDTO.setPassword(encPassword);
		userService.join(userDTO);
		System.out.println("회원가입완료");

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/user/joinOk.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;

	}

	// 로그인 아이디/비밀번호 체크
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String checkLogin(UserDTO dto, HttpSession session) {

		UserDTO userDTO = userService.getUser(dto);

		System.out.println("로그인정보[map]=" + dto);
		System.out.println("db확인정보[authUser]=" + userDTO);

		if (userDTO == null) {
			session.setAttribute("authResult", "fail");
			return "redirect:/user/loginForm";

		} else if (passwordEncoder.matches(dto.getPassword(), userDTO.getPassword())) {
			session.setAttribute("memName", userDTO.getUserName());
			session.setAttribute("memId", userDTO.getUserId());
			session.setAttribute("memEmail", userDTO.getEmail());
			
			session.setAttribute("authResult", "true");
			return "redirect:/";
		} else {
			session.setAttribute("authResult", "fail");
			return "redirect:/user/loginForm";
		}

	}

	// 회원정보수정시 비밀번호 확인
	@RequestMapping(value = "/checkPwd", method = RequestMethod.POST)
	@ResponseBody
	public String checkPwd(@ModelAttribute UserDTO dto) {

		// 로그인과 동일 sql사용
		UserDTO userDTO = userService.getUser(dto);
		System.out.println("유저pwd /" + dto.getPassword());
		System.out.println("DB pwd /" + userDTO.getPassword());
		if (passwordEncoder.matches(dto.getPassword(), userDTO.getPassword())) {
			return "exist";
		} else {
			return "not_exist";
		}
	}

	// 회원정보수정 페이지
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(@ModelAttribute UserDTO dto) {

		UserDTO userDTO = userService.getUser(dto);

		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/user/modifyForm.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.addObject("userDTO", userDTO);

		mav.setViewName("/main/nosIndex");

		return mav;
	}

	// 회원정보수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(UserDTO dto) {

		System.out.println(dto);
		UserDTO userDTO = userService.checkId(dto.getUserId());

		// 비밀번호가 null때 이전 값 그대로
		if(dto.getPassword()=="")
			dto.setPassword(userDTO.getPassword());
		else {
			String encPassword = passwordEncoder.encode(dto.getPassword());
			userDTO.setPassword(encPassword);
		}

		userService.modify(dto);

		return new ModelAndView("redirect:/user/modifyForm");
	}

	// 회원탈퇴페이지
	@GetMapping("/memberOut")
	public ModelAndView memberOut() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contents", "/user/memberOut.jsp");
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.setViewName("/main/nosIndex");

		return mav;
	}

	// 회원탈퇴
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(HttpSession session, @RequestParam String userId) {
		// id,pwd전달
		userService.delete(userId);

		// 세션 종료
		session.invalidate();
		return "redirect:/";
	}

}
