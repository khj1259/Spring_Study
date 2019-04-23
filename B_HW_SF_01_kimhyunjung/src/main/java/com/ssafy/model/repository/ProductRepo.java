package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Product;

public interface ProductRepo {
	
	List<Product> selectAll();
	
	Product select(String id);
	
	int insert(Product product);
	
	int update(Product product);
	
	int delete(String id);
}
