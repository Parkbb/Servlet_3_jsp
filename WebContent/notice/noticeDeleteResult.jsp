<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();
	
	int result = noticeDAO.Delete(con, num);
		
	String msg = "삭제 실패";
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		request.setAttribute("path", "noticeList.jsp");
		
	if(result ==1 ){
		msg = "삭제 성공";
	}
		request.setAttribute("msg", msg);
		view.forward(request, response);

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