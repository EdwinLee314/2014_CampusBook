<%@ page import="pojo.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="userBean" scope="application" class="dao.UserBean"/>


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
<br>
<br>
<%
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String firstname = request.getParameter("firstname");
		String surname = request.getParameter("surname");
		int phone = Integer.parseInt(request.getParameter("phone"));
		int postcode = Integer.parseInt(request.getParameter("postcode"));
		String gender = request.getParameter("gender");
		int users_id = Integer.parseInt(request.getParameter("users_id"));
		
		User tuser = new User();
		tuser.setEmail(email);  
		tuser.setPassword(password); 
		tuser.setNickname(nickname);
		tuser.setFirstname(firstname);
		tuser.setSurname(surname);
		tuser.setPostcode(postcode);
		tuser.setPhone(phone);
		tuser.setGender(gender);
		tuser.setUserId(users_id);
		/*
		out.println(email);
			out.println(nickname);
				out.println(firstname);
					out.println(surname);
						out.println(gender);
		*/
		if(userBean.findUser(tuser) != null ){
			userBean.editUser(tuser);
			//write to session
			User sUser = userBean.findUser(tuser);
			session.setAttribute("loginUser", sUser);
			out.println("edit !!");
		}else{
			out.println("edit error!!");			
		}
		
   
%>
Testing
</body>
</html>