package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Car;
import com.ssafy.model.dto.User;

public interface ICarService {

	
	public List<Car> getCarList();
	
	public List<Car> getCodeList();
	public void insertCar(Car car);
	
	public Car getCarView(Car car);
	public void deleteCar(String[] num);
	
	public User selectUser(User user);
	
}
