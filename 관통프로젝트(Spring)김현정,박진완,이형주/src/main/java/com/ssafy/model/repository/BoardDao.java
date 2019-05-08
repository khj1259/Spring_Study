package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Board;

public interface BoardDao {
	// 게시판 전체 리스트 조회
	public List<Board> selectBoardList();
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int updateHitCount(int no);
	public int deleteBoard(int no);
	public Board getBoard(int no);
}
