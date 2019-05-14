package com.ssafy.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.EatFood;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodPageBean;
import com.ssafy.model.dto.MyEatFood;
import com.ssafy.model.dto.WishList;

// 인터페이스를 구현한 클래스
@Repository
public class FoodDaoImpl implements FoodDao {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "mybatis.foodMapper."; // .까지 문자열로 준비
	
	@Override
	public void loadData() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int foodCount(FoodPageBean bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Food> searchAll() {
		return session.selectList(namespace + "selectAll");
	}

	@Override
	public Food search(int code) {
		return session.selectOne(namespace + "selectOne", code);
	}
	
	@Override
	public List<Food> searchByName(String searchValue) {
		return session.selectList(namespace + "searchByName", searchValue);
	}

	@Override
	public List<Food> searchByMaker(String searchValue) {
		return session.selectList(namespace + "searchByMaker", searchValue);
	}

	@Override
	public List<Food> searchByMaterial(String searchValue) {
		return session.selectList(namespace + "searchByMaterial", searchValue);
	}

	@Override
	public List<Food> searchBest() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Food> searchBestIndex() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertEatFood(EatFood eatFood) {
		return session.insert(namespace + "insertEatFood", eatFood);
	}

	@Override
	public List<MyEatFood> selectAllEatFood(String id) {
		return session.selectList(namespace + "selectAllEatFood", id);
	}

	@Override
	public int deleteEatFood(int eatfoodcode) {
		return session.delete(namespace + "deleteEatFood", eatfoodcode);
	}

	@Override
	public int updateEatFood(EatFood eatFood) {
		return session.update(namespace + "updateEatFood", eatFood);
	}

	@Override
	public int insertwishList(WishList wishList) {
		return session.insert(namespace + "insertWishList", wishList);
	}

	@Override
	public List<MyEatFood> selectAllWishList(String id) {
		return session.selectList(namespace + "selectAllWishList", id);
	}

	@Override
	public int deleteWishList(int wishcode) {
		return session.delete(namespace + "deleteWishList", wishcode);
	}

	@Override
	public int updateWishList(WishList wishList) {
		return session.update(namespace + "updateWishList", wishList);
	}
	
	@Override
    public List<MyEatFood> bestEatFood(){
        return session.selectList(namespace+"selectBest");
    }
	
}
// SqlSessionTemplate 를 주입받아서, 각함수에 적절한 쿼리문을 호출하도록 구현