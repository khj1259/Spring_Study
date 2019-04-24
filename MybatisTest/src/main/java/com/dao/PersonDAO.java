package com.dao;

import java.util.List;

import com.vo.Person;

/**
 * PersonMapper 에 있는 쿼리 정보와 1:1 매칭하는 짝꿍 클래스 
 */
public interface PersonDAO {
	public List<Person> selectAll(); // 전체 조회
	public Person selectById(int id); // id로 조회
	public List<Person> selectByName(String name); // 이름으로 조회
	public int insert(Person person); // 삽입
	public int update(Person person); // 업데이트
	public void delete(int id); // 삭제
}
