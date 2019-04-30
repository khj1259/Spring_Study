package com.ssafy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.model.dto.Car;
import com.ssafy.model.dto.User;
import com.ssafy.model.service.ICarService;

@Controller
public class MainController {

	@Autowired
	private ICarService svr;
	
	@RequestMapping("list.do") 
	public String list(Model model) {
		model.addAttribute("clist", svr.getCarList()); // 담아서 보냄
		return "CarList"; 
	}
	
	@RequestMapping("carAdd.do") 
	public String carAdd(Model model) {
		model.addAttribute("codelist", svr.getCodeList()); // 담아서 보냄
		return "CarReg"; 
	}
	
	@RequestMapping("carAddDo.do")
	public String carAddDo(Model model, HttpServletRequest req) {
		try {
			Car car = new Car();
			car.setModel(req.getParameter("model"));
			car.setNum(req.getParameter("num"));
			car.setPrice(Integer.parseInt(req.getParameter("price")));
			car.setVcode(req.getParameter("vcode"));
			svr.insertCar(car);
			return "Result"; 
		} catch (Exception e) {
			model.addAttribute("msg","등록에러");
			return "Error";
		}
	}
	
	@RequestMapping("carView.do")
	public String carView(Car car, Model model) {
		model.addAttribute("carDetail", svr.getCarView(car));
		
		return "CarView"; 
	}
	
	@RequestMapping("carDel.do")
	public String carDel(@RequestParam("numlist") String[] numlist) {
		svr.deleteCar(numlist);
		
		return "redirect:list.do"; 
	}
	
	@RequestMapping("login.do") 
	public String login(User user, HttpServletRequest req) {
		user = svr.selectUser(user);
		if(user== null) {
			return "redirect:/"; 
		} else {
			req.getSession().setAttribute("user", user);
			return "redirect:list.do"; 
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/"; 
	}
	
}
