package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Car;
import com.ssafy.model.dto.User;

public interface ICarDAO {
	
	public List<Car> getCarList();
	public List<Car> getCodeList();
	
	public void insertCar(Car car);
	public Car getCarView(Car car);
	public void deleteCar(String num);
	public User selectUser(User user);
	
}
