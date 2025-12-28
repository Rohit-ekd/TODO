<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Todo</title>
<link rel="stylesheet" href="style.css">
<%@include file = "component/all_css.jsp" %>
</head>
<body>
<%@include file="component/header.jsp" %>

<div class="container">
	<div class="row p-5">
		<div class = "col-md-6 offset-md-3">
			<div class="card">
				<div class = "card-body">
				<h3 class="text-center text-success">Add Todo</h3>
					<form action="AddServlet" method="post">
					
					<div class="form-group">
							<label for="exampleInputName">Name</label>
							<input type="text" class="form-control" id="exampleInputName" aria-describedby="textHelp" name="uname">
						</div>
						<div class="form-group">
							<label for="exampleInputText">Todo</label>
							<input type="text" class="form-control" id="exampleInputText" aria-describedby="textHelp" name="todo">
						</div>

						<div class="form-group">
							<label for="inputState">Status</label>
							<select id ="inputState" class="form-control" name="ustatus">
							<option selected>--Select--</option>
							<option value="Pending">Pending</option>
							<option value="Completed">Completed</option>
							
							</select>
						</div>
						
						<div class="text-center">
						<button type="submit" class="btn btn-primary">ADD</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="component/footer.jsp" %>


</body>
</html>