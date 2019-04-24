package com.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * Mybatis : jdbc 를 사용하면서 불편한 점들을 개선해주는 프레임워크
 * 		jdbc 하면서 불편했던 점
 * 		커넥션 자원관리, 예외처리
 * 		파라미터 매핑 "select * from mydb where id=? and name=?"
 * 		결과값 매핑 ResultSet rs.next() 컬럼의 타입과 이름을 매핑
 * http://www.mybatis.org/mybatis-3/ko	  ->	공식 홈페이지 필요한 내용 참고
 * 
 * 설정파일을 읽어서 Mybatis 를 사용할 수 있도록 세션을 만들어주는 클래스
 * 홈페이지에서 코드 복붙
 * 싱글톤 디자인 패턴으로 만들어 보자
 */
public class MybatisConnectionFactory {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "com/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
}













