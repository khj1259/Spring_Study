package com.ssafy.model.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.User;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "mybatis.userMapper."; // .까지 문자열로 준비
	
	@Override
	public int signUp(User user) {
		return session.insert("signup", user);
	}

	@Override
	public User signIn(User user) {
		return session.selectOne("signin", user);
	}

	@Override
	public void leave(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(String id, String password, String name, String address, String phone, String allergy) {
		User user = new User(id,password,name,address,phone,allergy);
		session.update("modify",user);
	}

	@Override
	public User searchID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(User user) {
		return session.delete("delete",user);
	}

	@Override
    public User searchPass(User user) {
        return session.selectOne("searchpass", user);
    }

}
