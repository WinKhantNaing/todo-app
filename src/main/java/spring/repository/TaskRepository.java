package spring.repository;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import spring.model.Catagory;
import spring.model.Tasks;

@Repository
public class TaskRepository {
	
	public int addNewTask(Tasks task) {
		Connection con = ConnectionClass.getConnection();
		PreparedStatement ps = null;
		int important;
		int result = 0;
		try {
			ps = con.prepareStatement("insert into tasks (task_title, task_description, status, is_important, due_date, reminder, usr_id, cat_id,created_at) values (?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, task.getTaskTitle());
			ps.setString(2, task.getTaskDescription());
			ps.setInt(3, task.getStatus());
			if(task.getIsImportant()) {
				important = 1;
			} else {
				important = 0;
			}
			ps.setInt(4, important);
			ps.setDate(5, Date.valueOf(task.getDueDate()));

			 if (task.getReminder() != null) {
			        ps.setTimestamp(6, Timestamp.valueOf(task.getReminder()));
			    } else {
			        ps.setNull(6, java.sql.Types.TIMESTAMP);
			    }
			 
			ps.setInt(7, task.getUsrID());
			ps.setInt(8, task.getCatagoryID());
	        ps.setTimestamp(9, Timestamp.valueOf(LocalDateTime.now()));
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("Add new task: " + e.getMessage());
		} finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            System.out.println("Error closing resources: " + e.getMessage());
	        }
	    }
		return result;
	}
	
	public List<Catagory> getAllCatagories() {
		List<Catagory> catLst = new ArrayList<>();
		Catagory cat = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM todolist.catagory");
			ResultSet rs = ps.executeQuery();
			cat = null;
			while(rs.next()) {
				cat = new Catagory();
				cat.setCatagoryID(rs.getInt("catagory_id"));
				cat.setCatName(rs.getString("catagory_name"));
				catLst.add(cat);
			}
		} catch (SQLException e) {
			System.out.println("Get all catagories: " + e.getMessage());
		}
		return catLst;
	}
	
	public List<Tasks> getAllTasks(int userID){
		List<Tasks> taskLst = new ArrayList<>();
		boolean important;
		Tasks task = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select task_id,task_title,task_description,is_important,due_date from tasks where usr_id = ?");
			ps.setInt(1, userID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				task = new Tasks();
				task.setTaskID(rs.getInt("task_id"));
				task.setTaskTitle(rs.getString("task_title"));
				task.setTaskDescription(rs.getString("task_description"));
				if(rs.getInt("is_important") == 1) {
					important = true;
				} else {
					important = false;
				}
				
				task.setIsImportant(important);
				task.setDueDate(rs.getDate("due_date").toLocalDate());
				taskLst.add(task);
			}
			
		} catch (SQLException e) {
			System.out.println("Get all tasks: " + e.getMessage());
			
		}
		
		return taskLst;
		
	}
	
	public Tasks getOneTask(int id) {
		boolean important;
		Connection con = ConnectionClass.getConnection();
		Tasks task = new Tasks();
		try {
			PreparedStatement ps = con.prepareStatement("select task_title,task_description,is_important,due_date from tasks where task_id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				task.setTaskTitle(rs.getString("task_title"));
				task.setTaskDescription(rs.getString("task_description"));
				if(rs.getInt("is_important") == 1) {
					important = true;
				} else {
					important = false;
				}
				
				task.setIsImportant(important);
				task.setDueDate(rs.getDate("due_date").toLocalDate());
			}
			
		} catch (SQLException e) {
			System.out.println("Get one task: " + e.getMessage());
		}  
		return task;
		
	}

}
