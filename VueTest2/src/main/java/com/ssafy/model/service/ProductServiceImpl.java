package com.ssafy.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Product;
import com.ssafy.model.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductRepository productRepo;
	
	// 로그 찍을 객체
	static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class); // import org.slf4j.Logger;
	
	public List<Product> getProductList() {
		logger.debug("getProductList 호출"); // logger 에는 레벨과 출력 방법을 지정 할수있다.
		return productRepo.selectAll();
	}
	public int addProduct(Product product) {
		logger.debug("addProduct 호출");
		return productRepo.insert(product);
	}
}
// 작성 완료후 구현한 레파지토리 객체와 서비스객체를 컨테이너에 빈으로 등록하기 (컨트롤러에 작업)

