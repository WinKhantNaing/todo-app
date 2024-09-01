package spring.repository;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import spring.model.Category;
import spring.model.Tasks;

@Repository
public class TaskRepository {
	
	public int addNewTask(Tasks task) {
		Connection con = ConnectionClass.getConnection();
		PreparedStatement ps = null;
		int important;
		int result = 0;
		try {
			ps = con.prepareStatement("insert into tasks (task_title, task_description, status, is_important, due_date, reminder, usr_id, cat_id) values (?,?,?,?,?,?,?,?)");
			
			ps.setString(1, task.getTaskTitle());
			ps.setString(2, task.getTaskDescription());
			ps.setInt(3, task.getStatus());
			if(task.getIsImportant()) {
				important = 1;
			} else {
				important = 0;
			}
			ps.setInt(4, important);
			
			if (task.getDueDate() != null) {
				ps.setDate(5, Date.valueOf(task.getDueDate()));
		    } else {
		        ps.setNull(5,java.sql.Types.DATE );
		    }

			 if (task.getReminder() != null) {
			        ps.setTimestamp(6, Timestamp.valueOf(task.getReminder()));
			    } else {
			        ps.setNull(6, java.sql.Types.TIMESTAMP);
			    }
			 
			ps.setInt(7, task.getUsrID());
			ps.setInt(8, task.getCategoryID());
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
	
	public List<Category> getAllCatagories() {
		List<Category> catLst = new ArrayList<>();
		Category cat = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM todolist.catagory");
			ResultSet rs = ps.executeQuery();
			cat = null;
			while(rs.next()) {
				cat = new Category();
				cat.setCategoryID(rs.getInt("catagory_id"));
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
				if(rs.getDate("due_date") != null) {
					task.setDueDate(rs.getDate("due_date").toLocalDate());
				}
				taskLst.add(task);
			}
			
		} catch (SQLException e) {
			System.out.println("Get all tasks: " + e.getMessage());
		}
		return taskLst;
	}
	
	public List<Tasks> getUncompleteTasks(int userId) {
		List<Tasks> uncompleteTasks = new ArrayList<>();
		boolean important;
		Tasks task = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select task_id,task_title,task_description,is_important,due_date from tasks where usr_id = ? and status=0");
			ps.setInt(1, userId);
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
				if(rs.getDate("due_date") != null) {
					task.setDueDate(rs.getDate("due_date").toLocalDate());
				}
				uncompleteTasks.add(task);
			}
			
		} catch (SQLException e) {
			System.out.println("Get all tasks: " + e.getMessage());
		}
		return uncompleteTasks;
		
	}
	
	public List<Tasks> getCompleteTasks(int id) {
		Connection con = ConnectionClass.getConnection();
		List<Tasks> completeTskLst = new ArrayList<>();
		boolean important;
		Tasks task = null;
		try {
			PreparedStatement ps = con.prepareStatement("select task_id, task_title, task_description, due_date, cat_id, is_important from tasks where usr_id = ? and status = 1");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				task = new Tasks();
				task.setTaskID(rs.getInt("task_id"));
				task.setTaskTitle(rs.getString("task_title"));
				task.setTaskDescription(rs.getString("task_description"));
				if(rs.getDate("due_date") != null) {
					task.setDueDate(rs.getDate("due_date").toLocalDate());
				}
				task.setCategoryID(rs.getInt("cat_id"));
				if(rs.getInt("is_important") == 1) {
					important = true;
				} else {
					important = false;
				}
				task.setIsImportant(important);
				completeTskLst.add(task);
			}
		} catch (SQLException e) {
			System.out.println("get complete tasks: " + e.getMessage());
		}
		return completeTskLst;
		
	}
	
	
	public Tasks getOneTask(int id) {
		boolean important;
		Connection con = ConnectionClass.getConnection();
		Tasks task = new Tasks();
		try {
			PreparedStatement ps = con.prepareStatement("select task_id,task_title,task_description,is_important,due_date,cat_id from tasks where task_id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				task.setTaskID(rs.getInt("task_id"));
				task.setTaskTitle(rs.getString("task_title"));
				task.setTaskDescription(rs.getString("task_description"));
				task.setCategoryID(rs.getInt("cat_id"));
				if(rs.getInt("is_important") == 1) {
					important = true;
				} else {
					important = false;
				}
				
				task.setIsImportant(important);
				if(rs.getDate("due_date") != null) {
					task.setDueDate(rs.getDate("due_date").toLocalDate());
				}
			}
			
		} catch (SQLException e) {
			System.out.println("Get one task: " + e.getMessage());
		}  
		return task;
	}
	
	public List<Tasks> getImportantTasks(int id) {
		Connection con = ConnectionClass.getConnection();
		boolean important;
		List<Tasks> impTasks = new ArrayList<>();
		Tasks task = null;
		try {
			PreparedStatement ps = con.prepareStatement("select task_id, task_title, task_description, is_important, due_date from tasks where is_important = 1 and status=0 and usr_id = ?");
			ps.setInt(1, id);
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
				if(rs.getDate("due_date") != null) {
					task.setDueDate(rs.getDate("due_date").toLocalDate());
				}
				impTasks.add(task);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return impTasks;
	}
	
	public int updateTask(Tasks task) {
		int result = 0;
		int important;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("update tasks set task_title=?, task_description=?,is_important=?, due_date=?, cat_id=? where usr_id=? and task_id=?");
			ps.setString(1, task.getTaskTitle());
			ps.setString(2, task.getTaskDescription());
			if(task.getIsImportant()) {
				important = 1;
			} else {
				important = 0;
			}
			ps.setInt(3, important);
			
			if (task.getDueDate() != null) {
				ps.setDate(4, Date.valueOf(task.getDueDate()));
		    } else {
		        ps.setNull(4, java.sql.Types.TIMESTAMP);
		    }
			
//			 if (task.getReminder() != null) {
//			        ps.setTimestamp(6, Timestamp.valueOf(task.getReminder()));
//			    } else {
//			        ps.setNull(6, java.sql.Types.TIMESTAMP);
//			    }
			 
			
			ps.setInt(5, task.getCategoryID());
//	        ps.setTimestamp(8, Timestamp.valueOf(LocalDateTime.now()));
	        ps.setInt(6, task.getUsrID());
	        ps.setInt(7, task.getTaskID());
	        System.out.println("usrid"+task.getUsrID());
	        System.out.println("taskid"+task.getTaskID());
	        
	        result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Update Task: " + e.getMessage());
		}
		return result;
	}
	
	
	public int updateStatus(int taskId,int status) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("update tasks set status=? where task_id=?");
			ps.setInt(1, status);
			ps.setInt(2, taskId);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update status: " + e.getMessage());
		}
		return result;
	}
	
	public int deleteTask(int taskID) {
		Connection con = ConnectionClass.getConnection();
		int result = 0;
		try {
			PreparedStatement ps = con.prepareStatement("delete from tasks where task_id=?");
			ps.setInt(1, taskID);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete task: " + e.getMessage());
		}
		return result;
	}
	
	public List<Tasks> getTodayTasks(int usrID,LocalDate tdyDate){
		List<Tasks> todayTask = getTasksByDate(usrID,tdyDate);
		return todayTask;
	}
	
	public List<Tasks> getTomorrowTasks(int usrID,LocalDate tmrDate){
		List<Tasks> tomorrowTask = getTasksByDate(usrID,tmrDate);
		return tomorrowTask;
	}
	
	public List<Tasks> getTasksByDate(int usrID,LocalDate date){
		Connection con = ConnectionClass.getConnection();
		List<Tasks> taskLst = new ArrayList<>();
		Tasks task = null;
		boolean important;
		try {
			PreparedStatement ps = con.prepareStatement("select * from tasks where due_date=? and status=0 and usr_id=?");
			ps.setDate(1, Date.valueOf(date));
			ps.setInt(2, usrID);
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
				task.setCategoryID(rs.getInt("cat_id"));
				taskLst.add(task);
			}
		} catch (SQLException e) {
			System.out.println("get tasks by date: " + e.getMessage());
		}
		return taskLst;
		
	}
	
	public List<Tasks> getTasksNextFiveDays(int usrID,LocalDate startDate,LocalDate endDate){
		Connection con = ConnectionClass.getConnection();
		List<Tasks> taskLst = new ArrayList<>();
		Tasks task = null;
		boolean important;
		try {
			PreparedStatement ps = con.prepareStatement("select * from tasks where due_date BETWEEN ? and ? and status=0 and usr_id=?");
			ps.setDate(1, Date.valueOf(startDate));
			ps.setDate(2, Date.valueOf(endDate));
			ps.setInt(3, usrID);
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
				task.setCategoryID(rs.getInt("cat_id"));
				taskLst.add(task);
			}
		} catch (SQLException e) {
			System.out.println("get next five days tasks: " + e.getMessage());
		}
		return taskLst;
		
	}

	public List<Tasks> getEarlierTasks(int usrID,LocalDate currentDate){
		Connection con = ConnectionClass.getConnection();
		List<Tasks> taskLst = new ArrayList<>();
		Tasks task = null;
		boolean important;
		try {
			PreparedStatement ps = con.prepareStatement("select * from tasks where due_date < ? and status=0 and usr_id=?");
			ps.setDate(1, Date.valueOf(currentDate));
			ps.setInt(2, usrID);
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
				task.setCategoryID(rs.getInt("cat_id"));
				taskLst.add(task);
			}
		} catch (SQLException e) {
			System.out.println("get earlier tasks: " + e.getMessage());
		}
		return taskLst;
		
	}
}
