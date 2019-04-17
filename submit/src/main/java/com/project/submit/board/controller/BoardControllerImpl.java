package com.project.submit.board.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.submit.board.DTO.BoardDTO;
import com.project.submit.board.common.PageMaker;
import com.project.submit.board.service.BoardService;
import com.project.submit.member.DTO.MemberDTO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {

	private static final String fileAddress = "C:\\board\\article_image";

	@Autowired
	BoardService boardService;

	@Autowired
	BoardDTO boardDTO;

	@Autowired
	PageMaker pageMaker;

	
	public int totalCount(String option, String keyword) throws Exception {
		int totalCount = boardService.totalCount(option, keyword);
		return totalCount;
	}
	

	@Override
	@RequestMapping(value = "/board/listBoard.do")
	public ModelAndView listBoard(@RequestParam(defaultValue = "all") String option,
			@RequestParam(defaultValue = "") String keyword, @RequestParam("pageNum") int pageNum,
			@RequestParam(defaultValue = "15") int contentNum) throws Exception {

		ModelAndView mav = new ModelAndView();

		int totalCount = totalCount(option, keyword);
		System.out.println(totalCount);

		pageMaker.setTotalCount(totalCount);
		pageMaker.setPageNum(pageNum);
		pageMaker.setContentNum(contentNum);
		pageMaker.setCurrentBlock(pageNum);
		pageMaker.setLastBlock(pageMaker.getTotalCount());
		pageMaker.prevNext(pageNum);
		pageMaker.setStartPage(pageMaker.getCurrentBlock());
		pageMaker.setEndPage(pageMaker.getLastBlock(), pageMaker.getCurrentBlock());
		
		
		List recommendationList = boardService.listBoard(option, keyword, pageNum, contentNum,"recommendation");
		List hitList = boardService.listBoard(option, keyword, pageNum, contentNum,"hit");
		List Alllist = boardService.listBoard(option, keyword, pageNum, contentNum,"All");

		mav.setViewName("/board/boardList");
		mav.addObject("option", option);
		mav.addObject("keyword", keyword);
		mav.addObject("Alllist", Alllist);
		mav.addObject("hitList", hitList);
		mav.addObject("recommendationList", recommendationList);
		mav.addObject("page", pageMaker);
		return mav;
	}
	

	@Override
	@RequestMapping(value = "/board/insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(MultipartHttpServletRequest mpsl) throws Exception {
		mpsl.setCharacterEncoding("utf-8");
		Map<String, Object> boardMap = new HashMap<String, Object>();

		Enumeration enu = mpsl.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = mpsl.getParameter(name);
			boardMap.put(name, value);
		}

		String imageFileName = upload(mpsl);

		boardMap.put("imageFileName", imageFileName);

		int articleNO = boardService.insertBoard(boardMap);
		if (imageFileName != null && imageFileName.length() != 0) {
			File srcFile = new File(fileAddress + "\\" + "temp" + "\\" + imageFileName);
			File destDir = new File(fileAddress + "\\" + articleNO);
			FileUtils.moveFileToDirectory(srcFile, destDir, true);
		}

		return "redirect:/board/listBoard.do?pageNum=1";
	}
	
	

	public String upload(MultipartHttpServletRequest mpsl) throws Exception {

		String imageFileName = null;
		Iterator<String> filenames = mpsl.getFileNames();

		while (filenames.hasNext()) {
			String filename = filenames.next();
			MultipartFile mfile = mpsl.getFile(filename);
			imageFileName = mfile.getOriginalFilename();

			if (mfile.getSize() != 0) {

				mfile.transferTo(new File(fileAddress + "\\" + "temp" + "\\" + imageFileName));

			}

		}

		return imageFileName;
	}
	
	

	@RequestMapping(value = "/board/boardForm.do")
	public ModelAndView boardForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberDTO logon = (MemberDTO) session.getAttribute("loginSession");

		if (logon != null) {

			mav.setViewName("/board/boardForm");

		} else {

			mav.setViewName("/member/loginForm");

		}
		return mav;
	}
	
	

	@RequestMapping(value = "/board/modifyBoardForm.do")
	public ModelAndView modifyBoardForm(@RequestParam("originFileName") String originFileName,
			@ModelAttribute("boardDTO") BoardDTO boardDTO) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/board/modifyBoardForm");
		mav.addObject("list", boardDTO);
		mav.addObject("originFileName", originFileName);
		return mav;
	}
	
	

	@Override
	@RequestMapping(value = "/board/viewBoard.do")
	public ModelAndView viewBoard(String articleNO) throws Exception {

		ModelAndView mav = new ModelAndView();

		boardDTO = boardService.viewBoard(articleNO);

		mav.addObject("boardView", boardDTO);

		mav.setViewName("/board/boardView");

		return mav;
	}
	
	

	@Override
	@RequestMapping(value = "/board/deleteBoard.do")
	public String deleteBoard(String articleNO) throws Exception {

		boardService.deleteBoard(articleNO);

		return "redirect:/board/listBoard.do?pageNum=1";
	}
	
		

	@Override
	@RequestMapping(value = "/board/modifyBoard.do", method = RequestMethod.POST)
	public String modifyBoard(MultipartHttpServletRequest mpsl) throws Exception {
		mpsl.setCharacterEncoding("utf-8");
		Map<String, Object> boardMap = new HashMap<String, Object>();
		String imageFileName = upload(mpsl);
		boardMap.put("imageFileName", imageFileName);
		Enumeration enu = mpsl.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = mpsl.getParameter(name);
			boardMap.put(name, value);
			System.out.println(name + value);
		}

		String articleNO = (String) boardMap.get("articleNO");

		boardService.modifyBoard(boardMap);

		if (imageFileName != null && imageFileName.length() != 0) {

			File srcFile = new File(fileAddress + "\\" + "temp" + "\\" + imageFileName);
			File destDir = new File(fileAddress + "\\" + articleNO);
			FileUtils.moveFileToDirectory(srcFile, destDir, true);

			String originFileName = (String) boardMap.get("originFileName");
			File oldFile = new File(fileAddress + "\\" + articleNO + "\\" + originFileName);
			oldFile.delete();

		}

		System.out.println("이미지파일네임" + imageFileName);
		System.out.println("아티클넘" + articleNO);

		return "redirect:/board/listBoard.do?pageNum=1";
	}


	@Override
	@RequestMapping(value = "/board/recommendation.do")
	public String recommendation(int articleNO) throws Exception {
		boardService.recommendation(articleNO);
		
		return "redirect:/board/viewBoard.do?articleNO="+articleNO;
	}
	
	
	

}
