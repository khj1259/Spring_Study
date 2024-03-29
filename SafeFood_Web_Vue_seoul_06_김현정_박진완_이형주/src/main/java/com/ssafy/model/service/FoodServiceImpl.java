package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.EatFood;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.MyEatFood;
import com.ssafy.model.dto.User;
import com.ssafy.model.dto.UserPrivateInfo;
import com.ssafy.model.dto.WishList;
import com.ssafy.model.repository.FoodDao;
import com.ssafy.model.repository.UserDao;
import com.ssafy.util.FoodSaxParser;

@Service
public class FoodServiceImpl implements FoodService {
	@Autowired
	private FoodDao dao;
	@Autowired
	private UserDao userDao;
//	@Autowired
	private FoodSaxParser fsp;

//	public FoodServiceImpl() {
//		dao = FoodDaoImpl.getInstance();
//		userDao = new UserDaoImpl();
//		fsp = new FoodSaxParser();
//	}
	
	public List<Food> searchAll() {
		return dao.searchAll();
	}
	
	public List<Food> searchByName(String searchValue) {
		return dao.searchByName(searchValue);
	}

	public List<Food> searchByMaker(String searchValue) {
		return dao.searchByMaker(searchValue);
	}

	public List<Food> searchByMaterial(String searchValue) {
		return dao.searchByMaterial(searchValue);
	}
	
	public List<Food> getFoods(){
		return fsp.getFoods();
	}

	public Food search(int code) {
		// code에 맞는 식품 정보를 검색하여 리턴
		return dao.search(code);
	}

	public List<Food> searchBest() {
		return dao.searchBest();
	}

	public List<Food> searchBestIndex() {
		return dao.searchBestIndex();
	}

	public int addUser(User user) {
		return userDao.signUp(user);
	}
	
	public void modifyUser(String id, String password, String name, String address, String phone, String allergy) {
		userDao.modify(id, password, name, address, phone, allergy);
	}

	public User signIn(User user) {
		return userDao.signIn(user);
	}
	
	public int deleteUser(User user) {
		return userDao.delete(user);
	}

	public static void main(String[] args) {
//		FoodDaoImpl dao = FoodDaoImpl.getInstance();
//		FoodServiceImpl fsi = new FoodServiceImpl();
//		fsi.dao = dao;
//		System.out.println(fsi.search(2).getAllergy());
	}

	public static void print(List<Food> foods) {
		for (Food food : foods) {
			System.out.println(food);
		}
	}
	
	@Override
	public int insertEatFood(EatFood eatFood) {
		return dao.insertEatFood(eatFood);
	}

	@Override
	public List<MyEatFood> selectAllEatFood(String id) {
		return dao.selectAllEatFood(id);
	}

	@Override
	public int deleteEatFood(int eatfoodcode) {
		return dao.deleteEatFood(eatfoodcode);
	}

	@Override
	public int updateEatFood(EatFood eatfood) {
		return dao.updateEatFood(eatfood);
	}

	public User searchPass(User user) {
        User result=userDao.searchPass(user);
        return result;
    }

    @Override
    public double getCal(int code) {
        Food f = dao.search(code);
        return f.getCalory();
    }

    @Override
    public double getNat(int code) {
        Food f = dao.search(code);
        System.out.println(f.getNatrium());
        return f.getNatrium();
    }

	@Override
	public int insertwishList(WishList wishList) {
		return dao.insertwishList(wishList);
	}

	@Override
	public List<MyEatFood> selectAllWishList(String id) {
		return dao.selectAllWishList(id);
	}

	@Override
	public int deleteWishList(int wishcode) {
		return dao.deleteWishList(wishcode);
	}

	@Override
	public int updateWishList(WishList wishList) {
		return dao.updateWishList(wishList);
	}
	
	@Override
	public List<MyEatFood> bestEatFood(){
        return dao.bestEatFood();
    }

	@Override
	public int addUserInfo(UserPrivateInfo userInfo) {
        return userDao.signUpInfo(userInfo);
    }
    @Override
    public UserPrivateInfo getUser(String id) {
        return userDao.getUserId(id);
    }

	@Override
	public void modifyUserInfo(String id, String gender, String height, String weight, String age,
			String checkActivity) {
	userDao.modifyInfo(id,gender,height, weight, age, checkActivity);
	}
	@Override
    public double getCarbo(int code) {
         Food f = dao.search(code);
            return f.getCarbo();
    }

    @Override
    public double getProtein(int code) {
         Food f = dao.search(code);
            return f.getProtein();
    }

    @Override
    public double getFat(int code) {
         Food f = dao.search(code);
            return f.getFat();
    }

	@Override
	public boolean checkUser(User user) {
		User u = userDao.searchID(user.getId());
		if(u==null) {
			return false;
		}else {
			return true;
		}
	}
	
}