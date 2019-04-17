package com.project.submit.member.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.submit.member.DTO.MemberDTO;
import com.project.submit.member.service.MemberService;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {

	@Autowired
	MemberService memberService;

	@Override
	@RequestMapping(value = "/member/listMembers.do")
	public ModelAndView listMembers() throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberList");

		List list = memberService.listMembers();

		mav.addObject("memberList", list);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/insertMembers")
	public ModelAndView insertMembers(@ModelAttribute("memberDTO") MemberDTO memberDTO, HttpServletRequest request,HttpServletResponse response)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		
		String idCheck =memberDTO.getId();
		String exist = memberService.idCheck(idCheck);
		System.out.println(exist);
		if (exist == null) {


			memberService.insertMembers(memberDTO);
			MemberDTO loginInfo = memberService.loginMembers(memberDTO);
			HttpSession session = request.getSession();
		
			session.setAttribute("loginSession", loginInfo);
			
			mav.setViewName("main");
			
		
           
			
		} else {

			mav.setViewName("/member/memberForm");
			mav.addObject("idCheck", "notExist");
			mav.addObject("memberDTO",memberDTO);
		}
		
		
		
		


		return mav;
	}

	@RequestMapping(value = "/member/memberForm")
	public ModelAndView memberForm() throws Exception {

		ModelAndView mav = new ModelAndView("/member/memberForm");

		return mav;
	}

	@RequestMapping(value = "/member/loginForm")
	public ModelAndView loginForm() throws Exception {

		ModelAndView mav = new ModelAndView("/member/loginForm");

		return mav;
	}

	@Override
	@RequestMapping("/member/loginMembers.do")
	public ModelAndView loginMembers(@ModelAttribute("memberDTO") MemberDTO memberDTO, HttpServletRequest request)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		String id = memberDTO.getId();
		String pwd = memberDTO.getPwd();
		System.out.println(id + pwd);
		MemberDTO loginInfo = memberService.loginMembers(memberDTO); // 여기서 해맸음 받아오는값은 두개여서 memberDTO로 했어야했는데
																		// int로하고앉았음,그리고 매핑에 resultType도 memberDTO로해야함
		System.out.println(loginInfo);
		if (loginInfo != null) {
			
			String loginId=memberDTO.getId();
			System.out.println("로그인 아이디"+loginId);
		
			
			HttpSession session = request.getSession();
			session.setAttribute("loginId", loginId);
			session.setAttribute("loginSession", loginInfo);
			mav.setViewName("main");

		} else {

			mav.addObject("result", "loginFail");
			mav.setViewName("/member/loginForm");

		}

		return mav;
	}

	@RequestMapping(value = "/member/logout.do")
	public String logout(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:/";
	}

	@Override
	@RequestMapping(value = "/member/modifyForm.do")
	public ModelAndView modifyForm(String id) throws Exception {

		ModelAndView mav = new ModelAndView();

		MemberDTO memberDTO = memberService.modifyForm(id);
		mav.addObject("modifyForm", memberDTO);
		mav.setViewName("/member/modifyForm");

		return mav;
	}

	@Override
	@RequestMapping(value = "/member/modifyMembers.do")
	public String modifyMembers(@ModelAttribute("memberDTO") MemberDTO memberDTO) throws Exception {

		String id = memberDTO.getId();
		String name = memberDTO.getName();

		System.out.println(id + name);
		memberService.modifyMembers(memberDTO);

		return "redirect:/";
	}

	@Override
	@RequestMapping(value = "/member/deleteMembers.do")
	public String deleteMembers(String id, HttpServletRequest request) throws Exception {
		memberService.deleteMembers(id);

		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:/";
	}

	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/member/idCheck.do") public ModelAndView
	 * idCheck(@RequestParam("id") String id) throws Exception {
	 * 
	 * ModelAndView mav = new ModelAndView(); String exist =
	 * memberService.idCheck(id); System.out.println(exist); if (exist == null) {
	 * 
	 * mav.setViewName("/member/memberForm"); mav.addObject("idCheck", " exist"); }
	 * else {
	 * 
	 * mav.setViewName("/member/memberForm"); mav.addObject("idCheck", " notExist");
	 * }
	 * 
	 * return mav; }
	 */

}
