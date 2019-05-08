package com.ssafy.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.User;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "mybatis.boardMapper."; // .까지 문자열로 준비

	@Override
	public List<Board> selectBoardList() {
		return session.selectList(namespace + "selectAll");
	}
	
	@Override
	public int insertBoard(Board board) {
		return session.insert(namespace + "insertboard",board);
	}
	@Override
	public int updateBoard(Board board) {
		return session.update(namespace + "updateboard",board);
	}
	@Override
	public int updateHitCount(int no) {
		return session.update(namespace + "updatehitcount", no);
	}
	@Override
	public int deleteBoard(int no) {
		return session.delete(namespace + "delete",no);
	}
	@Override
	public Board getBoard(int no) {
		return session.selectOne(namespace + "getboard",no);
	}

}
