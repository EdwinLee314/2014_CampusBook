<%@ page import="pojo.Book" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bookBean" scope="application" class="dao.BookBean"/>
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
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-4 column">
						<%@ include file="adv.html" %>
				</div>
				<style>
					.jumbotron{
						background: url("<%=asset%>/img/headbg.jpg") no-repeat center center; 
						-webkit-background-size: 100% 100%;
						-moz-background-size: 100% 100%;
						-o-background-size: 100% 100%;
						background-size: 100% 100%;
						padding-top:1em;
					}
					.push-spaces{
						margin-bottom:20em;
					}
					.search{
						padding-top:5em;
					}
				</style>
				<div class="col-md-8 column">
					<div class="jumbotron">
					<div class="container push-spaces">
						<h2>
							Compus's biggest textbook market.
						</h2>
						<p>
							The cheapest way to buy textbooks - because there's no commission. Just two happy students.
						</p>
						<p  class="search">
							<form action="<%=base%>?action=search" method="post">
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									<span id="search_concept">Filter by</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
									<li><a href="#title">Title</a></li>
									<li><a href="#isbn">ISBN</a></li>
									<li><a href="#unitcode">UnitCode</a></li>
									</ul>
								</div>
								<input type="hidden" name="search_param" value="all" id="search_param">         
								<input type="text" class="form-control" name="search_data" placeholder="Search term...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
								</span>
							</div>
							</form>
							<script type="text/javascript">
							$(document).ready(function(e){
								$('.search-panel .dropdown-menu').find('a').click(function(e) {
								e.preventDefault();
								var param = $(this).attr("href").replace("#","");
								var concept = $(this).text();
								$('.search-panel span#search_concept').text(concept);
								$('.input-group #search_param').val(param);
								});
							});
							</script>
						</p>
						
					</div>
					</div>
					
					<br>
					
					<div>
						<p>The latest second hand textbooks listed...</p>
						<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>ISBN</th>
								<th>UnitCode</th>
								<th>Title</th>
								<th>Author</th>
								<th>Detail</th>
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
														"<td>" + tBook.getIsbn() + "</td>" +
														"<td>" + tBook.getUnitCode() + "</td>" +
														"<td>" + tBook.getTitle() + "</td>" +
														"<td>" + tBook.getAuthor() + "</td>" +
														"<td><a href=" + base + "?action=bookDetail&bookId="+ bookId.toString() + ">Detail</a></td>" +
														"<tr>");
								}
							}
						
						%>				
						</tbody>
						</table>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>