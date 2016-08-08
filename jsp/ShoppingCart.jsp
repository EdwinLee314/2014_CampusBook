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
<title>ShoppingCart - CampusBook</title>
<%@ include file="src.jsp" %>
</head>
<%
	Hashtable shoppingCart = (Hashtable) session.getAttribute("shoppingCart");
	if (shoppingCart==null)
    shoppingCart = new Hashtable(10);
		
	String action = request.getParameter("action");
  if (action!=null && action.equals("addToCart")) {
    try {
      int copyId = Integer.parseInt(request.getParameter("copyId"));
      UsedBook usedBook = usedBookBean.getSellingUsedBookByCopyId(copyId);
			
			if(usedBook != null){
				shoppingCart.remove(Integer.toString(copyId));
				shoppingCart.put(Integer.toString(copyId), usedBook);
				session.setAttribute("shoppingCart", shoppingCart);
			}
			
    }
    catch (Exception e) {
      out.println("Error adding the selected product to the shopping cart");
    }
  }
	
	if (action!=null && action.equals("removeFromCart")) {
    try {
      int copyId = Integer.parseInt(request.getParameter("copyId"));
      shoppingCart.remove(Integer.toString(copyId));
    }
    catch (Exception e) {
      out.println("Error deleting the selected item from the shopping cart");
    }
  }
%>

<body>
<%@ include file="header.jsp" %>
<br>
<br>
<br>

<div class="container">
<div class="row clearfix">
	<div class="row">
		<div class="col-md-9">
			<ul class="breadcrumb">
				<li><a href="#"> <span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">View Shopping Cart</li>
			</ul>
		</div>
	</div>
	<div class="row well">	
			<h1> Shopping Cart <span class="glyphicon glyphicon-shopping-cart"></span></h1>
	</div>

	<hr>
	<div class="panel panel-default">
		<table class="table">
			<thead>
				<tr>
					<th>ISBN</th>
					<th>Title</th>
					<th>Seller</th>
					<th>Condition</th>
					<th>Price</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
<%
    Enumeration en = shoppingCart.elements();
		int total = 0;
    while (en.hasMoreElements()) {
      UsedBook item = (UsedBook) en.nextElement();
%>
				<tr>
					<th><%=item.getBook().getIsbn()%></th>
					<th><a href="<%=base %>?action=bookDetail&bookId=<%=item.getBook().getBookId() %>"><%=item.getBook().getTitle() %></a></th>
					<td><%=item.getSeller().getNickname()%></td>
					<td><%=item.getCopy().getConditions()%></td>
					<td>$<%=item.getCopy().getPrice()%></td>
					<td><a href="<%=base %>?action=removeFromCart&copyId=<%=item.getCopy().getCopyId() %>">Remove</a></th>
				</tr>
			
<%
			total = total + Integer.parseInt(item.getCopy().getPrice());
    }
%>		
			</tbody>
		</table>
		<div class="panel-footer"><h3 class="text-right"><span class="label label-default bg">Total Due $<%=total%></span></h3></div>
	</div>
		<p class="text-right"><a href="<%=base %>">Continue Shopping</a> or <a href= "<%=base%>?action=checkout&totalPrice=<%=total%>" role="button" class="btn btn-success">Checkout > </a></p>
		
	


</div>
</div>
</body>
</html>				
				