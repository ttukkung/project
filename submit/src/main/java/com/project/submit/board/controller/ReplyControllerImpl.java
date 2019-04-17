package com.project.submit.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.submit.board.DTO.BoardDTO;
import com.project.submit.board.DTO.ReplyDTO;
import com.project.submit.board.service.ReplyService;

@Controller("replyController")
public class ReplyControllerImpl implements ReplyController {

	@Autowired
	ReplyService replyService;
	@Autowired
	ReplyDTO replyDTO;
	@Autowired
	BoardDTO boardDTO;

	@Override
	@RequestMapping(value = "/reply/listReply.do")

	public ModelAndView listReply(@RequestParam("id") String id,@RequestParam("articleNO") int articleNO) throws Exception {
		ModelAndView mav = new ModelAndView();
		List list = replyService.listReply(articleNO);

		mav.addObject("listReply", list);
		mav.addObject("articleNO", articleNO);
		mav.addObject("checkid", id);
		mav.setViewName("/reply/replyList");

		return mav;
	}

	@Override
	@RequestMapping(value = "/reply/insertReplyer")
	
	public String insertReply(@RequestParam("articleNO") int articleNO, @ModelAttribute("replyDTO") ReplyDTO replyDTO)
			throws Exception {

		replyService.insertReply(replyDTO, articleNO);
		int secret=replyDTO.getSecret();
		System.out.println("시크릿"+secret);
	return "redirect:/board/viewBoard.do?articleNO=" + articleNO;
		// return "redirect:/board/listBoard.do";
	}

	@Override
	@RequestMapping(value = "/reply/deleteReply.do")
	public String deleteReply(@RequestParam("replyNO") int replyNO, @RequestParam("articleNO") int articleNO)
			throws Exception {

		replyService.deleteReply(replyNO);
		System.out.println(articleNO);

		return "redirect:/board/viewBoard.do?articleNO=" + articleNO;

	}

}
