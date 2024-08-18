package spring.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduledTasks {
	 @Scheduled(fixedRate = 15000) // Runs every 15 seconds
	    public void performTask() {
	        System.out.println("Scheduled Task Executed!");
	    }
}
