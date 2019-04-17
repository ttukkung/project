package com.project.submit.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.submit.member.DAO.MemberDAO;
import com.project.submit.member.DTO.MemberDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;

	@Override
	public List listMembers() throws Exception {

		List list = memberDAO.listMembers();

		return list;
	}

	@Override
	public void insertMembers(MemberDTO memberDTO) throws Exception {

		memberDAO.insertMembers(memberDTO);

	}

	@Override
	public MemberDTO loginMembers(MemberDTO memberDTO) throws Exception {
		MemberDTO loginInfo = memberDAO.loginMembers(memberDTO);
		return loginInfo;
	}

	@Override
	public MemberDTO modifyForm(String id) throws Exception {

		MemberDTO memberDTO = memberDAO.modifyForm(id);
		return memberDTO;
	}

	@Override
	public void modifyMembers(MemberDTO memberDTO) throws Exception {

		memberDAO.modifyMembers(memberDTO);

	}

	@Override
	public void deleteMembers(String id) throws Exception {

		memberDAO.deleteMembers(id);

	}

	@Override
	public String idCheck(String id) throws Exception {
		String exist = memberDAO.idCheck(id);
		return exist;
	}

}
