<%@ page import="pojo.Book" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bookBean" scope="application" class="dao.BookBean"/>
<%
	String action = request.getParameter("action");
  if (action!=null && action.equals("deleteBook")) {
		try{
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			bookBean.deleteBook(bookId);
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
<title>Book - CampusBook</title>
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
		<h2>The book listed...</h2>
		<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>Book Id</th>
			<th>ISBN</th>
			<th>Unit Code</th>
			<th>Title</th>
			<th>Author</th>
			<th>Delete</th>
		</tr>
		</thead>
		<tbody>
		<%
			Hashtable allBooks = bookBean.getAllBooks();
			if(allBooks.isEmpty()){
				out.println("No books in database");
			}else{
				Enumeration bookIds = allBooks.keys();
				while (bookIds.hasMoreElements()) {
					Object bookId = bookIds.nextElement();
					Book tBook = (Book)allBooks.get(bookId);
				out.println("<tr>" + 
										"<td>" + bookId.toString() + "</td>" +
										"<td>" + tBook.getIsbn() + "</td>" +
										"<td>" + tBook.getUnitCode() + "</td>" +
										"<td>" + tBook.getTitle() + "</td>" +
										"<td>" + tBook.getAuthor() + "</td>" +
										"<td><a href=" + base + "?action=deleteBook&bookId="+ bookId.toString() + ">Delete</a></td>" +
										"<tr>");
				}
			}
		
		%>
		</tbody>
		</table>
		</div>
</div>
</div>

</body>
</html>