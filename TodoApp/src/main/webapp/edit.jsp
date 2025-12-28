<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "dao.TodoADO" %>
<%@ page import = "db.DB" %>
<%@ page import = "model.model" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Todo</title>
<link rel="stylesheet" href="style.css">

<%@include file="component/all_css.jsp"%>
</head>
<body>
	<%@include file="component/header.jsp"%>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Edit Todo</h3>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						TodoADO ado = new TodoADO(DB.getConn());
						model t = ado.getTodoById(id);
						%>
						<form action="update" method="post">
							<input type="hidden" value="<%=t.getId()%>" name="hiddenId">
							<div class="form-group">
								<label for="exampleInputName">Name</label> <input type="text"
									class="form-control" id="exampleInputName"
									aria-describedby="textHelp" name="uname"
									value="<%=t.getName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputText">Todo</label> <input type="text"
									class="form-control" id="exampleInputText"
									aria-describedby="textHelp" name="todo"
									value="<%=t.getTodo()%>">
							</div>

							<div class="form-group">
								<label for="inputState">Status</label> <select name="ustatus"
									class="form-control">
									<%
									if ("Pending".equals(t.getStatus())) {
									%>
									<option value="Pending" selected>Pending</option>
									<option value="Completed">Completed</option>
									<%
									} else {
									%>
									<option value="Completed" selected>Completed</option>
									<option value="Pending">Pending</option>
									<%
									}
									%>
								</select>

							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">UPDATE</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>


</body>
</html>