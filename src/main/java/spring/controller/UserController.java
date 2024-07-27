package spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.Catagory;
import spring.model.Tasks;
import spring.model.User;
import spring.repository.TaskRepository;
import spring.repository.UserRepository;

@Controller
public class UserController {
	
	@Autowired
	TaskRepository taskrepo;
	UserRepository userrepo;
	
	@ModelAttribute("/userLogin")
	public User getUser() {
		User userObj = new User();
		return userObj; 
	}
	
	@ModelAttribute("/createUser")
	public User createUsr() {
		User userObj = new User();
		return userObj; 
	}
	
	@ModelAttribute(value = "/task")
	public Tasks getTask() {
		Tasks newTask = new Tasks();
		return newTask;
	}
	
	@GetMapping(value = "/")
	public ModelAndView home(){
		return new ModelAndView("login","user", new User());
	}
	
	@PostMapping(value = "/login")
	public String checkUser(@ModelAttribute("user") User lgnuser,Model m,HttpSession session) {
		boolean isLogin = false;
		UserRepository repo = new UserRepository();
		isLogin = repo.emailExists(lgnuser.getUserEmail());
		
		if(isLogin) {
			User user = null;
			user = repo.accountExists(lgnuser);
			if(user != null) {
				session.setAttribute("userID", user.getUserID());
				return "redirect:showIndex";
			}
		} else {
			m.addAttribute("msg","Please register first!!");
			return "/";
		}
		return "/";
	}
	
	@GetMapping(value="/showIndex")
	public String index(Model m, HttpSession session){
		List<Catagory> catLst = taskrepo.getAllCatagories();
		m.addAttribute("catLst",catLst);
		m.addAttribute("task",new Tasks());
		List<Tasks> taskLst = taskrepo.getAllTasks((Integer)session.getAttribute("userID"));
		m.addAttribute("taskLst",taskLst);
		return "index";
	}
	
	@GetMapping(value = "/userRegister")
	public String register(Model m) {
		m.addAttribute("createUser", new User());
		return "register";
	}
	
	@PostMapping(value="/addUser")
	public String addUser(@ModelAttribute("createUser") User user,Model m) {
		UserRepository urepo = new UserRepository();
		boolean emailExists = urepo.emailExists(user.getUserEmail());
		if(emailExists) {
			m.addAttribute("msg","Account already exists!!");
			return "redirect:/login";
		}
		int result = urepo.addNewUser(user);
		if(result == 1) {
			m.addAttribute("msg"," User added!!");
		} else {
			m.addAttribute("msg"," Error!!");
		}
		return "redirect:/";
	}
	
}
