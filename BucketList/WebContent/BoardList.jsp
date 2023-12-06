<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Dao.BDaoImpl" %>
<%@ page import="Dao.BDao" %>
<%@ page import="Dto.BDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>

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
	<jsp:param name="menubar" value="list" />
</jsp:include>
</head>
<body>
<%
	BDao bdao = new BDaoImpl();
	int cnt = 0;

	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	boolean isSearch = type != null && keyword != null;

	int pageSize = 8; 
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){ 
		pageNum ="1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize + 1;
	int endRow= currentPage * pageSize;
	
	ArrayList<BDto> boardList = null;

	if(isSearch){
		boardList = bdao.getSearch(startRow, pageSize, type, keyword);
		cnt = bdao.getCount(type, keyword);
	}
	else{
		boardList = bdao.showBoardList(startRow, pageSize);
		cnt = bdao.getBoardCount();
	}
%>

<div class="container">
	<div class="row">
	<form action="BoardList.jsp" method="get"> 
	<div class="form-group">
        <!-- �˻��з� -->
        <select style="margin-right: 20px"  name="type">
        <%
        	String typeval = "";
        	if(type == null) {
        		typeval = "�����ϼ���";
        	} else if(type.equals("board_mid")) {
        		typeval = "�ۼ���";
        	} else {
        		typeval = "����";
        	}
        %>
        	<option value="<%=typeval %>"><%=typeval %></option>
            <option value="board_title">����</option>
            <option value="board_mid">�ۼ���</option>
        </select>

        <!-- �˻��� -->
        <% if(isSearch){ %>
            <input style="margin-right: 20px" type="text" name="keyword" value='<%=keyword%>' required>
        <% } else { %>
            <input style="margin-right: 20px" type="text" name="keyword" required>
        <% } %>

        <!-- ���۹�ư -->
        <% if(session.getAttribute("sessionID")!=null) { %>
			<a style="margin-bottom: 20px" href="Write.jsp" class="btn btn-primary float-right">�۾���</a>
		<% } %>
        <button style="margin-right: 10px" type="submit" class="btn btn-primary float-right">�˻�</button>
        </div>
    </form>
	</div>
	
	<div class="row">
		<input type="hidden" name="pageNumber" value=request.getParameter("pageNumber")> 
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
						<th style="background-color: #eeeeee; text-align: center;">����</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���¥</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
						<th style="background-color: #eeeeee; text-align: center;">��ȸ��</th>
					</tr>
				</thead>
				<tbody>
					<% 
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					for(int i=0; i<boardList.size(); i++) { %>
					<tr>
						<td><%= boardList.get(i).getbId() %></td>
						<td>
							<a href="content_view.doo?bId=<%= boardList.get(i).getbId() %>"><%= boardList.get(i).getbTitle() %></a>
						</td>
						<td><%= df.format(boardList.get(i).getbDate()) %></td>
						<td><%= boardList.get(i).getbmId() %></td>
						<td><%= boardList.get(i).getbHit() %></td>
					</tr>

					<% } %>
				</tbody>
		</table>

<%
if(cnt != 0){
	int pageCount = cnt/pageSize + (cnt%pageSize == 0? 0:1);
	
	int pageBlock = 3;
	
	int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
	
	int endPage = startPage + pageBlock - 1;
	if(endPage > pageCount){
		endPage = pageCount;
	}
	
%>
<div id="pageBlock">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
<% if(startPage > pageBlock){ %>
	<a href="BoardList.jsp?pageNum=<%=startPage-pageBlock%>">   ����   </a>
<%
	}
	for(int i=startPage; i<=endPage; i++){
%>
	<li class="page-item text-center"><a href ="BoardList.jsp?pageNum=<%=i%>"><%= i %></a></li>
<%
	}
	if(endPage < pageCount){
%>
		<a href ="BoardList.jsp?pageNum=<%=startPage+pageBlock%>">   ����   </a>
<%
	}
}
%>
</ul>
</nav>
</div>
</div>
</div>

</body>
</html>