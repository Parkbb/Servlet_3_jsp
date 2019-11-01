<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../layout/nav.jsp" %>
<div class = "container">
<form  method="post" id="frm" action="noticeWriteResult.jsp" >
	<div class="form-group" >
     	 <label for="name">ID:</label>
      	<input type="text" class="form-control" id="ID" readonly="readonly" name="id" value="<%= memberDTO.getId()%>">
    </div>
    
    <div class="form-group" hidden="">
    	  <label for="kor">PASSWORD:</label>
      	<input type="password" class="form-control" id="pw" readonly="readonly" name="pw" value="<%= memberDTO.getPw() %>">
    </div>
    
    <div class="form-group">
    	  <label for="kor">NAME:</label>
      	<input type="text" class="form-control" id="name" readonly="readonly" name="name" value="<%= memberDTO.getName() %>">
    </div>
    <div class="form-group">
    	  <label for="kor">EMAIL:</label>
      	<input type="text" class="form-control" id="email" readonly="readonly" name="email" value="<%= memberDTO.getEmail() %>">
    </div>
    <div class="form-group">
    	  <label for="kor">PHONE:</label>
      	<input type="text" class="form-control" id="phone" readonly="readonly" name="phone" value="<%= memberDTO.getPhone() %>">
    </div>
    <div class="form-group">
    	  <label for="kor">GRADE:</label>
      	<input type="text" class="form-control" id="grade" readonly="readonly" name="grade" value="<%= memberDTO.getGrade() %>">
    </div>
    
    
    <a href = "memberDeleteResult.jsp"><input type="button" class="btn btn-danger" id="submit" value="Delete" style="float: right;"></a>
    <a href = "memberUpdateForm.jsp"><input type="button" class="btn btn-primary" id="submit" value="Update" style="float: right;"></a>
</form>
</div>
</body>
</html>