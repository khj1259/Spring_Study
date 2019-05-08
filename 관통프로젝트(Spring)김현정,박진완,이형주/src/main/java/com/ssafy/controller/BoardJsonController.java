package com.ssafy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Board;
import com.ssafy.model.service.BoardService;
import com.ssafy.model.service.FoodService;

@RestController
public class BoardJsonController {
	@Autowired
	private BoardService bService;
	
	@RequestMapping("boardList")
	public List<Board> list() {
		return bService.selectBoardList(); // 객체를 리턴 -> JSON으로 바ㅏ꿔서 전달
	}
}
