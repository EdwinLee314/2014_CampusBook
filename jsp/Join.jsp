<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<div class="container">
<div class="row">
		<div class="col-md-4 column">
			<%@ include file="adv.html" %>
		</div>
	
    <div class="col-md-8 well">
		<form class="form-horizontal" action="<%=base%>?action=joinSubmit" method="post">
		<fieldset>

			<!-- Form Name -->
			<legend>JOIN COMPUSBOOK</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="email">Email</label>  
				<div class="col-md-5">
				<input id="email" name="email" type="email" placeholder="placeholder" class="form-control input-md" required="">
				<span class="help-block">help</span>  
				</div>
			</div>

			<!-- Password input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="password">Password</label>
			  <div class="col-md-5">
				<input id="password" name="password" type="password" placeholder="placeholder" class="form-control input-md" required="">
				<span class="help-block">help</span>
			  </div>
			</div>
			
			<hr>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="nickname">Nickname</label>  
			  <div class="col-md-5">
			  <input id="nickname" name="nickname" type="text" placeholder="placeholder" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="firstname">First name</label>  
			  <div class="col-md-5">
			  <input id="firstname" name="firstname" type="text" placeholder="placeholder" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>

			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="surname">Surname</label>  
			  <div class="col-md-5">
			  <input id="surname" name="surname" type="text" placeholder="placeholder" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>

			<hr>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="phone">PhoneNo</label>  
			  <div class="col-md-4">
			  <input id="phone" name="phone" type="text" placeholder="placeholder" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>

			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="postcode">Postcode</label>  
			  <div class="col-md-4">
			  <input id="postcode" name="postcode" type="text" placeholder="placeholder" class="form-control input-md" required="">
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
				<button id="submit" name="submit" class="btn btn-success btn-lg btn-block">Join</button>
			  </div>
			</div>

		</fieldset>
		</form>
	</div>
</div>
</div>

</body>
</html>