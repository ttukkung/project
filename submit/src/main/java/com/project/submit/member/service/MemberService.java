package com.project.submit.member.service;

import java.util.List;

import com.project.submit.member.DTO.MemberDTO;



public interface MemberService {

	public List listMembers() throws Exception;
	
	public void insertMembers(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO loginMembers(MemberDTO memberDTO) throws Exception;  //당연히 받아노는값이 여러개니 public 옆에 MemberDTO를 적어야함
	
	public MemberDTO modifyForm(String id) throws Exception;
	
	public void modifyMembers(MemberDTO memberDTO) throws Exception;
	
	public void deleteMembers(String id) throws Exception;
	
    public String idCheck(String id) throws Exception;
}
