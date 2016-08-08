<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<div class="container">
<div class="row">
	<div class="col-md-4 column">
		<%@ include file="adv.html" %>
	</div>
	
  <div class="col-md-8 well">
	<form class="form-horizontal" action="<%=base%>?action=loginSubmit" method="post">
	<fieldset>

				<!-- Form Name -->
				<legend>LOGIN TO COMPUSBOOK</legend>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">Email</label>
					<div class="col-md-8">
						<input 	id="email" name="email" 
								type="email" placeholder="Email..." class="form-control input-md" required>
						<span class="help-block" id = "help_text1">&nbsp;</span>
					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">Password</label>
					<div class="col-md-8">
						<input 	id="password" name="password" 
								type="password" placeholder="Password..." class="form-control input-md" required>
						<span class="help-block" id = "help_text2">&nbsp;</span>
					</div>
				</div>
				
				<!-- Button (Double) -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="reset">&nbsp;</label>
					<div class="col-md-8">
						<button  type="reset" class="btn ">Reset</button>
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</div>
	</fieldset>
	</form>
	</div>
</div>	
</div>
</body>

</html>