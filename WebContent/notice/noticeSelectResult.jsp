<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

NoticeDTO noticeDTO = (NoticeDTO)request.getAttribute("dto");


%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<div class="container">
		<table class="table">
			<thead>
				<tr><th class ="col-lg-6" style="text-align: center;">TITLE</th><th class ="col-lg-2" style="text-align: center;">WRITER</th><th class ="col-lg-2" style="text-align: center;">DATE</th><th class ="col-lg-2" style="text-align: center;">HIT</th></tr>
				
			</thead>
			<tbody>

				<tr>
					
					<td><%= noticeDTO.getTitle() %></td>
					<td style="text-align: center;"><%= noticeDTO.getWriter() %></td>
					<td style="text-align: center;"><%= noticeDTO.getReg_date() %></td>
					<td style="text-align: center;"><%= noticeDTO.getHit() %></td>
				</tr>

			</tbody>
			
		</table>
	</div>
	<div class="container">
  		<div class="jumbotron">
  			<h4><%= noticeDTO.getcontents() %></h4>

  		</div>
  		<div>
  			<ul class="pager">
				<li><a href="noticeSelect.jsp?num=<%= noticeDTO.getNum() -1 %>">Previous</a></li>
				<li><a href="noticeSelect.jsp?num=<%= noticeDTO.getNum() +1 %>">Next</a></li>
			</ul>
			<div style="float: left;">
				<a href="noticeList.jsp" class="btn btn-success">List</a>
			</div>
  			<div style="width: 142px; height: 33px; float: right;">
  				<a href="noticeUpdate.jsp?num=<%= noticeDTO.getNum() %>" class="btn btn-primary">Update</a>
  				<a href="" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</a>
  			  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">삭제 확인</h4>
        </div>
        <div class="modal-body">
          <p>정말 삭제하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button id="btn" type="button" class="btn btn-danger" data-dismiss="modal">예</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">아니오</button>
        </div>
      </div>
      
    </div>
  </div>
  			
  			</div>
  		</div>
      
</div>

<script type="text/javascript">
$("#btn").click(function() {
	location.href="noticeDeleteResult.jsp?num=<%= noticeDTO.getNum() %>"
});


</script>

</body>
</html>