<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<form method="post" action="write.doo">
<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead>
<tr>
<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<input type="text" class="form-control" placeholder="글 제목" name="bTitle" maxlength="50"></td>
</tr>
<tr>
<td>
<textarea class="form-control" placeholder="글 내용" namd="bContent" maxlength="2048" style="height: 350px; width: 1100px"></textarea>
</td>
</tr>
<tr>
	<td>공개여부</td>
	<td>
		<select id="bOpen" name="bOpen" size="1">
			<option value="공개">공개</option>
			<option value="비공개">비공개</option>
		</select>
	</td>
</tr>
</tbody>
</table>

<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
</form>
</div>
</div>

</body>
</html>