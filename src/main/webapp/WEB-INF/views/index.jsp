<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>To Do List UI</title>
  

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Playwrite+NO:wght@100..400&family=Rubik:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/5bb5a852ac.js" crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="bootstrap.min.css"> -->

<link rel="stylesheet" href="resources/css/style.css">

<style>
.star-checkbox {
    position: relative;
    display: inline-block;
}

.star-input {
    display: none;
}

.star-label {
    font-size: 2rem;
    color: gray;
    cursor: pointer;
    transition: color 0.2s ease-in-out;
}

.star-input:checked + .star-label {
    color: gold;
}

.star-label:hover {
    color: orange;
}

</style>
</head>
<body>
	<section class="header sticky-top" style="opacity: 90%;">
		<nav class="navbar navbar-expand-lg "
			style="background-color: rgb(213, 254, 254);">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"> <i
					class="bi bi-calendar-check"></i> Let's Do it
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="logout">Log Out</a></li>
					</ul>
					<form class="d-flex " role="search">
						<input class="form-control me-2 opacity-50" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit" style="">Search</button>
					</form>
				</div>
			</div>
		</nav>
	</section>

	<section class="body">
		<h1 class="my-5 text-center">Welcome from Our To Do List System!</h1>
		<div class="container my-3 d-flex">
			<!-- side panel -->
			<div class="col-3 border-end" style="width:15%;">
				<div class="row mb-2">
					<a href="#" class="text-decoration-none btnMyDay">
					 <i class="bi bi-check-square"></i>
						Tasks
					</a>
				</div>
				
				<div class="row mb-2">
					<a href="#" class="text-decoration-none btnImportant" data-userid="${userID}" id="important-link">
   							 <i class="bi bi-star"></i> Important
					</a>
				</div>
				<div class="row mb-2">
					<a href="#" class="text-decoration-none btnPlanned" data-userid="${userID}" id="planned-tag"> 
					<i class="bi bi-card-list"></i> <!-- <small>Planned</small> -->
						Planned
					</a>
				</div>
				<div class="row mb-2">
					<a href="#" class="text-decoration-none btnAssign"> <i
						class="bi bi-person"></i> <!-- <small>Assigned to me</small>                         -->
						Assigned to me
					</a>
				</div>
				
			</div>
			
			<!-- Tasks -->
			<div class="flex-fill">
				<!-- home page -->
				<div class="d-none sample col ms-5 text fetch">
					<p class="lorem">It is a long established fact that a reader
						will be distracted by the readable content of a page when looking
						at its layout. The point of using Lorem Ipsum is that it has a
						more-or-less normal distribution of letters, as opposed to using
						'Content here, content here', making it look like readable
						English. Many desktop publishing packages and web page editors now
						use Lorem Ipsum as their default model text, and a search for
						'lorem ipsum' will uncover many web sites still in their infancy.
						Various versions have evolved over the years, sometimes by
						accident, sometimes on purpose (injected humour and the like).</p>
					<p class="lorem">Lorem Ipsum is simply dummy text of the
						printing and typesetting industry. Lorem Ipsum has been the
						industry's standard dummy text ever since the 1500s, when an
						unknown printer took a galley of type and scrambled it to make a
						type specimen book. It has survived not only five centuries, but
						also the leap into electronic typesetting, remaining essentially
						unchanged. It was popularised in the 1960s with the release of
						Letraset sheets containing Lorem Ipsum passages, and more recently
						with desktop publishing software like Aldus PageMaker including
						versions of Lorem Ipsum.</p>
				</div>

				<!-- myday -->
				<div class="myday d-none ms-5 col fetch">
					<div class="d-flex justify-content-evenly">
						<div class="">
							<h2 class="">My Day</h2>
							<p class="">${currentDate}</p>
						</div>
						<div class="">
							<button type="button" class="btn icon-button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-context="myday">
								<i class="bi bi-patch-plus-fill"></i>
							</button>

						</div>
					</div>
					
					<audio id="taskSound" src="resources/audio/level-up-2-199574.mp3" preload="auto"></audio>
					
						<table class="table table-dark table-hover"  id="uncompleteTable" style="width:100%">
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
    							<c:forEach items="${uncompleteTasks}" var="task" >
									<tr>
										<td><input type="checkbox" class="task-checkbox" data-task-id="${task.taskID}"></td>
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
					<div> 
					
					
					</div>
					<div class=""></div>
					<div class="">
						<a href="#collapse" data-bs-toggle="collapse"
							aria-expanded="true" class="collapsing text-decoration-none">
							<h5 class="text-center align-items-center">
								<span class="dropdown-toggle me-2"></span> Completed
								<span id="completedCount"></span>
							</h5>
						</a>
						
						
						<div class="col-7 my-4" id="collapse" style="width:100%; background-color: rgb(201, 228, 254);">
						<table class="table table-dark table-hover"  id="completeTable" style="width:100%">
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
    							<c:forEach items="${completeTasks}" var="task" >
									<tr>
										<td><input type="checkbox" class="task-checkbox" data-task-id="${task.taskID}" checked ></td>
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
				

				<!-- important -->
				<div class="important d-none ms-5 col fetch">
					<div class="header d-flex justify-content-evenly align-items-center">
						<h2 class="">Important</h2>
						<div class="">
							<button type="button" class="btn icon-button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-context="important">
								<i class="bi bi-patch-plus-fill"></i>
							</button>
						</div>
					</div>
					
     				  <div id="important-content" class="d-none" ></div>
				</div>

				<!-- planned -->
				<div class="planned d-none ms-5 col fetch">
					<div
						class="header d-flex justify-content-evenly align-items-center">
						<h2 class="">What are You Planning?</h2>
						<button type="button" class="btn icon-button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-context="plan">
								<i class="bi bi-patch-plus-fill"></i>
						</button>
					</div>
					<div id="planned-content" class="d-none" style="background-color: rgb(201, 228, 254);">
						
					</div> 
				</div>

				<!-- task assigned to me -->
				<div class="assign d-none ms-5 col fetch">
					<div
						class="header d-flex justify-content-evenly align-items-center">
						<h2 class="">Assigned to me</h2>
						<div class="">
							<i class="bi bi-patch-plus-fill" style="font-size: 3rem;"></i>
						</div>
					</div>
					<div class="w-100 text-center my-5">
						<p class="">
							<i class="bi bi-journal-check d-block" style="font-size: 5rem;"></i>
							Tasks assigned to you show up here
						</p>
					</div>
				</div>

			</div>

		</div>
	</section>

	<!-- Vertically centered scrollable modal -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Add a task</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">

						<form:form modelAttribute="task" method="post" action="task/addTask" id="addTaskForm" style="width:100%">
							<div class="input-group flex-nowrap">
								<form:input path="taskTitle" id="myInput" class="form-control" placeholder="Add what to do" />
							</div>
							<div class="mb-3" style="margin-top: 20px">
								<form:textarea path="taskDescription"
									placeholder="Task Description" class="form-control"
									id="exampleFormControlTextarea1" rows="3"></form:textarea>
							</div>
							<form:select path="categoryID" class="form-select" aria-label="Default select example">
								
								<c:forEach items="${catLst}" var="cat">
									<option value="${cat.categoryID}">${cat.catName}</option>
								</c:forEach>
							</form:select>
							
							<div style="margin-top: 20px;">
							<input style="background:#4b5154; outline:none;border:none;" type="date" id="datepicker" name="dueDate" pattern="\d{4}-\d{2}-\d{2}" min="${minDate}"/>
							</div>
        					 
        					<div style="margin-top: 20px;">
        					<form:label path="isImportant">Important</form:label>
        					 <form:checkbox id="importantCheckbox" path="isImportant" value="true"/>
        					</div>
						</form:form>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button onclick="submitForm()" class="btn btn-primary">Submit</button>

				</div>
			</div>
		</div>
  </div>

