package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import spring.model.user;
import spring.repository.UserRepository;

@Controller
public class UserController {
	
	@ModelAttribute("userLogin")
	public user getUser() {
		user userObj = new user();
		return userObj; 
	}
	
	@GetMapping(value = "/")
	public String home(){
		return "index";
	}
	
//	@GetMapping(value = "login")
//	public String checkUser(@ModelAttribute("loginuser") user lgnuser) {
//		boolean isLogin = false;
//		UserRepository repo = new UserRepository();
//		boolean islogin = repo.emailExists();
//		return null;
//		
//	}
	
}
