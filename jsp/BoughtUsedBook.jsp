<%@ page import="pojo.User" %>
<%@ page import="pojo.Book" %>
<%@ page import="pojo.Copy" %>
<%@ page import="pojo.UsedBook" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bookBean" scope="application" class="dao.BookBean"/>
<jsp:useBean id="usedBookBean" scope="application" class="dao.UsedBookBean"/>
<jsp:useBean id="copyBean" scope="application" class="dao.CopyBean"/>

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
		<h2>The bought book listed...</h2>
		<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>Seller</th>
			<th>ISBN</th>
			<th>Unit Code</th>
			<th>Title</th>
			<th>Author</th>
			<th>Price</th>
			<th>Conditions</th>
			<th>Description</th>
		</tr>
		</thead>
		<tbody>
		<%
			User tUser = (User)session.getAttribute("loginUser");
			int userId = tUser.getUserId();
			
			Hashtable usedBooks = usedBookBean.getBoughtUsedBookByBuyerId(userId);
			if(usedBooks.isEmpty()){
				out.println("No books in database");
			}else{
				Enumeration bookIds = usedBooks.keys();
				while (bookIds.hasMoreElements()) {
					Object bookId = bookIds.nextElement();
					UsedBook tUsedBook = (UsedBook)usedBooks.get(bookId);
					Book tBook = tUsedBook.getBook();
					Copy tCopy = tUsedBook.getCopy();
					User seller = tUsedBook.getSeller();
					
				out.println("<tr>" + 
										"<td>" + seller.getNickname() + "</td>" +
										"<td>" + tBook.getIsbn() + "</td>" +
										"<td>" + tBook.getUnitCode() + "</td>" +
										"<td>" + tBook.getTitle() + "</td>" +
										"<td>" + tBook.getAuthor() + "</td>" +
										"<td> $" + tCopy.getPrice() + "</td>" +
										"<td>" + tCopy.getConditions() + "</td>" +
										"<td>" + tCopy.getDescription() + "</td>" +
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