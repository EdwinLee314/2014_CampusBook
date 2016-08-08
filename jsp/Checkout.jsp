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
<title>Checkout - CampusBook</title>
<%@ include file="src.jsp" %>
</head>
<%
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	
	User buyer = (User) session.getAttribute("loginUser");
	int buyer_id = buyer.getUserId();
	
	String action = request.getParameter("action");
  if (action!=null && action.equals("checkout")) {
		try{
			Hashtable shoppingCart = (Hashtable) session.getAttribute("shoppingCart");
			Enumeration en = shoppingCart.elements();
			while (en.hasMoreElements()) {
				UsedBook item = (UsedBook) en.nextElement();
				usedBookBean.buyUsedBook(buyer_id, item);
			}
		}catch (Exception e) {
      out.println("Error in check out");
    }
	}
%>

<body>
<%@ include file="header.jsp" %>
<br>
<br>
<br>
<p> You spent $<%=totalPrice%> in this shopping</p>
