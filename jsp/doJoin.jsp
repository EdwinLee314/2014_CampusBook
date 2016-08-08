<%@ page import="pojo.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="userBean" scope="application" class="dao.UserBean"/>


<!DOCTYPE html>
<html>
<head>
	<title>Join - CampusBook</title>
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
		
		User tuser = new User();
		tuser.setEmail(email);  
		tuser.setPassword(password); 
		tuser.setNickname(nickname);
		tuser.setFirstname(firstname);
		tuser.setSurname(surname);
		tuser.setPostcode(postcode);
		tuser.setPhone(phone);
		tuser.setGender(gender);
		
		if(userBean.findJoin(tuser) ){
			userBean.createUser(tuser);
			//write to session
			User sUser = userBean.findUser(tuser);
			session.setAttribute("loginUser", sUser);
			out.println("welcome !!");
		}else{
			out.println("the email has been used!!");			
		}
   
%>
Testing
</body>
</html>