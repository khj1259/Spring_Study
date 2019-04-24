package com.dao;

import java.util.List;

import com.vo.Car;

public interface CarDAO {

	List<Car> selectAll();
	Car selectById(int id);
	List<Car> selectByName(String name);
	List<Car> selectByPrice(int price);
	int insert(Car car);
	int update(Car car);
	int delete(int id);

}
