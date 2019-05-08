package com.ssafy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.model.dto.Product;
import com.ssafy.model.service.ProductService;

@Controller		// 앞에 @Controller 붙인 클래스는 디스페처가 받은 요청을 처리할 페이지를 결정해주는 클래스
public class ProductController {
	@Autowired
	private ProductService pService;
	// 서버가 구현해야될 요청
	// list.do		상품 전체목록을 보여달라는 요청
	// addForm.do	상품을 등록할 페이지 요청
	// add.do		상품을 추가해달라는 요청
	
	@RequestMapping("list.do") // 매핑하는 방법도 여러가지가 있지만 쉬운방법 1가지로 통일함
	public String list(Model model) {
//		model.addAttribute("list", pService.getProductList());
		return "list";
	}
	
	@RequestMapping("addForm.do")
	public String addForm() {
		return "addForm";
	}
	@RequestMapping("add.do")
	public String add(Product product) { // 필요한 파라미터가 있는 경우 나열만하면, 알아서 값을 넣어줌 
		//pService.addProduct(product); // 정보를 입력후에 입력결과를 보기위해 목록을 보여주면 좋겠다 그래서 아래
		return "redirect:list.do"; // 리다이렉트 list.do 로
	}
}
