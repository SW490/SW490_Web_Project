package com.my.shop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.shop.service.MemberService;
import com.my.shop.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Bean
	BCryptPasswordEncoder passEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@GetMapping("/signup")
	public void getSignup() throws Exception{
		logger.info("사인업 진입");
	}
	
	@PostMapping("/signup")
	public String postSignup(MemberVO vo) throws Exception {
		logger.info("회원가입 기능");
		
		//비밀번호 암호화
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);
		
		String inputPass2 = vo.getUserPassRe();
		String pass2 = passEncoder.encode(inputPass2);
		vo.setUserPassRe(pass2);
		
		service.signup(vo);
		return "redirect:/";
	}
	
	@GetMapping("/signin")
	public void getSignin() throws Exception{
		logger.info("로그인 진입");
	}
	
	@PostMapping("/signin")
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post signin");
		MemberVO login = service.signin(vo);
		HttpSession session = req.getSession();
		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
		if(login != null && passMatch) {
			session.setAttribute("member", login);
		}else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",false);
			return "redirect:/member/signin";
		}
		return "redirect:/";
	}
	
	@GetMapping("/signout")
	public String signout(HttpSession session) throws Exception {
		logger.info("logout");
		service.signout(session);
		return "redirect:/";
	}
	
}
