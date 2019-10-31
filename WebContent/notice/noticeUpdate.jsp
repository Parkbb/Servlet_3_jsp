<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();
	
	NoticeDTO noticeDTO = noticeDAO.selectOne(con, num);
	
	con.close();
	
	
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
<div class="container">
<h2>Point Update Page</h2>
<form action="noticeUpdateResult.jsp" method="get">
	<div class="form-group" hidden="">
     	 <label for="name">TITLE:</label>
      	<input type="text" class="form-control" id="title" placeholder="Enter title" name="num" value="<%= noticeDTO.getNum() %>">
    </div>
	
	<div class="form-group">
     	 <label for="name">TITLE:</label>
      	<input type="text" class="form-control" id="title" placeholder="Enter title" name="title" value="<%= noticeDTO.getTitle() %>">
    </div>
    
    <div class="form-group">
    	  <label for="kor">WRITER:</label>
      	<input type="text" class="form-control" id="writer" placeholder="Enter Your Name" name="writer" value="<%= noticeDTO.getWriter() %>">
    </div>
    
    <div class="form-group">
    	  <label for="eng">CONTENTS:</label>
    	  <textarea rows="30" cols="50" class="form-control" placeholder="Enter Contents" name="contents"><%= noticeDTO.getcontents() %></textarea>
      	
    </div>
    
    
    <button type="submit" class="btn btn-primary" style="float: right;">Submit</button>
    <a href ="noticeSelect.jsp?num=<%= num %>"><button type="button" class="btn btn-default" style="float: right;">Cancel</button></a>
</form>
</div>
</body>
</html>