<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="db.DB" %>
<%@ page import ="dao.TodoADO" %>
<%@ page import = "model.model" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo App</title>
<link rel="stylesheet" href="style.css">

<%@ include file="component/all_css.jsp" %>
</head>

<body>

<%@ include file="component/header.jsp" %>

<div class="container mt-4">


    <!-- SUCCESS MESSAGE -->
    <%
        String sucMsg = (String) session.getAttribute("succ");
        if (sucMsg != null) {
    %>
        <div class="alert alert-success text-center">
            <%= sucMsg %>
        </div>
    <%
            session.removeAttribute("succ");
        }
    %>

    <!-- FAIL MESSAGE -->
    <%
        String failMsg = (String) session.getAttribute("fail");
        if (failMsg != null) {
    %>
        <div class="alert alert-danger text-center">
            <%= failMsg %>
        </div>
    <%
            session.removeAttribute("fail");
        }
    %>

    <div class="text-end mb-3">
        <a href="add_todo.jsp" class="btn btn-primary">
            + Add Todo
        </a>
    </div>

    <table class="table table-bordered table-striped text-center">
        <thead class="table-success">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Todo</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <%
                TodoADO ado = new TodoADO(DB.getConn());
                List<model> list = ado.getTodo();

                if (list != null && !list.isEmpty()) {
                    for (model t : list) {
            %>
            <tr>
                <td><%= t.getId() %></td>
                <td><%= t.getName() %></td>
                <td><%= t.getTodo() %></td>

                <td>
                    <%
                        if ("Completed".equals(t.getStatus())) {
                    %>
                        <span class="badge bg-success">Completed</span>
                    <%
                        } else {
                    %>
                        <span class="badge bg-warning text-dark">Pending</span>
                    <%
                        }
                    %>
                </td>

                <td>
                    <a href="edit.jsp?id=<%= t.getId() %>" 
                       class="btn btn-sm btn-success">
                        Edit
                    </a>

                    <a href="delete?id=<%= t.getId() %>" 
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('Are you sure you want to delete this todo?')">
                        Delete
                    </a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5" class="text-center text-danger">
                    No Todo Found
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<%@ include file="component/footer.jsp" %>

</body>
</html>
