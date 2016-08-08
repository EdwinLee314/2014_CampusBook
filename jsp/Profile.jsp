<%@ page import="pojo.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
			<%@ include file="menuUser.jsp" %>
		</div>
	  <%	User tUser = (User)session.getAttribute("loginUser");%>
		
    <div class="col-md-8 well">
		<form class="form-horizontal" action="<%=base%>?action=editProfile" method="post">
		<fieldset>

			<!-- Form Name -->
			<legend>EDIT PROFILE<small>Register at：<%=tUser.getRegisterat() %> </small></legend>
			
			<input type="hidden" name="users_id" value="<%=tUser.getUserId() %>"/>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="email">Email</label>  
				<div class="col-md-5">
				<input id="email" name="email" type="email" placeholder="<%=tUser.getEmail() %>" value="<%=tUser.getEmail() %>" class="form-control input-md" required="" readonly>
				<span class="help-block">Email could not be edited</span>  
				</div>
			</div>

			<!-- Password input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="password">Password</label>
			  <div class="col-md-5">
				<input id="password" name="password" type="password" placeholder="" class="form-control input-md" required="">
				<span class="help-block">Password needed to edit profile</span>
			  </div>
			</div>
			
			<hr>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="nickname">Nickname</label>  
			  <div class="col-md-5">
			  <input id="nickname" name="nickname" type="text" placeholder="<%=tUser.getNickname() %>"value="<%=tUser.getNickname() %>" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="firstname">First name</label>  
			  <div class="col-md-5">
			  <input id="firstname" name="firstname" type="text" placeholder="<%=tUser.getFirstname() %>"value="<%=tUser.getFirstname() %>" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>

			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="surname">Surname</label>  
			  <div class="col-md-5">
			  <input id="surname" name="surname" type="text" placeholder="<%=tUser.getSurname() %>"value="<%=tUser.getSurname() %>" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>

			<hr>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="phone">PhoneNo</label>  
			  <div class="col-md-4">
			  <input id="phone" name="phone" type="text" placeholder="<%=tUser.getPhone() %>"value="<%=tUser.getPhone() %>" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>

			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="postcode">Postcode</label>  
			  <div class="col-md-4">
			  <input id="postcode" name="postcode" type="text" placeholder="<%=tUser.getPostcode() %>"value="<%=tUser.getPostcode() %>" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>

			<!-- Select Basic -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="gender">Gender</label>
			  <div class="col-md-4">
				<select id="gender" name="gender" class="form-control">
					<option value="Male">Male</option>
					<option value="Female">Female</option>
				</select>
			  </div>
			</div>
			
			<hr>
			
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="submit"></label>
			  <div class="col-md-4">
				<button id="submit" name="submit" class="btn btn-success btn-lg btn-block">Update</button>
			  </div>
			</div>

		</fieldset>
		</form>
	</div>
</div>
</div>

</body>
</html>