<!-- Modal -->
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Task Detail</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-dialog modal-dialog-centered" style="pointer-events: auto;">
      	<form:form modelAttribute="task" action="task/upgradeTask" method="post" id="updateForm">
      		<form:hidden path="taskID" id="taskID" />
      		
      		<form:input path="taskTitle" class="form-control" ></form:input>
      		<form:textarea path="taskDescription" class="form-control" ></form:textarea>
      		<form:select path="categoryID" id="catID" class="form-select" aria-label="Default select example">
    <!-- Options will be populated dynamically -->
			</form:select>
			
		   	 <div style="margin-top:20px;">
		   	 <form:input style="background:#4b5154; outline:none;border:none;" id="dued" path="dueDate" type="date" name="dueDate" pattern="\d{4}-\d{2}-\d{2}" min="${minDate}"/>
		   	 </div>
        	 
        	 <div style="margin-top:20px;">
        	 <form:label path="isImportant">Important</form:label>
       		 <form:checkbox path="isImportant" id="isImportant"/>
        	 </div>
      	</form:form>
 
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button  onclick="saveUpdate()" type="submit" class="btn btn-primary">Save changes</button>
        <button onclick="showDeleteModal()" type="button" class="btn btn-danger ms-auto">Delete</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <h5>This will be permanently deleted.</h5>
        <h6>You won't be able to undo this action.</h6>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button onclick="deleteTask()" type="button" class="btn btn-primary">Understood</button>
        </div>
      </div>
    </div>
  </div>
