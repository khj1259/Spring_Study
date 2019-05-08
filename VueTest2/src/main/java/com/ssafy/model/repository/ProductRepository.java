package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Product;

/** 인터페이스 */
public interface ProductRepository {
	public int insert(Product product);
	public List<Product> selectAll();
}
