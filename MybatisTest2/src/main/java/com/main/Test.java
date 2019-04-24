package com.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.CarDAO;
import com.mybatis.MybatisConnectionFactory;
import com.vo.Car;

public class Test {
	public static void main(String[] args) {
		// 1. 세션 연결
		SqlSession sqlSession = MybatisConnectionFactory.getSqlSessionFactory().openSession(true);

		// 2. Mapper 연결 (인터페이스)
		CarDAO carDAO = sqlSession.getMapper(CarDAO.class);

		// 3. 쿼리 실행
		
		// insert
		Car car = new Car(0, "morning", "기아", 3000000);
		int result = carDAO.insert(car);
		System.out.println("insert결과 :"+result);
		
		// update
		result = carDAO.update(new Car(2, "new 아반떼", "현대", 10000000));
		System.out.println("update결과:"+result);
		
		// delete
		result = carDAO.delete(1);
		System.out.println("delete결과:"+result);
		
		
		// selectAll
		List<Car> clist = carDAO.selectAll();
		System.out.println("<selectAll>");
		for (Car c : clist) {
			System.out.println(c);
		}
		
		// selectById
		System.out.println("<id=3 검색>");
		System.out.println(carDAO.selectById(3));
		
		// selectByName
		clist = carDAO.selectByName("car");
		System.out.println("<name으로 검색 (car포함)>");
		for (Car c : clist) {
			System.out.println(c);
		}
		
		// selectByPrice
		clist = carDAO.selectByPrice(3000000);
		System.out.println("<price로 검색 (300만원이상)>");
		for (Car c : clist) {
			System.out.println(c);
		}
	}
}
