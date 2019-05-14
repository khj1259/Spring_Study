package com.ssafy.model.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.User;
import com.ssafy.model.dto.UserPrivateInfo;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SqlSession session;

	private static final String namespace = "mybatis.userMapper."; // .까지 문자열로 준비

	@Override
	public int signUp(User user) {
		return session.insert(namespace + "signup", user);
	}

	@Override
	public User signIn(User user) {
		return session.selectOne(namespace + "signin", user);
	}

	@Override
	public void leave(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modify(String id, String password, String name, String address, String phone, String allergy) {
		User user = new User(id, password, name, address, phone, allergy);
		session.update(namespace + "modify", user);
	}

	@Override
	public User searchID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(User user) {
		return session.delete(namespace + "delete", user);
	}

	@Override
	public User searchPass(User user) {
		return session.selectOne(namespace + "searchpass", user);
	}

	// 유저 개인정보 추가등록
	@Override
	public int signUpInfo(UserPrivateInfo userInfo) {
		return session.insert(namespace + "signupinfo", userInfo);
	}

	@Override
	public UserPrivateInfo getUserId(String id) {
		return session.selectOne(namespace + "searchUserInfo", id);
	}

	@Override
	public void modifyInfo(String id, String gender, String height, String weight, String age, String checkActivity) {
		System.out.println("수정한다");
		UserPrivateInfo userinfo = new UserPrivateInfo(id,gender,height,weight,age,checkActivity);
		session.update(namespace +"modifyinfo", userinfo);
	}

}