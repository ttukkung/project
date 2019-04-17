package com.project.submit.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.submit.board.DAO.BoardDAO;
import com.project.submit.board.DTO.BoardDTO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	BoardDTO boardDTO;
	
	@Override
	public List listBoard(String option,String keyword,int PageNum,int contentNum,String listOption
			) throws Exception {
		List list = boardDAO.listBoard(option,keyword,PageNum,contentNum,listOption);
		return list;
	}
	
	
	 @Override public int totalCount(String option,String keyword) throws Exception {
		  
		  int totalCount = boardDAO.totalCount(option,keyword); return totalCount; }
		 

	@Override
	public int insertBoard(Map boardMap) throws Exception {
		
		int articleNO = boardDAO.insertBoard(boardMap);
		
		return articleNO;
	}

	@Override
	public BoardDTO viewBoard(String articleNO) throws Exception {

		boardDTO = boardDAO.viewBoard(articleNO);
		
		return boardDTO;
	}

	@Override
	public void deleteBoard(String articleNO) throws Exception {

		boardDAO.deleteBoard(articleNO);
		
	}

	@Override
	public void modifyBoard(Map boardMap) throws Exception {
		
		boardDAO.modifyBoard(boardMap);
		
	}


	@Override
	public void recommendation(int articleNO) throws Exception {
		
		boardDAO.recommendation(articleNO);
		
	}

	
	 
	
	
}
