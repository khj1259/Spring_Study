package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Board;
import com.ssafy.model.repository.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Board> selectBoardList() {
		return boardDao.selectBoardList();
	}

//	public void setBoardDAO(BoardDao boardDAO) {
//		this.boardDao = boardDAO;
//	}
//	
	@Override
	public int writeBoard (Board board) throws SQLException {
		return boardDao.insertBoard(board);
	}
	@Override
	public int modifyBoard (Board board) throws SQLException {
		return boardDao.updateBoard(board);
	}
	@Override
	public int deleteBoard (int no) throws SQLException {
		return boardDao.deleteBoard(no);
	}
//	@Override
//	public List<Board> getBoardList() throws SQLException{
//		return boardDao.getBoardList();
//	}
	@Override
	public Board getBoard(int no,String userId) throws SQLException {
		Board board=boardDao.getBoard(no);
		if(!board.getId().equals(userId)) {
			boardDao.updateHitCount(no); 
			board.setCnt(board.getCnt()+1); 
		}
		return board;
	}
	
	
	
	
}