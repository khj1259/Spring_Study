package com.ssafy.model.repository;

import com.ssafy.model.dto.User;
import com.ssafy.model.dto.UserPrivateInfo;

public interface UserDao {
	
	//회원가입
	public int signUp(User user);
	
	//로그인
	public User signIn(User user);
	
	//회원정보 수정
	public void modify(String id, String password, String name, String address, String phone, String allergy);

	//회원탈퇴
	public int delete(User user);
	
	//비밀번호 찾기 - 예외처리 남음
	public User searchPass(User user);

	public void leave(User user);
	
	public User searchID(String id);
	
	public int signUpInfo(UserPrivateInfo userInfo);

    public UserPrivateInfo getUserId(String id);

    //추가 정보 수정
	public void modifyInfo(String id, String gender, String height, String weight, String age, String checkActivity);
}