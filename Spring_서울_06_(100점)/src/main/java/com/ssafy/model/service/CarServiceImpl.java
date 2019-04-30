package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Car;
import com.ssafy.model.dto.User;
import com.ssafy.model.repository.ICarDAO;

@Service
public class CarServiceImpl implements ICarService {
	
	@Autowired
	private ICarDAO dao;

	@Override
	public List<Car> getCarList() {
		return dao.getCarList();
	}

	@Override
	public List<Car> getCodeList() {
		return dao.getCodeList();
	}

	@Override
	public void insertCar(Car car) {
		dao.insertCar(car);
	}

	@Override
	public Car getCarView(Car car) {
		return dao.getCarView(car);
	}

	@Override
	public void deleteCar(String[] num) {
		for(int i = 1; i<num.length; i++) {
			dao.deleteCar(num[i]);
		}
	}

	@Override
	public User selectUser(User user) {
		return dao.selectUser(user);
	}
	
	
	
	
}