</div>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<script type="module" src="<c:url value="/resources/js/script.js"/>"></script>  
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script>
	
	var currentTaskId; // Global variable to store the current task ID
	function showDeleteModal() {
	    // Get the task ID from the hidden input field
	    currentTaskId = $('#taskID').val();
	    // Show the delete confirmation modal
	    var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'), {
	        keyboard: false
	    });
	    $('#detailModal').modal('hide');
	    deleteModal.show();
	}
	
	function deleteTask() {
		console.log(currentTaskId);
	    $.ajax({
	        url: 'task/deleteTask/' + currentTaskId,
	        method: "GET",
	        success: function(response) {
	        	  $('#deleteModal').modal('hide'); // Close the delete confirmation modal
	            console.log('Task deleted successfully');
	            window.location.href = response;
	        },
	        error: function(xhr, status, error) {
	            // Handle error
	            console.error('Error deleting task: ' + error);
	        }
	    });
	}

	
	document.addEventListener('DOMContentLoaded', () => {
	    const starCheckbox = document.getElementById('star');
	    starCheckbox.addEventListener('change', () => {
	        if (starCheckbox.checked) {
	            console.log('Star checkbox is checked');
	        } else {
	            console.log('Star checkbox is unchecked');
	        }
	    });
	});

	    function submitForm() {
		addTaskForm.submit();
    }
	    function saveUpdate() {
	    	updateForm.submit();
	    }
	    
	    $(document).ready(function(){
	    	updateCompletedCount();
	    	
	    	$('#completeTable tbody tr').each(function() {
	            $(this).addClass('strikethrough');
	        });

	        // Remove strike-through from all tasks in the uncompleteTable
	        $('#uncompleteTable tbody tr').each(function() {
	            $(this).removeClass('strikethrough');
	        });
	    	
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
               		$("#taskDescription").val(task.taskDescription);
               		$("#status").val(task.status);
               		$("#isImportant").prop('checked', task.isImportant);
               		
               		if (task.dueDate) {
               		let dueDate = new Date(task.dueDate);
                    // Format the date to 'YYYY-MM-DD' using toLocaleDateString
                    let dueDateString = dueDate.toLocaleDateString('en-CA'); // 'en-CA' locale formats date as 'YYYY-MM-DD'
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
	        
            function updateCompletedCount() {
                var rowCount = $('#completeTable tbody tr').length;
                console.log('Number of completed tasks:', rowCount);
                $('#completedCount').text(rowCount); // Update the count in the element with id "completedCount"
            }
            
	        $(document).on('click', '.task-checkbox', function() {

	            var $checkbox = $(this);
	            var taskId = $checkbox.data('task-id');
	            var isChecked = $checkbox.is(':checked');
	            var status = isChecked ? 1 : 0;
	            var taskRow = $checkbox.closest('tr');
	            console.log(taskRow);
	           
	            $.ajax({
	                url: 'task/updateStatus/' + taskId + '/' + status,
	                type: 'POST',
	                success: function(response) {
	                	if (isChecked) {
	                		var audio = document.getElementById('taskSound');
	                		audio.play();
	                	    var detachedRow = taskRow.detach();  // Detach the row from the current table
	                	    $('#completeTable tbody').append(detachedRow);  // Append to the new table
	                	    taskRow.addClass('strikethrough'); 
	                	} else {
	                	    var detachedRow = taskRow.detach();
	                	    $('#uncompleteTable tbody').append(detachedRow);
	                	    taskRow.removeClass('strikethrough');
	                	}
	    	            updateCompletedCount();
	                },
	                error: function(xhr, status, error) {
	                    console.error('Failed to update task status:', error);
	                    // Optionally, revert the checkbox state if the update fails
	                    $(this).prop('checked', !isChecked);
	                }
	            });
	        });

	    });
	    
	    $(document).ready(function() {
	        // Event listener for when the modal is about to be shown
	        $('#staticBackdrop').on('show.bs.modal', function(event) {
	          var button = $(event.relatedTarget); // Button that triggered the modal
	          var context = button.data('context'); // Extract info from data-* attributes

	          // If the context is "important", check the checkbox; otherwise, uncheck it
	          if (context === 'important') {
	            $('#importantCheckbox').prop('checked', true);
	          } else if(context === 'plan') {
	        	  if (context === 'plan') {
	        		    var minDate = $('#datepicker').attr('min');
	        		    $('#datepicker').val(minDate);
	        		}
	          } else {
	            $('#importantCheckbox').prop('checked', false);
	            $('#datepicker').val('');
	          }
	        });
	      });
	    
	    $(document).ready(function() {
	        $('#important-link').on('click', function(event) {
	            event.preventDefault(); // prevent default link behavior
	            var userId = $(this).data('userid');
	            $.ajax({
	                type: 'GET',
	                url: 'task/showImpTasks/' + userId,
	                success: function(data) {
	                	$('#important-content').removeClass("d-none");
	                    $('#important-content').html(data); // update the #important-content div
	                }
	            });
	        });
	        
	        $('#planned-tag').on('click',function(event){
	        	event.preventDefault();
	        	var userId = $(this).data('userid');
	        	$.ajax({
	        		type: 'GET',
	        		url: 'task/getPlannedTasks/' + userId,
	        		success: function(data){
	                	$('#planned-content').removeClass("d-none");
	                    $('#planned-content').html(data);
	        		}
	        	})
	        	
	        })
	        
	    });
	    
	 
    </script>
		
</body>
</html>