<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	PointDTO pointDTO = new PointDTO();
	PointDAO pointDAO = new PointDAO();
	
	
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	int total = kor + eng + math;
	double aver = total/3.0;
	
	pointDTO.setNum(num);
	pointDTO.setName(name);
	pointDTO.setKor(kor);
	pointDTO.setEng(eng);
	pointDTO.setMath(math);
	pointDTO.setTotal(total);
	pointDTO.setAver(aver);
	
	Connection con = DBConnector.getConnection();
	
	num = pointDAO.update(con, pointDTO);
	
	String msg = "수정 실패";
	if(num > 0){
		msg = "수정 성공";
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("path1", "/Servlet_3_jsp/point/pointList.jsp"); //절대 o
	request.setAttribute("path", "pointList.jsp"); //상대 pointUpdateResult기준 o
	request.setAttribute("path3", "../point/pointList.jsp"); //상대 common_result기준x 쓰면 안됨
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
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