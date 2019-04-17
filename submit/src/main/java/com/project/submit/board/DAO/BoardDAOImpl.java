package com.project.submit.board.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.submit.board.DTO.BoardDTO;
import com.project.submit.member.DTO.MemberDTO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	BoardDTO boardDTO;

	@Override
	public List listBoard(String option, String keyword,  int PageNum,int contentNum,String listOption
			) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("option", option);
		map.put("keyword", keyword);
		map.put("pageNum", PageNum);
		map.put("contentNum", contentNum);
		map.put("listOption", listOption);
	
		List<BoardDTO> list = sqlSession.selectList("listBoard", map);

		return list;
	}

	public int totalCount(String option,String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("keyword", keyword);
		int totalCount = sqlSession.selectOne("pagingCount",map);

		return totalCount;
	}

	@Override
	public int insertBoard(Map boardMap) throws Exception {
		int articleNO = newBoardNO();
		boardMap.put("articleNO", articleNO);
		sqlSession.insert("insertBoard", boardMap);
	
	
		return articleNO;
	}

	public int newBoardNO() {

		int boardNO = sqlSession.selectOne("newArticleNO");

		return boardNO;
	}

	@Override
	public BoardDTO viewBoard(String articleNO) throws Exception {
		
		sqlSession.insert("upHit",articleNO);
		boardDTO = sqlSession.selectOne("viewBoard", articleNO);

		return boardDTO;
	}

	@Override
	public void deleteBoard(String articleNO) throws Exception {
		sqlSession.delete("deleteBoard", articleNO);

	}

	@Override
	public void modifyBoard(Map boardMap) throws Exception {
		sqlSession.update("modifyBoard", boardMap);

	}

	@Override
	public void recommendation(int articleNO) throws Exception {
		sqlSession.insert("recommendation",articleNO);
		sqlSession.insert("downHit",articleNO);
		
	}
	
	

}
