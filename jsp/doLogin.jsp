<%@ page import="pojo.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="userBean" scope="application" class="dao.UserBean"/>

<!DOCTYPE html>
<html>
<head>
<title>Login - CampusBook</title>
<%@ include file="src.jsp" %>
</head>
<body>
<%@ include file="header.jsp" %>
<br>
<br>
<br>
<%
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User tuser = new User();
		tuser.setEmail(email);  
		tuser.setPassword(password);
		
		User sUser = new User();
		sUser = userBean.findUser(tuser);
		if(sUser != null){
		
			session.setAttribute("loginUser", sUser);
			out.println("welcome !!");
		}else{
		
			if(email.equals("admin@admin") && password.equals("adminadmin")){
				session.setAttribute("admin", email);
				out.println("welcome admin !!");
			}else{
				out.println("Login mistake");	
			}
		}
%>
Testing
</body>
</html>