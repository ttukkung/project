package com.project.submit.board.DAO;

import java.util.List;
import java.util.Map;

import com.project.submit.board.DTO.BoardDTO;

public interface BoardDAO {

	public List listBoard(String option,String keyword,  int PageNum,int contentNum,String listOption
			) throws Exception;
	
	public int insertBoard(Map boardMap) throws Exception;
	
	public BoardDTO viewBoard(String articleNO) throws Exception;
	
	public void deleteBoard(String articleNO) throws Exception;
	
	public void modifyBoard(Map boardMap) throws Exception;
	
	 public int totalCount(String option,String keyword) throws Exception; 
	
	 public void recommendation(int articleNO) throws Exception;
}
