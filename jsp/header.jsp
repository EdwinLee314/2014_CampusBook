<%
  String base = (String) application.getAttribute("base");
%>
<header>
<div class="container">
	<div class="row clearfix">
	<div class="col-md-12 column">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			
			<div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
          </button>
					
          <a class="navbar-brand" href="<%=base%>">CompusBook</a>
      </div>
			
			<div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="<%=base%>">Home</a></li>
          </ul>
					<ul class="nav navbar-nav">
            <li><a href="<%=base%>?action=userCenter">UserCenter</a></li>
          </ul>
				
          <ul class="nav navbar-nav navbar-right">
					
					<% 
						boolean flag = false;
						if (session.getAttribute("loginUser") == null)
							flag = false;
						else
							flag = true;
							
						if( flag == false){	
							if(request.getSession().getAttribute("admin") == null)
								flag = false;
							else
								flag = true;
						}
						
						if(flag == false){	%>
						<li><a href="<%=base%>?action=join"><span class="glyphicon glyphicon-plus"></span> Join</a></li>
						<li><a href="<%=base%>?action=login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<% }else{ %>
						<li><a href="<%=base%>?action=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					<% } %>	
					</ul>
      </div>
			
		</nav>
	</div>
	</div>
</div>
</header>