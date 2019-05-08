package com.ssafy.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Product;

// 인터페이스를 구현한 클래스
@Repository
public class ProductRepositoryImpl implements ProductRepository {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "mybatis.productMapper."; // .까지 문자열로 준비
	
	// selectAll 을 부르려면 풀네임 mybatis.productMapper.selectAll 로 표현할 수 있다	
	public List<Product> selectAll() {
		return session.selectList(namespace+"selectAll");
	}
	
	public int insert(Product product) {
		return session.insert(namespace + "insert", product);
	}
}
// SqlSessionTemplate 를 주입받아서, 각함수에 적절한 쿼리문을 호출하도록 구현