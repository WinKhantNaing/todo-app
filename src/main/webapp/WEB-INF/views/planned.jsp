<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<table class="table table-striped-columns">
		<tr>
			<td>
				<div>
					<a class="btn btn-outline-secondary" data-bs-toggle="collapse" href="#earlier" role="button" aria-expanded="false" aria-controls="collapseExample">
						Earlier <i class="bi bi-chevron-down"></i>
					</a>
					<div class="collapse" id="earlier">
				  		<div class="card card-body">
				    		
				    		<table class="table table-dark table-hover"  id="table" style="width:100%">
			  						<thead class="table-dark">
			    						<tr>
			    							<th></th>
											<th>Task Title</th>
											<th>Due Date</th>
											<th>Importance</th>
											<th>Open Details</th>
										</tr>
			  						</thead>
			 						 <tbody>
			    							<c:forEach items="${earlierTasks}" var="task" >
												<tr>
													<td><input type="checkbox" class="task-checkbox" data-task-id="${task.taskID}" ></td>
													<td>${task.taskTitle}</td>
													<td>${task.dueDate}</td>
													<td>
														<input type="checkbox" class="star-input" id="star" disabled="true" <c:if test="${task.isImportant}">checked</c:if>>
														<label for="star" class="star-label">&#9733;</label>
													</td>
													<td>
														  <!-- Button trigger modal -->
														<button style="background:#282c2d; outline:none;border:none;" type="button" class="view-details" data-id="${task.taskID}">
														  <i class="fa-solid fa-exclamation"></i>
														</button>
													</td>
												</tr>
											</c:forEach>
			  						</tbody>
								</table>
				    		
				  		</div>
					</div>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				
				<div>
					<a class="btn btn-outline-secondary" data-bs-toggle="collapse" href="#today" role="button" aria-expanded="false" aria-controls="collapseExample">
						Today <i class="bi bi-chevron-down"></i>
						</a>
					<div class="collapse" id="today">
				  		<div class="card card-body">
				    		
				    		<table class="table table-dark table-hover"  id="table" style="width:100%">
			  						<thead class="table-dark">
			    						<tr>
			    							<th></th>
											<th>Task Title</th>
											<th>Due Date</th>
											<th>Importance</th>
											<th>Open Details</th>
										</tr>
			  						</thead>
			 						 <tbody>
			    							<c:forEach items="${todayTasks}" var="task" >
												<tr>
													<td><input type="checkbox" class="task-checkbox" data-task-id="${task.taskID}" ></td>
													<td>${task.taskTitle}</td>
													<td>${task.dueDate}</td>
													<td>
														<input type="checkbox" class="star-input" id="star" disabled="true" <c:if test="${task.isImportant}">checked</c:if>>
														<label for="star" class="star-label">&#9733;</label>
													</td>
													<td>
														  <!-- Button trigger modal -->
														<button style="background:#282c2d; outline:none;border:none;" type="button" class="view-details" data-id="${task.taskID}">
														  <i class="fa-solid fa-exclamation"></i>
														</button>
													</td>
												</tr>
											</c:forEach>
			  						</tbody>
								</table>
				  		</div>
					</div>
				</div>
	
			</td>
		</tr>
		
		<tr>
			<td>
				<div>
					<a class="btn btn-outline-secondary" data-bs-toggle="collapse" href="#tomorrow" role="button" aria-expanded="false" aria-controls="collapseExample">
						Tomorrow <i class="bi bi-chevron-down"></i>
					</a>
					<div class="collapse" id="tomorrow">
				  		<div class="card card-body">
				    		
				    		<table class="table table-dark table-hover"  id="table" style="width:100%">
			  						<thead class="table-dark">
			    						<tr>
			    							<th></th>
											<th>Task Title</th>
											<th>Due Date</th>
											<th>Importance</th>
											<th>Open Details</th>
										</tr>
			  						</thead>
			 						 <tbody>
			    							<c:forEach items="${tomorrowTasks}" var="task" >
												<tr>
													<td><input type="checkbox" class="task-checkbox" data-task-id="${task.taskID}" ></td>
													<td>${task.taskTitle}</td>
													<td>${task.dueDate}</td>
													<td>
														<input type="checkbox" class="star-input" id="star" disabled="true" <c:if test="${task.isImportant}">checked</c:if>>
														<label for="star" class="star-label">&#9733;</label>
													</td>
													<td>
														  <!-- Button trigger modal -->
														<button style="background:#282c2d; outline:none;border:none;" type="button" class="view-details" data-id="${task.taskID}">
														  <i class="fa-solid fa-exclamation"></i>
														</button>
													</td>
												</tr>
											</c:forEach>
			  						</tbody>
								</table>
				  			</div>
						</div>
					</div>
			</td>
		</tr>	
		
		<tr>
			<td>
				<div>
					<a class="btn btn-outline-secondary" data-bs-toggle="collapse" href="#nextFiveDays" role="button" aria-expanded="false" aria-controls="collapseExample">
					${formattedStartDate} to ${formattedEndDate} <i class="bi bi-chevron-down"></i>
					</a>
					<div class="collapse" id="nextFiveDays">
			  			<div class="card card-body">
			    			<table class="table table-dark table-hover"  id="table" style="width:100%">
			  						<thead class="table-dark">
			    						<tr>
			    							<th></th>
											<th>Task Title</th>
											<th>Due Date</th>
											<th>Importance</th>
											<th>Open Details</th>
										</tr>
			  						</thead>
			 						 <tbody>
			    							<c:forEach items="${fiveDayTasks}" var="task" >
												<tr>
													<td><input type="checkbox" class="task-checkbox" data-task-id="${task.taskID}" ></td>
													<td>${task.taskTitle}</td>
													<td>${task.dueDate}</td>
													<td>
														<input type="checkbox" class="star-input" id="star" disabled="true" <c:if test="${task.isImportant}">checked</c:if>>
														<label for="star" class="star-label">&#9733;</label>
													</td>
													<td>
														  <!-- Button trigger modal -->
														<button style="background:#282c2d; outline:none;border:none;" type="button" class="view-details" data-id="${task.taskID}">
														  <i class="fa-solid fa-exclamation"></i>
														</button>
													</td>
												</tr>
											</c:forEach>
			  						</tbody>
								</table>
			  			</div>
					</div>
				</div>
			</td>
		</tr>
	
	</table>
	
	<script>
	 $(document).ready(function(){
	        $(".view-details").click(function(){
	            var taskId = $(this).data("id");
	            console.log(taskId);
	            $.ajax({
	                url: "task/getOneTask/" + taskId,
	                method: "GET",
	                headers: {
	                    'Accept': 'application/json'
	                },
	                success: function(data) {
	                	console.log(data);  // Log the response data
	                    
	                    // Populate the modal form with task details
	                     var task = data.task;
	                $("#taskID").val(task.taskID);
	                $("#taskTitle").val(task.taskTitle);
             		$("#taskTitle").val(task.taskTitle);
            		$("#taskDescription").val(task.taskDescription);
            		$("#status").val(task.status);
            		$("#isImportant").prop('checked', task.isImportant);
            		if (task.dueDate != null) {
                   		let due = new Date(task.dueDate);
                        // Format the date to 'YYYY-MM-DD' using toLocaleDateString
                        let dueDateString = due.toLocaleDateString('en-CA'); // 'en-CA' locale formats date as 'YYYY-MM-DD'
                        // Set the value of the date input
                        $("#dued").val(dueDateString);
                   		} else {
                   	
                   		    $("#dued").val('');
                   		}
	               
            		// Get the category ID from the response
	                    var categoryID = task.categoryID;

	                    // Populate the category dropdown
	                    var categoryDropdown = $("#catID");
	                    categoryDropdown.empty();  // Clear any existing options

	                    $.each(data.catLst, function(index, category) {
	                        var option = $('<option>', {
	                            value: category.categoryID,
	                            text: category.catName,
	                            selected: category.categoryID == categoryID  // Select the option if IDs match
	                        });
	                        categoryDropdown.append(option);
	                    });

	                    $("#detailModal").modal('show');
	                },
	                error: function(error) {
	                    console.log("Error fetching task details: ", error);
	                }
	            });
	        });
	    });
	</script>
</body>
</html>