package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.EatFood;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.MyEatFood;
import com.ssafy.model.dto.User;

public interface FoodService {

	//푸드 전체 리스트 조회
	public List<Food> searchAll();
	
	//푸드 상세정보 (한개 검색)
	public Food search(int code);
	
	// 식품명 검색
	public List<Food> searchByName(String searchValue);

	// 제조사 검색
	public List<Food> searchByMaker(String searchValue);

	// 원재료 검색
	public List<Food> searchByMaterial(String searchValue);
	
	// 섭취식품 추가
	public int insertEatFood(EatFood eatFood);
	
	// 내 섭취식품 조회
	public List<MyEatFood> selectAllEatFood(String id);
	
	// 내 섭취식품 삭제
	public int deleteEatFood(int eatfoodcode);
	
	// 내 섭취식품 정보 수정
	public int updateEatFood(EatFood eatFood);

	// 회원가입
	public int addUser(User user);

	// 로그인
	public User signIn(User user);

	// 회원탈퇴 
	public int deleteUser(User user);

	// 회원정보 수정
	public void modifyUser(String id, String password, String name, String address, String phone, String allergy);
	
	// 비밀번호 찾기 - 예외처리 남음
	public User searchPass(User user);
	
	
	//예상 섭취정보
    public List<MyEatFood> expectedIntake(String id);

    public double getCal(int code);

    public double getNat(int code);
	
	
	//일단 안씀
	public List<Food> getFoods();
	
	//아직 안씀
	public List<Food> searchBest(); 
	
	//아직 안씀
	public List<Food> searchBestIndex();

	
}
