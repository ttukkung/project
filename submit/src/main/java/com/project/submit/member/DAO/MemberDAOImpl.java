package com.project.submit.member.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.submit.member.DTO.MemberDTO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List listMembers() throws Exception {
		List<MemberDTO> list = sqlSession.selectList("listMembers");

		return list;
	}

	@Override
	public void insertMembers(MemberDTO memberDTO) throws Exception {

		sqlSession.insert("insertMembers", memberDTO);

	}

	@Override
	public MemberDTO loginMembers(MemberDTO memberDTO) throws Exception {
		MemberDTO login = sqlSession.selectOne("loginMembers", memberDTO);
		return login;
	}

	@Override
	public MemberDTO modifyForm(String id) throws Exception {
		MemberDTO memberDTO = sqlSession.selectOne("modifyForm", id);
		return memberDTO;
	}

	@Override
	public void modifyMembers(MemberDTO memberDTO) throws Exception {

		sqlSession.update("modifyMembers", memberDTO);

	}

	@Override
	public void deleteMembers(String id) throws Exception {
		sqlSession.delete("deleteMembers", id);

	}

	@Override
	public String idCheck(String id) throws Exception {
		String exist = sqlSession.selectOne("idCheck", id);
		return exist;

	}

}
