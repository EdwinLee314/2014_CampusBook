<%@ page import="pojo.Book" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bookBean" scope="application" class="dao.BookBean"/>
<%
	String action = request.getParameter("action");
  if (action!=null && action.equals("adminAddBookSubmit")) {
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
			if(bookBean.findBookByIsbn(isbn) == null){
				bookBean.createBook(tBook);
				out.print("The new book is been added");
			}else{
				out.print("The isbn is been used");
			}
			
			
		}
		catch (Exception e) {
      out.println("Error deleting the selected book");
    }
	}
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Add Book - CampusBook</title>
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
		<form class="form-horizontal" action="<%=base%>?action=adminAddBookSubmit" method="post">
		<fieldset>

			<!-- Form Name -->
			<legend>Add NEW BOOK</legend>
			
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
			
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="submit"></label>
			  <div class="col-md-4">
				<button id="submit" name="submit" class="btn btn-success btn-lg btn-block">Add new book</button>
			  </div>
			</div>

		</fieldset>
		</form>
		
		</div>
</div>
</div>

</body>
</html>