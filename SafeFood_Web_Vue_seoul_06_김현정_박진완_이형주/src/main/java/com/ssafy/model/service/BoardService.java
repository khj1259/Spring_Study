package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.model.dto.Board;

public interface BoardService {

//
	int modifyBoard(Board board) throws SQLException;
//
	int deleteBoard(int no) throws SQLException;
//
//
	// 게시판 전체 리스트 조회
	public List<Board> selectBoardList();

	// 게시판 - 게시글 한개 조회(상세)
	Board getBoard(int no, String userId) throws SQLException;

	// 게시글 입력
	int writeBoard(Board board) throws SQLException;

	// 게시글 수정(본인이 쓴것만)
	// 게시글 삭제(본인이 쓴것만)

}