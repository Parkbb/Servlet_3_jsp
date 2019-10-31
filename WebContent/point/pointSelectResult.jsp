<%@page import="com.iu.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	PointDTO pointDTO = (PointDTO)request.getAttribute("dto");
	

%>    
<!DOCTYPE html>

<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../layout/nav.jsp" %>
	<div class="container">
  		<div class="jumbotron">
  			<h1>Point Select Page</h1>
  			<ul>
  				<li>NUM : <%= pointDTO.getNum() %></li>
  				<li>NAME : <%= pointDTO.getName() %></li>
  				<li>KOR : <%= pointDTO.getKor() %></li>
  				<li>ENG : <%= pointDTO.getEng() %></li>
  				<li>MATH : <%= pointDTO.getMath() %></li>
  				<li>TOTAL : <%= pointDTO.getTotal() %></li>
  				<li>AVERAGE : <%= pointDTO.getAver() %></li>	
  				
  				
  			</ul>
  		</div>
  		<div>
  			<div style="width: 142px; height: 33px; float: right;">
  				<a href="pointUpdate.jsp?num=<%= pointDTO.getNum() %>" class="btn btn-primary">Update</a>
  				<a href="pointDeleteResult.jsp?num=<%= pointDTO.getNum() %>" class="btn btn-danger">Delete</a>
  			</div>
  		</div>
      
</div>
</body>
</html>