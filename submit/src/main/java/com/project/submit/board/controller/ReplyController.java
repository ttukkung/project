package com.project.submit.board.controller;



import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.submit.board.DTO.ReplyDTO;

public interface ReplyController {

	public ModelAndView  listReply (@RequestParam("id") String id,@RequestParam("articleNO") int articelNO) throws Exception;
	
	public String insertReply(@RequestParam("articleNO")int articleNO ,@ModelAttribute("replyDTO")ReplyDTO replyDTO) throws Exception;
	
	public String deleteReply(@RequestParam("replyNO") int replyNO,@RequestParam("articleNO") int articleNO) throws Exception;
	
	
}
