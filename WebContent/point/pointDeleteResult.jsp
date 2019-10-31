<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	PointDAO pointDAO = new PointDAO();
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection con = DBConnector.getConnection();
	
	int result = pointDAO.delete(con, num);
	
	String msg = "삭제 실패";
	if(result > 0){
		msg = "삭제 성공";
	}
	con.close();
	
	request.setAttribute("msg", msg);
	request.setAttribute("path", "pointList.jsp");
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	
	if(result > 0 ){
		
	view.forward(request, response);
	} else {
		response.sendRedirect("pointList.jsp");
		
	}
	//성공하면 성공메시지 alert 후 list페이지로
	//실패하면 list로
	

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