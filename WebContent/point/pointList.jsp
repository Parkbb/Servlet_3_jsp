<%@page import="com.iu.point.PointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	PointDAO pointDAO = new PointDAO();
	Connection con = DBConnector.getConnection();
	
	ArrayList<PointDTO> ar = pointDAO.selectList(con);
	
	con.close();
%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../layout/nav.jsp" %>
	<div class="container">
		<table class="table">
			<thead>
				<tr><th>NUM</th><th>NAME</th><th>TOTAL</th><th>AVG</th></tr>
				
			</thead>
			<tbody>
				<%
					for(int i=0; i<ar.size(); i++){
						PointDTO pointDTO = ar.get(i);
				%>	
				
				<tr>
					<td><%= pointDTO.getNum() %></td>
					<td><a href="pointSelect.jsp?num=<%= pointDTO.getNum() %>"><%= pointDTO.getName() %></a></td>
					<td><%= pointDTO.getTotal() %></td>
					<td><%= pointDTO.getAver() %></td>
				</tr>
					
				<%	}%>
			
			</tbody>
		</table>
				<a href = "pointInsert.jsp" class = "btn btn-primary" style="float: right;">Insert</a>
				
				
	</div>
</body>
</html>