<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="layout/nav.jsp" %>


<div class="container">
	<% if (memberDTO != null) {%>
		<h1>After Success Login</h1>
	<% } else { %>
		<h1>Before Login</h1>
	<% } %>
</div>
<div class = "container">
	<% 
		Cookie[] cookies = request.getCookies();
		for(int i=0; i < cookies.length ; i ++){%>
			<h1><%= cookies[i].getName() %></h1>
			<h1><%= cookies[i].getValue() %></h1>
		<%} %>
</div>
	
</body>
</html>