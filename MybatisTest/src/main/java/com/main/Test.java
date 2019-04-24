package com.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.PersonDAO;
import com.mybatis.MybatisConnectionFactory;
import com.vo.Person;

public class Test {
	public static void main(String[] args) {
		// 1. 세션 연결
		SqlSession sqlSession = MybatisConnectionFactory.getSqlSessionFactory().openSession(true);
														// true : 오토커밋, false : 수동커밋
		// 수동 커밋을 하려면, 1.config.xml 파일에서 <transactionManager type="JDBC" />
		//				2.openSession(false);로 했을 경우 수동커밋 된다. (둘중 하나라도 설정안하면 자동커밋된다)
		
		// 2. Mapper 연결 (인터페이스)
		PersonDAO personDAO = sqlSession.getMapper(PersonDAO.class);
		
		// 3. 쿼리 실행
		List<Person> plist = personDAO.selectAll();
		System.out.println("id\tname");
		System.out.println("==============");
		for (Person p : plist) {
			System.out.println(p.getId()+"\t"+p.getName());
		}
		
		// selectById
		Person p = personDAO.selectById(1);
		System.out.println("id\tname");
		System.out.println("==============");
		System.out.println(p.getId()+"\t"+p.getName());
		
		// insert
		Person p2 = new Person();
		p2.setName("손흥민3");// id는 autoIncrement 때문에 자동으로 값이 들어감
		personDAO.insert(p2);
		System.out.println("insert 후 id : "+p2.getId()); // 자동으로 만들어진 id값을 객체에 넣어서 리턴해줌
		
		// update
		p2.setId(4);
		p2.setName("류현진");
		personDAO.update(p2);
		
		// delete
		personDAO.delete(5);
		
		// selectByName
		plist = personDAO.selectByName("손흥민");
		System.out.println("id\tname");
		System.out.println("==============");
		for (Person p1 : plist) {
			System.out.println(p1.getId()+"\t"+p1.getName());
		}
		
		// 수동 커밋일 경우 : 트랜젝션 관리가능 : commit 저장/취소 rollback
//		sqlSession.rollback(); // 취소
//		sqlSession.commit(); // 저장
		
		// 4. 트랜젝션 처리
		
		
	}// end main
}//end class
