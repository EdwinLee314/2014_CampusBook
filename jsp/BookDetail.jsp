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
<title>CampusBook</title>
<%@ include file="src.jsp" %>
</head>
<body>
<%@ include file="header.jsp" %>
<br>
<br>
<br>
<div class="container">
<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="adv.html" %>
		</div>
		<%
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			Book book = bookBean.findBookById(bookId);
			String title = book.getTitle();
			String author = book.getAuthor();
			String isbn = book.getIsbn();
		%>
		<div class="col-md-8">
		<article>

		<div class="page-header">	
			<h1 class="textbook-title"><%=title%></h1>
			<h2 class="textbook-authors"><%=author%></h2>
		</div>

		<div class="row">
				<div class="col-md-4 hidden-xs hidden-sm">
					<i class="fa fa-book large-icon"></i>
				</div>

				<div class="col-md-8">
					<p class="textbook-isbn h4">ISBN <%=isbn%></p>
					<p class="textbook-title h4"><strong><%=title%> </strong></p>
					<p class="textbook-author h4"><%=author%></p> 
				</div>
		</div>
		<hr>

		<ul class="nav nav-tabs">
			<li class="active"><a href="#textbooks" data-toggle="tab"><h4>Buy used book</h4></a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane active" id="textbooks">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Seller</th>
								<th>Description</th>
								<th>Price</a></th>
								<th>Condition</th>
								<th>Add to Cart</th>
							</tr>
						</thead>
						
						<tbody>
							<%
								Hashtable usedBooks = usedBookBean.getSellingUsedBookByBookId(bookId);
								if(usedBooks.isEmpty()){
									out.println("No books in database");
								}else{
									Enumeration bookIds = usedBooks.keys();
									while (bookIds.hasMoreElements()) {
										Object booksId = bookIds.nextElement();
										UsedBook tUsedBook = (UsedBook)usedBooks.get(booksId);
										User tSeller = tUsedBook.getSeller();
										Copy tCopy = tUsedBook.getCopy();
									out.println("<tr>" + 
															"<td>" + tSeller.getNickname() + "</td>" +
															"<td>" + tCopy.getDescription() + "</td>" +
															"<td> $" + tCopy.getPrice() + "</td>" +
															"<td>" + tCopy.getConditions() + "</td>" +
															"<td><a href=" + base + "?action=addToCart&copyId="+ tCopy.getCopyId() + ">Buy</a></td>" +
															"<tr>");
									}
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</article>
		
		</div>
		
</div>
</div>

</body>
</html>				
				