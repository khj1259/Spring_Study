package com.ssafy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.model.dto.User;
import com.ssafy.model.dto.UserPrivateInfo;
import com.ssafy.model.service.FoodService;

@Controller // 앞에 @Controller 붙인 클래스는 디스페처가 받은 요청을 처리할 페이지를 결정해주는 클래스
public class UserController {
	@Autowired
	private FoodService fService;

	// 회원가입 화면연결
	@RequestMapping(value = "signup.mvc", method = RequestMethod.GET)
	public String signupForm() {
		return "signup";
	}

	// 회원가입
	@RequestMapping(value = "signup.mvc", method = RequestMethod.POST)
	public String signup(User user, String[] check, UserPrivateInfo userInfo) {
		String allergy = String.join(",", check);
		user.setAllergy(allergy);
		
		if(userInfo.getGender().isEmpty()) {
			userInfo.setGender("");
		}
		if(userInfo.getHeight().isEmpty()) {
			userInfo.setHeight("");
		}
		if(userInfo.getWeight().isEmpty()) {
			userInfo.setWeight("");
		}
		if(userInfo.getCheckActivity().isEmpty()) {
			userInfo.setCheckActivity("");
		}
		
		int result = fService.addUser(user);
		if (result == 1) { // 정상 처리
			fService.addUserInfo(userInfo);
			return "redirect:main.mvc";
		} else {
			System.out.println("회원가입 실패 처리 해야함");
			return "redirect:signup.mvc";
		}
	}

	// 로그인
	@RequestMapping("login.mvc")
	public String login(User user, Model model, HttpServletRequest req) {
		User loginUser = fService.signIn(user);
		if (loginUser != null) {
			HttpSession session = req.getSession();
			UserPrivateInfo UserPrivateInfo = fService.getUser(user.getId());
			session.setAttribute("user", loginUser);
			session.setAttribute("userId", loginUser.getId());
			session.setAttribute("UserPrivateInfo", UserPrivateInfo);
			return "redirect:foodlist.mvc";
		} else { // 로그인 실패
			model.addAttribute("flag", 1);
			return "main";
		}
	}

	// 회원정보 조회
	@RequestMapping("userInfo.mvc")
	public String userInfo(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		return "userInfo";
	}

	// 로그아웃
	@RequestMapping("logout.mvc")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("user", "");
		return "redirect:main.mvc";
	}

	// 회원 탈퇴 폼으로 던짐
	@RequestMapping("userOutReady.mvc")
	public String userOutReady() {
		return "userOut";
	}

	// 회원탈퇴 완료
	@RequestMapping("userOut.mvc")
	public String userOut(User user, HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		User user2 = (User) session.getAttribute("user");
		System.out.println(user2.toString());
		user.setId(user2.getId());
		
		int result = fService.deleteUser(user);
		System.out.println(result);
		if(result != 0) { // 성공
			session.setAttribute("user", "");
			return "redirect:main.mvc";
		}else {
			System.out.println("탈퇴 실패");
			model.addAttribute("error", "비밀번호를 제대로 입력해주세요!");
			return "userOut";
		}
		/*
		 * 외래키 삭제시 제약조건 추가를 위해서 아래 쿼리문 실행 해야 함 워크벤치에서
		ALTER TABLE eatfood
		ADD CONSTRAINT fk_eatfood
		FOREIGN KEY (id) REFERENCES user(id) 
		ON delete CASCADE;
		*/
	}

	// 회원 정보 수정페이지
	@RequestMapping("userInfoEdit.mvc")
	public String userInfoEdit() {
		return "userInfoEdit";
	}

	// 회원 정보 수정 완료
	@RequestMapping("userInfoEditComplete.mvc")
	public String userInfoEditComplete(HttpServletRequest req, String password, String password2, String name,
			String address, String phone, String[] check, Model model, UserPrivateInfo UserPrivateInfo ) {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		String id = user.getId();
		String allergy = String.join(",", check);
	
		if (password.equals(password2)) {
			fService.modifyUser(id, password2, name, address, phone, allergy);
			System.out.println("user 수정");
			fService.modifyUserInfo(id, UserPrivateInfo.getGender(),UserPrivateInfo.getHeight() , UserPrivateInfo.getWeight(), UserPrivateInfo.getAge(), UserPrivateInfo.getCheckActivity());
		
			User newUser = new User(id, password2, name, address, phone, allergy);
			UserPrivateInfo newUserPrivateInfo = new UserPrivateInfo(id,UserPrivateInfo.getGender(),UserPrivateInfo.getHeight() , UserPrivateInfo.getWeight(), UserPrivateInfo.getAge(), UserPrivateInfo.getCheckActivity());
			System.out.println(newUserPrivateInfo.toString());
			session.setAttribute("user", newUser);
			session.setAttribute("UserPrivateInfo", newUserPrivateInfo);
			return "main";
		} else {
			model.addAttribute("errorInfo", "비밀번호가 틀렸습니다");
			return "userInfoEdit";
		}
	}

	// 비밀번호 찾기
	@RequestMapping("searchPassword.mvc")
	public String searchPassword(User user, Model model, HttpServletRequest req) {
		User result = fService.searchPass(user);
		String pass = "";
		if (result==null) {
			pass = "비밀번호를 찾을 수 없습니다 , 정보를 다시 입력해 주세요";
		} else {
			pass = "비밀번호는 " + result.getPassword() + " 입니다!";
		}
		model.addAttribute("pass", pass);
		return "password";

	}

	// 비밀번호 찾기 폼으로 날리기
	@RequestMapping("searchPassForm.mvc")
	public String searchPassForm() {
		System.out.println("여기까지는 들어왔음");
		return "searchPass";
	}

}