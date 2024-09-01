package spring.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.Category;
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
	public String home(Model m){
		m.addAttribute("user",new User());
		m.addAttribute("createUser",new User());
		return "login";
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
		List<Category> catLst = taskrepo.getAllCatagories();
		m.addAttribute("catLst",catLst);
		m.addAttribute("task",new Tasks());
		List<Tasks> uncompleteTasks = taskrepo.getUncompleteTasks((Integer)session.getAttribute("userID"));
		List<Tasks> completeTasks = taskrepo.getCompleteTasks((Integer)session.getAttribute("userID"));
		m.addAttribute("uncompleteTasks",uncompleteTasks);
		m.addAttribute("completeTasks",completeTasks);
		LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, MMMM d");
        String formattedDate = currentDate.format(formatter);
        DateTimeFormatter minDateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String minDate = currentDate.format(minDateFormatter);
        m.addAttribute("currentDate", formattedDate);
        m.addAttribute("minDate", minDate);
		return "index";
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
