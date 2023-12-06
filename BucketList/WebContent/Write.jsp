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
	<jsp:param name="menubar" value="write" />
</jsp:include>
</head>
<body>

<div class="container">
<form action="write.doo" method="post">
<div class="form-group">
<label for="subject">제목</label>
<input type="text" class="form-control" name="bTitle" placeholder="제목을 입력하세요">
</div>
<div class="form-group">
<label for="content">내용</label>
<textarea class="form-control" name="bContent" rows="3" placeholder="내용을 입력하세요"></textarea>
</div>
<div class="form-group">
<label for="open">공개여부</label>
	<select id="bOpen" name="bOpen" size="1">
		<option value="공개">공개</option>
		<option value="비공개">비공개</option>
	</select>
	<button type="submit" class="btn btn-primary float-right">작성</button>
	<button style="margin-right: 20px" class="btn btn-primary float-right">
	<a style="color: white; text-decoration: none" href="BoardList.jsp">목록보기</a></button>

</div>
</form>
</div>

</body>
</html>