package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.EatFood;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.MyEatFood;
import com.ssafy.model.dto.User;
import com.ssafy.model.dto.UserPrivateInfo;
import com.ssafy.model.dto.WishList;

public interface FoodService {

	// 푸드 전체 리스트 조회
	public List<Food> searchAll();

	// 푸드 상세정보 (한개 검색)
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

	// 식품 찜하기(추가)
	public int insertwishList(WishList wishList);

	// 내 찜목록(예상섭취정보) 조회
	public List<MyEatFood> selectAllWishList(String id);

	// 내 찜식품 삭제
	public int deleteWishList(int wishcode);

	// 내 찜식품 정보 수정
	public int updateWishList(WishList wishList);

	// 회원가입
	public int addUser(User user);

	// 로그인
	public User signIn(User user);

	// 회원탈퇴
	public int deleteUser(User user);

	// 회원정보 수정
	public void modifyUser(String id, String password, String name, String address, String phone, String allergy);

	// 추가 회원정보 수정
	public void modifyUserInfo(String id, String gender, String height, String weight, String age,
			String checkActivity);

	// 비밀번호 찾기 - 예외처리 남음
	public User searchPass(User user);

	public double getCal(int code);

	public double getNat(int code);

	// 베스트 섭취정보
	public List<MyEatFood> bestEatFood();

	// 일단 안씀
	public List<Food> getFoods();

	// 아직 안씀
	public List<Food> searchBest();

	// 아직 안씀
	public List<Food> searchBestIndex();

	int addUserInfo(UserPrivateInfo userInfo);

	UserPrivateInfo getUser(String id);

	public double getCarbo(int code);

	public double getProtein(int code);

	public double getFat(int code);

	public boolean checkUser(User user);


}