package com.project.submit.member.DAO;

import java.util.List;

import com.project.submit.member.DTO.MemberDTO;

public interface MemberDAO {

	public List listMembers() throws Exception;
	
	public void insertMembers(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO loginMembers(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO modifyForm(String id) throws Exception;
	
	public void modifyMembers(MemberDTO memberDTO) throws Exception;
	
	public void deleteMembers(String id) throws	Exception;
	
	public String idCheck(String id) throws Exception;
}
