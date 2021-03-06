package com.project.submit.board.DAO;

import java.util.List;

import com.project.submit.board.DTO.ReplyDTO;

public interface ReplyDAO {

	public List listReply(int id) throws Exception;

	public void insertReply(ReplyDTO replyDTO,int articleNO) throws Exception;
	
	public void deleteReply(int replyNO) throws Exception;
	
}
