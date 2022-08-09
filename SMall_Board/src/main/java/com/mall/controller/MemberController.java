package com.mall.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mall.domain.MemberVO;
import com.mall.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {

	@Inject
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// 회원가입_get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
		log.info("get signup");
	}
	
	// 회원가입_post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
		log.info("post signup");
		
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);
		service.signup(vo);
		
		return "redirect:/";
	}
	
	// 로그인_get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {		
		log.info("get signin");
	}
	
	// 로그인_post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		log.info("post signin");
		
		MemberVO login = service.signin(vo);
		HttpSession session = req.getSession();
		
		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
		
		if(login != null && passMatch) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin";
		}
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		log.info("LogOut");
		
		service.signout(session);
		
		return "redirect:/";
	}
	
}
