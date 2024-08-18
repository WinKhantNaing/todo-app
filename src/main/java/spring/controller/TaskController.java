package spring.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.Category;
import spring.model.TaskResponse;
import spring.model.Tasks;
import spring.repository.TaskRepository;

@Controller

@RequestMapping(value = "/task")

public class TaskController {
	@Autowired
	TaskRepository taskrepo;
	
	@ModelAttribute(value = "/task")
	public Tasks getTask() {
		Tasks newTask = new Tasks();
		return newTask;
	}
	
	@PostMapping(value="/addTask")
	public String addNewTask(@ModelAttribute("tasks") Tasks task,@RequestParam("dueDate")String date,HttpSession session,Model m) {
		task.setUsrID((Integer)session.getAttribute("userID"));
		System.out.println("Date: " + date);
        if(date != "") {
        	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.parse(date, formatter);
            task.setDueDate(localDate);
        }
        System.out.println("is important: " +task.getIsImportant());
		int result = taskrepo.addNewTask(task);
		if(result > 0) {
			return "redirect:/showIndex";
		}
		
		return "redirect:/showIndex";
	}
	
	@PostMapping(value="/upgradeTask")
	public String upgradeTask(@ModelAttribute("tasks") Tasks task,@RequestParam("dueDate")String date,HttpSession session,Model m) {
		task.setUsrID((Integer)session.getAttribute("userID"));
		
		if(date != "") {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate localDate = LocalDate.parse(date, formatter);
			task.setDueDate(localDate);
		}		
		int result = taskrepo.updateTask(task);
		if(result > 0) {
			System.out.println("ok");
		} else {
			System.out.println("not ok");
		}
		return "redirect:/showIndex";
	}
	
	@GetMapping(value="/getOneTask/{id}")
	public ResponseEntity<TaskResponse> getOne(@PathVariable int id,Model m) {
		Tasks task = taskrepo.getOneTask(id);
		List<Category> catLst = taskrepo.getAllCatagories();
		 TaskResponse tr = new TaskResponse();
		 tr.setCatLst(catLst);
		 tr.setTask(task);
		if (task != null) {
            return ResponseEntity.ok(tr);
        } else {
            return ResponseEntity.notFound().build();
        }
	}
	
	@GetMapping(value = "/showImpTasks/{id}")
	public String showImpTasks(@PathVariable int id, Model model) {
	    List<Tasks> impTaskList = taskrepo.getImportantTasks(id);
	    System.out.println("impList: " + impTaskList);
	    model.addAttribute("impTaskList", impTaskList);
	    return "important"; // return the important.jsp fragment
	}
	
	@PostMapping(value = "/updateStatus/{taskId}/{status}")
	@ResponseBody
	public ResponseEntity<Void> updStatus0(@PathVariable int taskId,@PathVariable int status) {
		int result = taskrepo.updateStatus(taskId,status);
		System.out.println("result of update status: " + result);
		
			return ResponseEntity.ok().build();
	}
	
	@GetMapping(value="/deleteTask/{taskId}")
	@ResponseBody
	public String deleteTask(@PathVariable int taskId) {
		int result = taskrepo.deleteTask(taskId);
		System.out.println("result of update status: " + result);
		return "/todo-app/showIndex";
	} 
}
