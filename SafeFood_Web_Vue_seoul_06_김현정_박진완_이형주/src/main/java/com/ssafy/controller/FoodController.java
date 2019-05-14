package com.ssafy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.model.dto.EatFood;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.MyEatFood;
import com.ssafy.model.dto.User;
import com.ssafy.model.dto.UserPrivateInfo;
import com.ssafy.model.dto.WishList;
import com.ssafy.model.service.FoodService;

@Controller		// 앞에 @Controller 붙인 클래스는 디스페처가 받은 요청을 처리할 페이지를 결정해주는 클래스
public class FoodController {
	@Autowired
	private FoodService fService;
	
	//메인화면
	@RequestMapping("main.mvc")
	public String home() {
		return "main";
	}
	
	//푸드 전체 리스트 화면
	@RequestMapping("foodlist.mvc")
	public String foodlist(Model model) {
		model.addAttribute("list", fService.searchAll());
		return "foodlist";
	}
	
	//푸드 상세페이지 - 로그인 돼있을때 설정 추가해야함
	@RequestMapping("searchFood.mvc")
	public String searchFood(String code, Model model, HttpServletRequest req) {
		Food food = fService.search(Integer.parseInt(code));
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) { // 로그인 된 상태이면 식품에 포함된 알러지 경고
			String foodAllergy = food.getAllergy();
			String userAllergy = user.getAllergy();
			String[] fa = foodAllergy.split(" ");
			String[] ua = userAllergy.split(",");
			//내 알러지 성분과 선택한 푸드의 알러지 성분을 비교하며 일치하면 리스트에 추가
			List<String> contains = new ArrayList<>();
			for (String userall : ua) {
				for (String foodall : fa) {
					if(userall.equals(foodall)) {
						contains.add(foodall);
					}
				}
			}
			model.addAttribute("contains", contains);
		}

		model.addAttribute("food", food);
		return "product_info";
	}
	
	//이름, 제조사, 원재료로 식품 검색
	@RequestMapping("search_result.mvc")
    public String search_result(String search_opt, String searchValue, Model model) {
		if(search_opt.equals("name")) {
			model.addAttribute("list", fService.searchByName(searchValue));
		}else if(search_opt.equals("maker")) {
			model.addAttribute("list", fService.searchByMaker(searchValue));
		}else { // material
			model.addAttribute("list", fService.searchByMaterial(searchValue));
		}
        return "search_result";
    }
	
	//섭취식품 추가 - ajax 통신
	@ResponseBody //ajax success()를 위해 설정
	@RequestMapping(value="eatFoodAdd.mvc", method=RequestMethod.POST)
    public void eatFoodAdd(EatFood eatFood, HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) { // 로그인 된 상태이면 추가
			String id = user.getId();
			eatFood.setId(id);
			int result = fService.insertEatFood(eatFood);
			if(result != 1) { 
				System.out.println("섭취식품 추가 실패");
			}
		}
    }
    
