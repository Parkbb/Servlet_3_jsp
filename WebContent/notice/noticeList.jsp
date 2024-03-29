<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();
	
	ArrayList<NoticeDTO> ar = noticeDAO.selectList(con);
	
	con.close();
	
	//쿠키 발행
	//쿠키 생성시 생성자에 키와 밸류 입력
	Cookie cookie = new Cookie("name","iu");
	
	//쿠키가 적용되는 path 설정 : 보통 context path 적용
	cookie.setPath(request.getContextPath());
	
	//쿠기의 유효기간
	//초단위
	//default값 웹브라우저 종료시
	cookie.setMaxAge(3600);
	
	//쿠키를 클라이언트로 전송
	response.addCookie(cookie);
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

<style type="text/css">

table a {
 color: black;
 font-size: 18px;
 font-weight: bold;
 
}

a:hover {
	text-decoration: none;

}

</style>
</head>
<body>
<%@ include file="../layout/nav.jsp" %>
	<div class="container">
		<table class="table">
			<thead>
				<tr><th class ="col-lg-1" style="text-align: center;">NUM1</th><th class ="col-lg-5" style="text-align: center;">TITLE</th><th class ="col-lg-2" style="text-align: center;">WRITER</th><th class ="col-lg-2" style="text-align: center;">DATE</th><th class ="col-lg-2" style="text-align: center;">HIT</th></tr>
				
			</thead>
			<tbody>
				<%
					for(int i=0; i<ar.size(); i++){
						NoticeDTO noticeDTO = ar.get(i);
				%>	
				
				<tr >
					<td style="text-align: center; line-height: 42px;"><%= noticeDTO.getNum() %></td>
					<td style="line-height: 42px;"><a href="noticeSelect.jsp?num=<%= noticeDTO.getNum() %>"><%= noticeDTO.getTitle() %></a></td>
					<td style=" text-align: center; line-height: 42px;"><%= noticeDTO.getWriter() %></td>
					<td style=" text-align: center; line-height: 42px;"><%= noticeDTO.getReg_date() %></td>
					<td style=" text-align: center; line-height: 42px;"><%= noticeDTO.getHit() %></td>
				</tr>
					
				<%	}%>
			
			</tbody>
		</table>
				<% if(memberDTO != null) {%>
				<% if(memberDTO.getGrade() == 0) {%>
				<a href = "noticeWrite.jsp" class = "btn btn-primary" style="float: right;">INSERT</a>
				<% }} %>
				
	</div>
</body>
</html>