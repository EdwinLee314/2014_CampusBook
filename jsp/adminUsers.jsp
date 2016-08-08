<%@ page import="pojo.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="userBean" scope="application" class="dao.UserBean"/>
<%
	String action = request.getParameter("action");
  if (action!=null && action.equals("deleteUser")) {
		try{
			int userId = Integer.parseInt(request.getParameter("userId"));
			userBean.deleteUser(userId);
		}
		 catch (Exception e) {
      out.println("Error deleting the selected user");
    }
	}
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Profile - CampusBook</title>
<%@ include file="src.jsp" %>
</head>
<body>
<%@ include file="header.jsp" %>
<br>
<br>
<br>
<div class="container">
<div class="row">
		<div class="col-md-4 column">
			<%@ include file="menuAdmin.jsp" %>
		</div>
	  
		 
    <div class="col-md-8 well">
		<h2>The user listed...</h2>
		<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>User Id</th>
			<th>Email</th>
			<th>Nickname</th>
			<th>Firstname</th>
			<th>Surname</th>
			<th>Phone</th>
			<th>Postcode</th>
			<th>Gender</th>
			<th>Delete</th>
		</tr>
		</thead>
		<tbody>
		<%
			Hashtable allUsers = userBean.getAllUsers();
			Enumeration userIds = allUsers.keys();
			while (userIds.hasMoreElements()) {
				Object userId = userIds.nextElement();
				User tUser = (User)allUsers.get(userId);
			out.println("<tr>" + 
									"<td>" + userId.toString() + "</td>" +
									"<td>" + tUser.getEmail() + "</td>" +
									"<td>" + tUser.getNickname() + "</td>" +
									"<td>" + tUser.getFirstname() + "</td>" +
									"<td>" + tUser.getSurname() + "</td>" +
									"<td>" + tUser.getPhone() + "</td>" +
									"<td>" + tUser.getPostcode() + "</td>" +
									"<td>" + tUser.getGender() + "</td>" +
									"<td><a href=" + base + "?action=deleteUser&userId="+ userId.toString() + ">Delete</a></td>" +
									"<tr>");
			}
		
		%>
		</tbody>
		</table>
		</div>
</div>
</div>

</body>
</html>