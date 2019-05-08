package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Product;
import com.ssafy.model.service.ProductService;

/**
 * vue.js 화면에서 데이터(JSON 객체)만 요청해서 전달할 수 있는 컨트롤러
 */
@RestController
public class ProductJsonController {
	@Autowired
	private ProductService pService; // 데이터베이스에서 필요한 자료를 가지고 오기위한 서비스 객체
	
	/** vue.js 화면에서 요청을하면, 전체 목록 데이터를 만들어서 리턴할 메서드 */
	@RequestMapping("products")
	public List<Product> list() {
		return pService.getProductList(); // 객체를 리턴 -> JSON으로 바ㅏ꿔서 전달
	}
	
	/** vue.js 화면에서 form 태그로 입력받은 데이터를 json으로 보냄 -> 객체로 받아서 insert 하기, 결과를 리턴 */
	@RequestMapping("add.json")
	public Map<String, Object> add(@RequestBody Product product) { // json 객체로 변경해주세요
		System.out.println("폼에서 받아온 데이터 : "+ product);
		int row = pService.addProduct(product); // insert해서 영향을 받은 행의 개수 1 리턴
		System.out.println("영향받은 행의 개수 : " + row);
		HashMap<String , Object> result = new HashMap<>();
		result.put("result", row == 1? true : false); 
		return result; //result(키) true/false(값) 형태의 json으로 넘겨줌
	}
}
