<%@ page import="pojo.User" %>
<%@ page import="pojo.Book" %>
<%@ page import="pojo.Copy" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bookBean" scope="application" class="dao.BookBean"/>
<jsp:useBean id="usedBookBean" scope="application" class="dao.UsedBookBean"/>
<jsp:useBean id="copyBean" scope="application" class="dao.CopyBean"/>
<%
	String action = request.getParameter("action");
  if (action!=null && action.equals("sellUsedBookSubmit")) {
		try{
			String isbn = request.getParameter("isbn");
			String unit_code = request.getParameter("unit_code");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			Book tBook = new Book();
			tBook.setIsbn(isbn);
			tBook.setUnitCode(unit_code);
			tBook.setTitle(title);
			tBook.setAuthor(author);
			
			out.println(author);
			
			User tUser = (User)session.getAttribute("loginUser");
			int userId = tUser.getUserId();
			String description = request.getParameter("description");
			String price = request.getParameter("price");
			String conditions = request.getParameter("conditions");
			Copy tCopy = new Copy();
			tCopy.setSellerId(userId);
			tCopy.setDescription(description);
			tCopy.setPrice(price);
			tCopy.setConditions(conditions);
			
			if(usedBookBean.createUsedBook(tBook, tCopy)){
				out.println("Successed to sell used book.");
			}else{
				out.println("Fail to sell used book, try again.");
			}
			
		}
		catch (Exception e) {
      out.println("Error happened in selling used book");
    }
	}
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Sell Used Book - CampusBook</title>
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
	  
		 
    <div class="col-md-8 well">
		<form class="form-horizontal" action="<%=base%>?action=sellUsedBookSubmit" method="post">
		<fieldset>

			<!-- Form Name -->
			<legend>SELL YOUR TEXTBOOK</legend>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="isbn">ISBN</label>  
			  <div class="col-md-5">
			  <input id="isbn" name="isbn" type="text" placeholder="placeholder" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="unit_code">Unit Code</label>  
			  <div class="col-md-5">
			  <input id="unit_code" name="unit_code" type="text" placeholder="placeholder" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>

			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="title">Title</label>  
			  <div class="col-md-5">
			  <input id="title" name="title" type="text" placeholder="placeholder" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>
		
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="author">Author</label>  
			  <div class="col-md-4">
			  <input id="author" name="author" type="text" placeholder="placeholder" class="form-control input-md" required="">
			  <span class="help-block">help</span>  
			  </div>
			</div>
			
			<!-- Prepended text-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="price">Sell price</label>
				<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">$</span>
					<input id="price" name="price" class="form-control" placeholder="" type="text" required="">
				</div>
				<p class="help-block">help</p>
				</div>
			</div>
			
			<!-- Select Basic -->
			<div class="form-group">
		  <label class="col-md-4 control-label" for="conditions">Condition</label>
		  <div class="col-md-4">
			<select id="conditions" name="conditions" class="form-control">
			  <option value="Excellent">Excellent</option>
			  <option value="Good">Good</option>
			  <option value="Average">Average</option>
			  <option value="Poor">Poor</option>
			</select>
		  </div>
			</div>

			<!-- Textarea -->
			<div class="form-group">
		  <label class="col-md-4 control-label" for="description">Description</label>
		  <div class="col-md-4">                     
			<textarea class="form-control" id="description" name="description"></textarea>
		  </div>
			</div>
			
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="submit"></label>
			  <div class="col-md-4">
				<button id="submit" name="submit" class="btn btn-success btn-lg btn-block">Sell your used book</button>
			  </div>
			</div>

		</fieldset>
		</form>
		
		</div>
</div>
</div>

</body>
</html>