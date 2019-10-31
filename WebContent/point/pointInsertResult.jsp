<%@page import="java.sql.Connection"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	PointDTO pointDTO = new PointDTO();
	PointDAO pointDAO = new PointDAO();
	
	
	pointDTO.setName(request.getParameter("name"));
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	int total = kor + eng + math;
	double aver = total/3.0;
	pointDTO.setKor(kor);
	pointDTO.setEng(eng);
	pointDTO.setMath(math);
	pointDTO.setTotal(total);
	pointDTO.setAver(aver);
	
	Connection con = DBConnector.getConnection();
	
	kor = pointDAO.insert(con, pointDTO);
	
	
	con.close();
	
	String msg = "등록실패";
	if(kor > 0){
		msg = "등록성공";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	<script type="text/javascript">
	alert("<%= msg %>");
	location.href="pointList.jsp";
	

</script>
</head>
<body>

</body>
</html>