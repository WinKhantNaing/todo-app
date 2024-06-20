package spring.model;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class tasks {
	
	private int taskID;
	private String taskTitle;
	private int catagoryID;
	private String taskDescription;
	private int status;
	private int isImportant;
	private LocalDate dueDate;
	private LocalDateTime reminder;
	private int usrID;
	private int catID;
	private Instant createdAt;
	private Instant modifiedAt;
	
}
