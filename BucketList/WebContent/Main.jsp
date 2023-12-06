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
<title>����</title>

<jsp:include page="Header.jsp">
	<jsp:param name="menubar" value="main" />
</jsp:include>
</head>
<body>

<% if(session.getAttribute("sessionID")==null) { %>
<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-body-tertiary">
    <div class="col-md-6 p-lg-5 mx-auto my-5">
      <h1 class="display-3 fw-bold">���� ��Ŷ����Ʈ</h1>
      <h3 class="fw-normal text-muted mb-3">������ ��Ŷ����Ʈ�� �ۼ��ϰ� �����ϼ���</h3>
      <div class="d-flex gap-3 justify-content-center lead fw-normal">
        <a style="margin-right: 100px" class="icon-link" href="JoinForm.jsp">ȸ������</a>
        <a style="margin-right: 100px" class="icon-link" href="LoginForm.jsp">�α���</a>
        <a class="icon-link" href="BoardList.jsp">����Ʈ ����</a>
      </div>
    </div>
  </div>
<% } else { %>
  <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-body-tertiary">
    <div class="col-md-6 p-lg-5 mx-auto my-5">
      <h1 class="display-3 fw-bold">���� ��Ŷ����Ʈ</h1>
      <h3 class="fw-normal text-muted mb-3">������ ��Ŷ����Ʈ�� �ۼ��ϰ� �����ϼ���</h3>
      <div class="d-flex gap-3 justify-content-center lead fw-normal">
        <a style="margin-right: 100px" class="icon-link" href="Write.jsp">�� ����Ʈ �ۼ�</a>
        <a style="margin-right: 100px" class="icon-link" href="BoardList.jsp">����Ʈ ����</a>
        <a class="icon-link" href="MyPage.jsp">�� ����Ʈ ����</a>
      </div>
    </div>
  </div>
<% } %>
</body>
</html>