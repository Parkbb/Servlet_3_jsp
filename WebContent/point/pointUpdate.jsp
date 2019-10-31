<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	PointDTO pointDTO = null;
	PointDAO pointDAO = new PointDAO();
	
	Connection con = DBConnector.getConnection();
	
	pointDTO = pointDAO.selectOne(con, num);
	
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
<h2>Point Update Page</h2>
<form action="pointUpdateResult.jsp" method="post">
	<div class="form-group">
     	 <label for="name">Name:</label>
      	<input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" value = "<%= pointDTO.getName() %>">
    </div>
    
    <div class="form-group">
    	  <label for="kor">Kor:</label>
      	<input type="text" class="form-control" id="kor" placeholder="Enter Kor Score" name="kor" value="<%= pointDTO.getKor() %>">
    </div>
    
    <div class="form-group">
    	  <label for="eng">Eng:</label>
      	<input type="text" class="form-control" id="eng" placeholder="Enter Eng Score" name="eng" value="<%= pointDTO.getEng() %>">
    </div>
    
    <div class="form-group">
    	  <label for="math">Math:</label>
      	<input type="text" class="form-control" id="math" placeholder="Enter Math Score" name="math" value="<%= pointDTO.getMath() %>">
    </div>
    
    <div class="form-group" hidden="">
    	  <label for="math">Name:</label>
      	<input type="text" class="form-control" id="num" placeholder="Enter Math Score" name="num" value="<%= pointDTO.getNum() %>">
    </div>

    
    
    <button id="btn" type="submit" class="btn btn-default">Submit</button>
    
    <script type="text/javascript">
		
    </script>
</form>
</div>
</body>
</html>