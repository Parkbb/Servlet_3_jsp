<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");


	
%>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../layout/nav.jsp" %>
<%
	if(memberDTO == null){
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		request.setAttribute("msg", "권한이 없습니다.");
		request.setAttribute("path", "../index.jsp");
		view.forward(request, response);
	}
%>
<div class="container">
<h2>Point Update Page</h2>
<form action="memberUpdateResult.jsp" method="get">
	<div class="form-group">
     	 <label for="name">ID:</label>
      	<input type="text" class="form-control" id="id" placeholder="Enter title" name="id" value="<%= memberDTO.getId() %>" readonly="readonly">
    </div>
	
	<div class="form-group">
     	 <label for="name">PW:</label>
      	<input type="password" class="form-control" id="pw" placeholder="Enter title" name="pw" value="<%= memberDTO.getPw() %>">
    </div>
    
    <div class="form-group">
     	 <label for="name">PW check:</label>
      	<input type="password" class="form-control" id="pwc" placeholder="비밀번호를 한번 더 입력하세요" name="pwc" value="<%= memberDTO.getPw() %>">
    </div>
    
    <div class="form-group">
     	 <label for="name">EMAIL:</label>
      	<input type="text" class="form-control" id="email" placeholder="Enter email" name="email" value="<%= memberDTO.getEmail() %>">
    </div>
    
    <div class="form-group">
     	 <label for="name">PHONE:</label>
      	<input type="text" class="form-control" id="" placeholder="Enter phone" name="phone" value="<%= memberDTO.getPhone() %>">
    </div>

    
    
    <button type="submit" class="btn btn-primary" style="float: right;">Submit</button>
    <a href ="memberMypage.jsp"><button type="button" class="btn btn-default" style="float: right;">Cancel</button></a>
</form>
</div>
</body>
</html>