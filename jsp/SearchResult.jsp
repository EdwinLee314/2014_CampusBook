<%@ page import="pojo.User" %>
<%@ page import="pojo.Book" %>
<%@ page import="pojo.Copy" %>
<%@ page import="pojo.UsedBook" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bookBean" scope="application" class="dao.BookBean"/>
<jsp:useBean id="usedBookBean" scope="application" class="dao.UsedBookBean"/>
<jsp:useBean id="copyBean" scope="application" class="dao.CopyBean"/>
<%
	String base = (String) application.getAttribute("base");
	String action = request.getParameter("action");
  if (action!=null && action.equals("search")) {
		try{
			String search_param = request.getParameter("search_param");
			String search_data = request.getParameter("search_data");
			if(search_param.equals("isbn")){
				Book tBook = bookBean.findBookByIsbn(search_data);
				int bookId = tBook.getBookId();
				out.println("<a href=" + base + "?action=bookDetail&bookId="+ bookId+ ">Detail</a>");
			}
			else
			if(search_param.equals("title")){
				Book tBook = bookBean.findBookByTitle(search_data);
				int bookId = tBook.getBookId();
				out.println("<a href=" + base + "?action=bookDetail&bookId="+ bookId + ">Detail</a>");
			
			}
			else
			if(search_param.equals("unitcode")){
				Book tBook = bookBean.findBookByUnitCode(search_data);
				int bookId = tBook.getBookId();
				out.println("<a href=" + base + "?action=bookDetail&bookId="+ bookId + ">Detail</a>");
			}
			else{
				out.println("<p>Sorry can not find anything in database</p>");
				
			}
		}
		catch (Exception e) {
      out.println("<p>Error searching the book</p>");
    }
	}
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>SearchResult - CampusBook</title>
<%@ include file="src.jsp" %>
</head>
<body>

</body>
</html>