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
<%@ include file="../layout/nav.jsp" %>
<div class="container">
<h2>Point Insert Page</h2>
<form action="pointInsertResult.jsp" method="post">
	<div class="form-group">
     	 <label for="name">Name:</label>
      	<input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
    </div>
    
    <div class="form-group">
    	  <label for="kor">Kor:</label>
      	<input type="text" class="form-control" id="kor" placeholder="Enter Kor Score" name="kor">
    </div>
    
    <div class="form-group">
    	  <label for="eng">Eng:</label>
      	<input type="text" class="form-control" id="eng" placeholder="Enter Eng Score" name="eng">
    </div>
    
    <div class="form-group">
    	  <label for="math">Math:</label>
      	<input type="text" class="form-control" id="math" placeholder="Enter Math Score" name="math">
    </div>
    
    
    <button type="submit" class="btn btn-default">Submit</button>
</form>
</div>
</body>
</html>