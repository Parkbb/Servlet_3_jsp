<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

NoticeDTO noticeDTO = new NoticeDTO();
NoticeDAO noticeDAO = new NoticeDAO();

String title = request.getParameter("title");
String writer = request.getParameter("writer");
String contents = request.getParameter("contents");

noticeDTO.setTitle(title);
noticeDTO.setWriter(writer);
noticeDTO.setcontents(contents);

Connection con = DBConnector.getConnection();

int result = noticeDAO.insert(con, noticeDTO);

con.close();

if(result == 0){
	
	String msg = "글쓰기 실패";
	request.setAttribute("msg", msg);
	request.setAttribute("path", "noticeList.jsp");
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
} else{
	response.sendRedirect("noticeList.jsp");
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>