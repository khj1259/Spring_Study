package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Product;
import com.ssafy.model.repository.ProductRepo;

public interface ProductService {
	
	ProductRepo getRepo();
	
	List<Product> selectAll();
	
	Product select(String id);
	
	int insert(Product product);
	
	int update(Product product);
	
	int delete(String id);
}
