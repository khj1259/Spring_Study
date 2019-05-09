package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.EatFood;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodPageBean;
import com.ssafy.model.dto.MyEatFood;

/** 인터페이스 */
public interface FoodDao {
//	public int insert(Product product);
//	public List<Product> selectAll();
	/////////////////////////////////////
	/**
	 * 식품 영양 정보 및 식품 정보를 xml 파일에서 로딩하는 기능 
	 */
	public void loadData();
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)의 개수를 반환. 
	 * web에서 구현할 내용. 
	 * web에서 페이징 처리시 필요 
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한  식품 개수
	 */
	public int foodCount(FoodPageBean bean);
	
	//푸드 전체 리스트 조회
	public List<Food> searchAll();
	
	/**
	 * 식품 코드에 해당하는 식품정보를 검색해서 반환. 
	 * @param code	검색할 식품 코드
	 * @return	식품 코드에 해당하는 식품 정보, 없으면 null이 리턴됨
	 */
	public Food search(int code);
	
	
	/**
	 * 가장 많이 검색한 Food  정보 리턴하기 
	 * web에서 구현할 내용.  
	 * @return
	 */
	public List<Food> searchBest();
	
	public List<Food> searchBestIndex();
	
	// 식품명 검색
	public List<Food> searchByName(String searchValue);
	
	// 제조사 검색
	public List<Food> searchByMaker(String searchValue);
	
	// 원재료 검색
	public List<Food> searchByMaterial(String searchValue);

	// 섭취식품 추가
	public int insertEatFood(EatFood eatFood);
	
	//섭취식품 전체 검색
	public List<MyEatFood> selectAllEatFood(String id);
	
	// 섭취식품 삭제
	public int deleteEatFood(int eatfoodcode);
	
	// 섭취식품 수량 정보 수정
	public int updateEatFood(EatFood eatFood);
	
	public List<Food> expectedIntake(String id);
}
