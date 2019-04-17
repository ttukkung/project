package com.project.submit.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.submit.board.DTO.BoardDTO;

public interface BoardController {

	public ModelAndView listBoard(@RequestParam(defaultValue = "all") String option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam("pageNum") int pageNum, @RequestParam(defaultValue = "15") int contentNum) throws Exception;

	public String insertBoard(MultipartHttpServletRequest mpsl) throws Exception;

	public ModelAndView viewBoard(String articleNO) throws Exception;

	public String deleteBoard(String articleNO) throws Exception;

	public String modifyBoard(MultipartHttpServletRequest mpsl) throws Exception;
	
	public String recommendation(@RequestParam("articleNO") int articleNO) throws Exception;

}
