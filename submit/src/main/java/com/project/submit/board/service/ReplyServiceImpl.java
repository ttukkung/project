package com.project.submit.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.submit.board.DAO.ReplyDAO;
import com.project.submit.board.DTO.ReplyDTO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyDAO  replyDAO;
	@Autowired
	ReplyDTO replyDTO;
	
	@Override
	public List listReply(int id) throws Exception {
		List list = replyDAO.listReply(id);
		return list;
	}

	@Override
	public void insertReply(ReplyDTO replyDTO,int articleNO) throws Exception {
	
		replyDAO.insertReply(replyDTO,articleNO);
		
		
	}

	@Override
	public void deleteReply(int replyNO) throws Exception {
		
		replyDAO.deleteReply(replyNO);
		
	}

	
	
}
