package spring.model;
import java.time.Instant;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class catagory {
	private int catagoryID;
	private int catName;
	private int catDescription;
	private Instant createdAt;
	private Instant modifiedAt;
	
}
