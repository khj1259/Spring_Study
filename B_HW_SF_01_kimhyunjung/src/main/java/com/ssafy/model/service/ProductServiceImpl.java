package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Product;
import com.ssafy.model.repository.ProductRepo;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductRepo repo;

	@Override
	public ProductRepo getRepo() {
		return repo;
	}

	@Override
	public List<Product> selectAll() {
		return repo.selectAll();
	}

	@Override
	public Product select(String id) {
		return repo.select(id);
	}

	@Override
	public int insert(Product product) {
		return repo.insert(product);
	}

	@Override
	public int update(Product product) {
		return repo.update(product);
	}

	@Override
	public int delete(String id) {
		return repo.delete(id);
	}
}
