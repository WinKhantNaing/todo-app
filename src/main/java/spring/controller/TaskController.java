package spring.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.model.Tasks;
import spring.repository.TaskRepository;

@RestController

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
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.parse(date, formatter);
        task.setDueDate(localDate);
        System.out.println("is important: " +task.getIsImportant());
		int result = taskrepo.addNewTask(task);
		if(result > 0) {
			return "redirect:/showIndex";
		}
		
		return null;
	}
	
	@GetMapping(value="/getOneTask/{id}")
	public ResponseEntity<Tasks> getOne(@PathVariable int id,Model m) {
		Tasks task = taskrepo.getOneTask(id);
		
		if (task != null) {
			m.addAttribute("task",task);
            return ResponseEntity.ok(task);
        } else {
            return ResponseEntity.notFound().build();
        }
	}

}
