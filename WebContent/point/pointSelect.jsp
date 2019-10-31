<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	
	int num = Integer.parseInt(request.getParameter("num"));
	Connection con = DBConnector.getConnection();
	PointDAO pointDAO = new PointDAO();
	PointDTO pointDTO = pointDAO.selectOne(con, num);
	
	con.close();
	if(pointDTO == null){
		response.sendRedirect("pointList.jsp");
	}else {
		
		request.setAttribute("dto", pointDTO);
		
		RequestDispatcher view = request.getRequestDispatcher("pointSelectResult.jsp");
		view.forward(request, response);
	}
%>
