package com.ssafy.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Car;
import com.ssafy.model.dto.User;

@Repository
public class CarDAOImpl implements ICarDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String namespace = "mybatis.carMapper.";
	
	@Override
	public List<Car> getCarList() {
		return sqlSession.selectList(namespace+"getCarList");
	}

	@Override
	public List<Car> getCodeList() {
		return sqlSession.selectList(namespace+"getCodeList");
	}

	@Override
	public void insertCar(Car car) {
		sqlSession.insert(namespace+"insertCar", car);
	}

	@Override
	public Car getCarView(Car car) {
		return sqlSession.selectOne(namespace+"getCarView", car);
	}

	@Override
	public void deleteCar(String num) {
		sqlSession.delete(namespace+"deleteCar", num);
	}
	
	@Override
	public User selectUser(User user) {
		return sqlSession.selectOne(namespace+"selectUser", user);
	}
	
	
}
