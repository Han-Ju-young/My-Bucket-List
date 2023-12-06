<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
crossorigin="anonymous"></script>

<meta charset="EUC-KR">
<title>Insert title here</title>

<jsp:include page="Header.jsp">
	<jsp:param name="menubar" value="main" />
</jsp:include>
</head>
<body>
<%
String userID = null;
if(session.getAttribute("sessionID") != null) {
	userID = (String)session.getAttribute("sessionID");
}
%>

<div class="container">
<div class="row">
<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead>
<tr>
<th style="background-color: #eeeeee; text-align: center;">번호</th>
<th style="background-color: #eeeeee; text-align: center;">제목</th>
<th style="background-color: #eeeeee; text-align: center;">작성자</th>
<th style="background-color: #eeeeee; text-align: center;">작성일</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>안녕하세요</td>
<td>홍길동</td>
<td>2020-07-13</td>
</tr>
</tbody>
</table>
<% if(session.getAttribute("sessionID")!=null) { %>
<a href="Write.jsp" class="btn btn-primary pull-right">글쓰기</a>
<% } %>
</div>
</div>


</body>
</html>