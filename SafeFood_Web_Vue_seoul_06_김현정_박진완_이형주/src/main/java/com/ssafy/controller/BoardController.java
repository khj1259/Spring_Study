package com.ssafy.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.User;
import com.ssafy.model.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	@RequestMapping("boardList.mvc")
	public String list() {
		return "boardList";
	}
	
	@RequestMapping("boardDetail.mvc")
	public String detail(int bnum, Model model, HttpServletRequest req) throws SQLException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println(bnum+","+user.getId());
		model.addAttribute("board", bService.getBoard(bnum, user.getId()));
		return "boardDetail";
	}
	
	@RequestMapping(value="boardWrite.mvc", method=RequestMethod.GET)
	public String writeForm() {
		return "boardWriteForm";
	}
	
	@RequestMapping(value="boardWrite.mvc", method=RequestMethod.POST)
	public String write(Board board) throws SQLException {
		bService.writeBoard(board);
		return "redirect:boardList.mvc";
	}
	@RequestMapping(value="boardDelete.mvc")
	public String delete(int bnum) throws SQLException {
		bService.deleteBoard(bnum);
		return "redirect:boardList.mvc";
	}
	
	@RequestMapping(value="boardModify.mvc")
	public String modify(Board board) throws SQLException {
		bService.modifyBoard(board);
		return "redirect:boardList.mvc";
	}
	//제목, 작성자
    @RequestMapping("search_boardresult.mvc")
   public String search_result(String search_opt, String searchBoardValue, Model model) {
        if(search_opt.equals("title")) {
            model.addAttribute("boardlist", bService.searchByTitle(searchBoardValue));
        }else if(search_opt.equals("author")) {
            model.addAttribute("boardlist", bService.searchByAuthor(searchBoardValue));
        }
       return "boardsearch_result";
   }
}
