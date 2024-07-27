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
						<li class="nav-item"><a class="nav-link" href="#">Login</a></li>
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
			<div class="col-3 border-end">
				<div class="row mb-2">
					<a href="#" class="text-decoration-none btnMyDay"> <i
						class="bi bi-brightness-high"></i> <!-- <small>My Day</small> -->
						My Day
					</a>
				</div>
				<div class="row mb-2">
					<a href="#" class="text-decoration-none btnImportant"> <i
						class="bi bi-star"></i> <!-- <small>Important</small> -->
						Important
					</a>
				</div>
				<div class="row mb-2">
					<a href="#" class="text-decoration-none btnPlanned"> <i
						class="bi bi-card-list"></i> <!-- <small>Planned</small> -->
						Planned
					</a>
				</div>
				<div class="row mb-2">
					<a href="#" class="text-decoration-none btnAssign"> <i
						class="bi bi-person"></i> <!-- <small>Assigned to me</small>                         -->
						Assigned to me
					</a>
				</div>
				<div class="row mb-2">
					<a href="#" class="text-decoration-none btnTask"> <i
						class="bi bi-check-square"></i> <!-- <small>Tasks</small> -->
						Tasks
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
							<p class="">Tuesday, June 18</p>
						</div>
						<div class="">
							<button type="button" class="btn icon-button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
								<i class="bi bi-patch-plus-fill"></i>
							</button>

						</div>
					</div>
					
					<div> 
					<table class="table table-dark table-hover"  id="table" style="width:100%">
  						<thead class="table-dark">
    						<tr>
								<th>Task Title</th>
								<th>Task Description</th>
								<th>Due Date</th>
								<th>Importance</th>
								<th>Open Details</th>
							</tr>
  						</thead>
 						 <tbody>
    							<c:forEach items="${taskLst}" var="task" >
									<tr>
										<td>${task.taskTitle}</td>
										<td>${task.taskDescription}</td>
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
					<div class=""></div>
				</div>




				<!-- important -->
				<div class="important d-none ms-5 col fetch">
					<div
						class="header d-flex justify-content-evenly align-items-center">
						<h2 class="">Important</h2>
						<div class="">
							<i class="bi bi-patch-plus-fill" style="font-size: 3rem;"></i>
						</div>
					</div>
					<div class="rounded container col-7 my-4"
						style="background-color: rgb(201, 228, 254);">
						<div class="d-flex p-2 align-items-center justify-content-between">
							<div class="d-flex">
								<input type="checkbox" name="checkbox" class="" id="checkbox">
								<div class=" ms-3">
									<span class="d-block">New Task</span> <small
										class="text-secondary">Please Insert a Task</small>
								</div>
							</div>
							<div class="">
								<i class="bi bi-star-fill h4"></i>
							</div>
						</div>
					</div>
					<div class="rounded container col-7 my-4"
						style="background-color: rgb(201, 228, 254);">
						<div class="d-flex p-2 align-items-center justify-content-between">
							<div class="d-flex">
								<input type="checkbox" name="checkbox" class="" id="checkbox">
								<div class=" ms-3">
									<span class="d-block">New Task</span> <small
										class="text-secondary">Please Insert a Task</small>
								</div>
							</div>
							<div class="">
								<i class="bi bi-star-fill h4"></i>
							</div>
						</div>
					</div>
					<div class="rounded container col-7 my-4"
						style="background-color: rgb(201, 228, 254);">
						<div class="d-flex p-2 align-items-center justify-content-between">
							<div class="d-flex">
								<input type="checkbox" name="checkbox" class="" id="checkbox">
								<div class=" ms-3">
									<span class="d-block">New Task</span> <small
										class="text-secondary">Please Insert a Task</small>
								</div>
							</div>
							<div class="">
								<i class="bi bi-star-fill h4"></i>
							</div>
						</div>
					</div>
					<div class="rounded container col-7 my-4"
						style="background-color: rgb(201, 228, 254);">
						<div class="d-flex p-2 align-items-center justify-content-between">
							<div class="d-flex">
								<input type="checkbox" name="checkbox" class="" id="checkbox">
								<div class=" ms-3">
									<span class="d-block">New Task</span> <small
										class="text-secondary">Please Insert a Task</small>
								</div>
							</div>
							<div class="">
								<i class="bi bi-star-fill h4"></i>
							</div>
						</div>
					</div>
				</div>

				<!-- planned -->
				<div class="planned d-none ms-5 col fetch">
					<div
						class="header d-flex justify-content-evenly align-items-center">
						<h2 class="">What are You Planning?</h2>
						<div class="">
							<i class="bi bi-patch-plus-fill" style="font-size: 3rem;"></i>
						</div>
					</div>
					<div class="rounded container col-7 my-4"
						style="background-color: rgb(201, 228, 254);">
						<div class="d-flex p-2 align-items-center justify-content-between">
							<div class="d-flex">
								<input type="checkbox" name="checkbox" class="" id="checkbox">
								<div class=" ms-3">
									<span class="d-block">New Task</span> <small
										class="text-secondary">Please Insert a Task</small>
								</div>
							</div>
							<div class="">
								<i class="bi bi-star-fill h4"></i>
							</div>
						</div>
					</div>
					<div class="rounded container col-7 my-4"
						style="background-color: rgb(201, 228, 254);">
						<div class="d-flex p-2 align-items-center justify-content-between">
							<div class="d-flex">
								<input type="checkbox" name="checkbox" class="" id="checkbox">
								<div class=" ms-3">
									<span class="d-block">New Task</span> <small
										class="text-secondary">Please Insert a Task</small>
								</div>
							</div>
							<div class="">
								<i class="bi bi-star-fill h4"></i>
							</div>
						</div>
					</div>
					<div class="rounded container col-7 my-4"
						style="background-color: rgb(201, 228, 254);">
						<div class="d-flex p-2 align-items-center justify-content-between">
							<div class="d-flex">
								<input type="checkbox" name="checkbox" class="" id="checkbox">
								<div class=" ms-3">
									<span class="d-block">New Task</span> <small
										class="text-secondary">Please Insert a Task</small>
								</div>
							</div>
							<div class="">
								<i class="bi bi-star-fill h4"></i>
							</div>
						</div>
					</div>
					<div class="rounded container col-7 my-4"
						style="background-color: rgb(201, 228, 254);">
						<div class="d-flex p-2 align-items-center justify-content-between">
							<div class="d-flex">
								<input type="checkbox" name="checkbox" class="" id="checkbox">
								<div class=" ms-3">
									<span class="d-block">New Task</span> <small
										class="text-secondary">Please Insert a Task</small>
								</div>
							</div>
							<div class="">
								<i class="bi bi-star-fill h4"></i>
							</div>
						</div>
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

				<!-- task -->
				<div class="task d-none ms-5 col fetch">
					<div
						class="header d-flex justify-content-evenly align-items-center">
						<h2 class="">Tasks</h2>
						<div class="">
							<i class="bi bi-patch-plus-fill" style="font-size: 3rem;"></i>
						</div>
					</div>
					<div class="rounded container col-7 my-4"
						style="background-color: rgb(201, 228, 254);">
						<div class="d-flex p-2 align-items-center justify-content-between">
							<div class="d-flex">
								<input type="checkbox" name="checkbox" class="" id="checkbox">
								<div class=" ms-3">
									<span class="d-block">New Task</span> <small
										class="text-secondary">Please Insert a Task</small>
								</div>
							</div>
							<div class="">
								<i class="bi bi-star-fill h4"></i>
							</div>
						</div>
					</div>
					<div class="rounded container col-7 my-4"
						style="background-color: rgb(201, 228, 254);">
						<div class="d-flex p-2 align-items-center justify-content-between">
							<div class="d-flex">
								<input type="checkbox" name="checkbox" class="" id="checkbox">
								<div class=" ms-3">
									<span class="d-block">New Task</span> <small
										class="text-secondary">Please Insert a Task</small>
								</div>
							</div>
							<div class="">
								<i class="bi bi-star-fill h4"></i>
							</div>
						</div>
					</div>
					<div class="">
						<a href="#collapse" data-bs-toggle="collapse"
							aria-expanded="false" class="collapsing text-decoration-none">
							<h5 class="text-center align-items-center">
								<span class="dropdown-toggle me-2"></span> Completed
							</h5>
						</a>
						<div class="rounded container col-7 my-4" id="collapse"
							style="background-color: rgb(201, 228, 254);">
							<div
								class="d-flex p-2 align-items-center justify-content-between">
								<div class="d-flex">
									<input type="checkbox" name="checkbox" class="" id="checkbox">
									<div class=" ms-3">
										<span class="d-block">New Task</span> <small
											class="text-secondary">Please Insert a Task</small>
									</div>
								</div>
								<div class="">
									<i class="bi bi-star-fill h4"></i>
								</div>
							</div>
						</div>
						<div class="rounded container col-7 my-4" id="collapse"
							style="background-color: rgb(201, 228, 254);">
							<div
								class="d-flex p-2 align-items-center justify-content-between">
								<div class="d-flex">
									<input type="checkbox" name="checkbox" class="" id="checkbox">
									<div class=" ms-3">
										<span class="d-block">New Task</span> <small
											class="text-secondary">Please Insert a Task</small>
									</div>
								</div>
								<div class="">
									<i class="bi bi-star-fill h4"></i>
								</div>
							</div>
						</div>
						<div class="rounded container col-7 my-4" id="collapse"
							style="background-color: rgb(201, 228, 254);">
							<div
								class="d-flex p-2 align-items-center justify-content-between">
								<div class="d-flex">
									<input type="checkbox" name="checkbox" class="" id="checkbox">
									<div class=" ms-3">
										<span class="d-block">New Task</span> <small
											class="text-secondary">Please Insert a Task</small>
									</div>
								</div>
								<div class="">
									<i class="bi bi-star-fill h4"></i>
								</div>
							</div>
						</div>
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
							<form:select path="catagoryID" class="form-select" aria-label="Default select example">
								<option selected>Open this select menu</option>
								<c:forEach items="${catLst}" var="cat">
									<option value="${cat.catagoryID}">${cat.catName}</option>
								</c:forEach>
							</form:select>
							
        					 <input style="background:#4b5154; outline:none;border:none;" type="date" id="datepicker" name="dueDate" pattern="\d{4}-\d{2}-\d{2}"/>
        					 <form:label path="isImportant">Important</form:label>
        					 <form:checkbox path="isImportant" value="true"/>
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
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-dialog modal-dialog-centered">
      	<form:form modelAttribute="task" action="upgradeTask" method="post">
      		<form:input path="taskTitle" ></form:input>
      	</form:form>
      	
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<script type="module" src="resources/js/script.js"></script>  
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script>
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
	                    $("#taskTitle").val(data.taskTitle);
	                    $("#taskDescription").val(data.taskDescription);
	                    $("#catagoryID").val(data.catagoryID);
	                    $("#status").val(data.status);
	                    $("#isImportant").prop('checked', data.isImportant);
	                    $("#dueDate").val(data.dueDate);

	                    $("#detailModal").modal('show');

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