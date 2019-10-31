<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

int num = Integer.parseInt(request.getParameter("num"));

Connection con = DBConnector.getConnection();

NoticeDAO noticeDAO = new NoticeDAO();

NoticeDTO noticeDTO = noticeDAO.selectOne(con, num);

noticeDAO.Hitup(con, noticeDTO);

con.close();

if(noticeDTO != null){
	request.setAttribute("dto", noticeDTO);
	
	RequestDispatcher view = request.getRequestDispatcher("noticeSelectResult.jsp");
	view.forward(request, response);
	
} else {
	
	request.setAttribute("msg", "존재하지 않는 게시물입니다.");
	request.setAttribute("path", "noticeList.jsp");
	
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
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