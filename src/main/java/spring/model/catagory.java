package spring.model;
import java.time.Instant;

public class Catagory {
	
	private int catagoryID;
	private String catName;
	private int catDescription;

	public int getCatagoryID() {
		return catagoryID;
	}
	public void setCatagoryID(int catagoryID) {
		this.catagoryID = catagoryID;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String string) {
		this.catName = string;
	}
	public int getCatDescription() {
		return catDescription;
	}


	
}