//	//내 섭취식품 리스트 조회
//    @RequestMapping("eatFoodList.mvc")
//    public String eatFoodList(HttpServletRequest req, Model model) {
//    	HttpSession session = req.getSession();
//		User user = (User) session.getAttribute("user");
//		String id = user.getId();
//		List<MyEatFood> list = fService.selectAllEatFood(id);
//		model.addAttribute("list", list);
//        return "eatFoodList";
//    }
    
    //내 섭취식품 삭제 - ajax
    @ResponseBody //ajax success()를 위해 설정
    @RequestMapping(value="eatFoodDelete.mvc", method=RequestMethod.POST)
    public void eatFoodDelete(int eatfoodcode) {
		int result = fService.deleteEatFood(eatfoodcode);
		if(result == 0) {
			System.out.println("섭취식품 삭제 실패");
		}
    }
    
    //내 섭취식품 수정(수량) - ajax
    @ResponseBody // ajax success()를 위해 설정
    @RequestMapping(value="eatFoodUpdate.mvc", method=RequestMethod.POST)
    public void eatFoodUpdate(EatFood eatFood) {
		int result = fService.updateEatFood(eatFood);
		if(result == 0) {
			System.out.println("섭취식품 수정 실패");
		}
    }
    
    //식품 찜하기(추가) - ajax 통신
    @ResponseBody //ajax success()를 위해 설정
    @RequestMapping(value="wishListAdd.mvc", method=RequestMethod.POST)
    public void wishListAdd(WishList wishList, HttpServletRequest req) {
    	HttpSession session = req.getSession();
    	User user = (User) session.getAttribute("user");
    	if (user != null) { // 로그인 된 상태이면 추가
    		String id = user.getId();
    		wishList.setId(id);
    		int result = fService.insertwishList(wishList);
    		if(result != 1) { 
    			System.out.println("찜식품 추가 실패");
    		}
    	}
    }
    
    //내 찜(예상섭취식품) 리스트 조회
    @RequestMapping("wishList.mvc")
    public String wishList(HttpServletRequest req, Model model) {
    	HttpSession session = req.getSession();
    	User user = (User) session.getAttribute("user");
    	String id = user.getId();
    	List<MyEatFood> list = fService.selectAllWishList(id);
    	model.addAttribute("list", list);
    	return "wishList";
    }
    
    //내 찜식품 삭제 - ajax
    @ResponseBody //ajax success()를 위해 설정
    @RequestMapping(value="wishListDelete.mvc", method=RequestMethod.POST)
    public void wishListDelete(int wishcode) {
    	int result = fService.deleteWishList(wishcode);
    	if(result == 0) {
    		System.out.println("찜식품 삭제 실패");
    	}
    }
    
    //내 찜식품 수정(수량) - ajax
    @ResponseBody // ajax success()를 위해 설정
    @RequestMapping(value="wishListUpdate.mvc", method=RequestMethod.POST)
    public void eatFoodUpdate(WishList wishList) {
    	System.out.println(wishList);
    	int result = fService.updateWishList(wishList);
    	if(result == 0) {
    		System.out.println("찜식품 수정 실패");
    	}
    }
    
    
    //베스트 섭취정보
    @RequestMapping("bestEatFood.mvc")
    public String bestEatFood(HttpServletRequest req, Model model) {
        List<MyEatFood> list = fService.bestEatFood();
        model.addAttribute("list", list);
        return "bestEatFood";
    }
    
    
    
	//내 섭취식품 리스트 조회
    @RequestMapping("eatFoodList.mvc")
    public String eatFoodList(HttpServletRequest req, Model model) {
    	HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		
		String id = user.getId();
		//id로 유저의 추가정보 받아오기
		UserPrivateInfo userInfo = fService.getUser(id);
		
		if(userInfo.getAge().equals(""))
		{
			
			List<MyEatFood> list = fService.selectAllEatFood(id);
			model.addAttribute("list", list);
				int cal = 0;
		        int nat = 0;
		        for(MyEatFood m: list) {
		            int code = m.getCode();
		            int cnt = m.getCnt();
		            cal += cnt*fService.getCal(code);
		            nat += cnt*fService.getNat(code);
		            System.out.println(nat);
		        }
		        
		        model.addAttribute("cal",cal);
		        model.addAttribute("nat",nat);
		        model.addAttribute("kcal","-1");
			return "eatFoodList";
		}else {
		
		
			
		int kcal = 0;
		
		double num = 0;
		double num2 = 0;
		double num3 = 0;
			
		int age = Integer.valueOf(userInfo.getAge());
		double weight = Double.valueOf(userInfo.getWeight());
		double height = Double.valueOf(userInfo.getHeight())/100;
		double PA = 0;

		
		// bmi 계산
		int iHeight = Integer.valueOf(userInfo.getHeight());
		int iWeight = Integer.valueOf(userInfo.getWeight());
		double bmi = (iWeight*100000)/((iHeight)*(iHeight));
		int resbmi = (int)bmi;
		
		double userBMI = (double)resbmi/10;
		System.out.println(userBMI);
		model.addAttribute("userBMI",userBMI);
		
		if(userInfo.getGender().equals("남자")) {
			kcal+=662;
			num = -9.53;
			num2 = 15.91;
			num3 = 539.6;
			if(userInfo.getCheckActivity().equals("비활동적")) {
				PA = 1.0;
			}else if(userInfo.getCheckActivity().equals("저활동적")) {
				PA = 1.11;
			}else if(userInfo.getCheckActivity().equals("활동적")) {
				PA = 1.25;
			}else {
				PA =1.48;
			}
		}
		else { //여자일 때
			kcal+=354;
			num = -6.91;
			num2 = 9.36;
			num3 = 726;
			if(userInfo.getCheckActivity().equals("비활동적")) {
				PA = 1.0;
			}else if(userInfo.getCheckActivity().equals("저활동적")) {
				PA = 1.12;
			}else if(userInfo.getCheckActivity().equals("활동적")) {
				PA = 1.27;
			}else {
				PA =1.45;
			}
		}
		
		kcal += (int) (num*age+PA*(num2*weight+num3*height));
		model.addAttribute("kcal",kcal);
		
		List<MyEatFood> list = fService.selectAllEatFood(id);
		model.addAttribute("list", list);
		 	int cal = 0;
	        int nat = 0;
	        for(MyEatFood m: list) {
	            int code = m.getCode();
	            int cnt = m.getCnt();
	            cal += cnt*fService.getCal(code);
	            nat += cnt*fService.getNat(code);
	            System.out.println(nat);
	        }
	        
	        model.addAttribute("cal",cal);
	        model.addAttribute("nat",nat);
	        return "eatFoodList";
		}
		
    }
}