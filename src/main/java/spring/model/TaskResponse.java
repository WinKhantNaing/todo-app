package spring.model;

import java.util.List;

public class TaskResponse {
	public Tasks getTask() {
		return task;
	}
	public void setTask(Tasks task) {
		this.task = task;
	}
	public List<Category> getCatLst() {
		return catLst;
	}
	public void setCatLst(List<Category> catLst) {
		this.catLst = catLst;
	}
	private Tasks task;
	private List<Category> catLst;
}
