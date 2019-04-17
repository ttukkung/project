package com.project.submit.board.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.submit.board.DTO.ReplyDTO;

@Repository("replyDAO")
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	ReplyDTO replyDTO;
	
	@Override
	public List listReply(int id) throws Exception {
		List<ReplyDTO> list = sqlSession.selectList("listReply",id);
		return list;
	}

	@Override
	public void insertReply(ReplyDTO replyDTO,int articleNO) throws Exception {
		
		sqlSession.insert("downHit",articleNO);
		sqlSession.insert("insertReply",replyDTO);
		
	}

	@Override
	public void deleteReply(int replyNO) throws Exception {
		
		sqlSession.delete("deleteReply",replyNO);
		
	}

	
	
}
