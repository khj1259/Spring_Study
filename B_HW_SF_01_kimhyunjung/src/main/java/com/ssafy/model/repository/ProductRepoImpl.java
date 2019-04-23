package com.ssafy.model.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Product;

@Repository
public class ProductRepoImpl implements ProductRepo{
	
	@Override
	public List<Product> selectAll() {
		System.out.println("selectAll()");
		return null;
	}

	@Override
	public Product select(String id) {
		System.out.println("select :"+ id);
		return null;
	}

	@Override
	public int insert(Product product) {
		System.out.println("insert : "+product.toString());
		return 0;
	}

	@Override
	public int update(Product product) {
		System.out.println("update : "+product.toString());
		return 0;
	}

	@Override
	public int delete(String id) {
		System.out.println("delete : "+id);
		return 0;
	}

}
