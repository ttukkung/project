package com.project.submit.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.submit.member.DTO.MemberDTO;

public interface MemberController {

	
	public ModelAndView listMembers() throws Exception;
	
	public ModelAndView insertMembers(@ModelAttribute("memberDTO") MemberDTO memberDTO,HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	public ModelAndView loginMembers(@ModelAttribute("memberDTO") MemberDTO memberDTO,HttpServletRequest request) throws Exception;
	
	public ModelAndView modifyForm(@RequestParam String id) throws Exception;
	
	public String modifyMembers(@ModelAttribute("memberDTO") MemberDTO memberDTO) throws Exception;
	
	public String deleteMembers(@RequestParam String id,HttpServletRequest request) throws Exception; 
	

}