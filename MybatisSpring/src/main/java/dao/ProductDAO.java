package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Product;

/**
 * 세션의 객체는 우리가 만들지 않음, 스프링이 알아서 채워줌
 * 데이터베이스와 연동하는 작업만
 */
@Component
public class ProductDAO {
	@Autowired // 일치하는 타입을 찾아서 객체를 담아준다
	private SqlSessionFactory sessionFactory;
	
	/** 테이블에서 code 값을 기준으로 데이터를 조회하는 메서드 */
	public Product selectOne(int code) {
		SqlSession session = null;
		try {
			// sql 작업을 위해서 세션을 얻어와야함, 세션은 작업후에 바로 닫아줌
			session = sessionFactory.openSession(); //default : false
			Product p = session.selectOne("dao.mapper.productMapper.selectOne", code);
			return p;
		} finally {
			session.close(); // 세션은 한번 쿼리하고 얼른 닫는다
		}
	}
	/** 테이블 전체 조회 */
	public List<Product> selectAll() {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession(); 
			List<Product> list = session.selectList("dao.mapper.productMapper.selectAll");
			return list;
		} finally {
			session.close(); 
		}
	}
	/** 상품 추가 */
	public int insert(Product p) {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession(); 
			int result = session.insert("dao.mapper.productMapper.insert", p);
			return result;
		} finally {
			session.close(); 
		}
	}
	/** 상품정보 수정 */
	public int update(Product p) {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession(); 
			int result = session.update("dao.mapper.productMapper.update", p);
			return result;
		} finally {
			session.close(); 
		}
	}
	/** 상품 삭제 */
	public int delete(int code) {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession(); 
			int result = session.delete("dao.mapper.productMapper.delete", code);
			return result;
		} finally {
			session.close(); 
		}
	}
}
