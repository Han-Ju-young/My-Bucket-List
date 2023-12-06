<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
	<jsp:param name="menubar" value="mypage" />
</jsp:include>
</head>
<body>
<%
	String bmId = null;
	if(session.getAttribute("sessionID") != null) {
   		bmId = (String) session.getAttribute("sessionID");
	}
	
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
		boardList = bdao.getSearchs(startRow, pageSize, type, keyword, bmId);
		cnt = bdao.getCount(type, keyword);
	}
	else{
		boardList = bdao.showBoardLists(startRow, pageSize, bmId);
		cnt = bdao.getBoardCounts(bmId);
	}
%>

<div class="container">
<div style="margin-bottom: 30px;" class="row">
	<strong><%=bmId %> 사용자님이 작성한 버킷리스트입니다.</strong>
	</div>
	<div class="row">
	<form action="MyPage.jsp" method="get">
	<div class="form-group">
        <!-- 검색분류 -->
        <select style="margin-right: 20px"  name="type">
            <option value="board_title">제목</option>
        </select>

        <!-- 검색어 -->
        <% if(isSearch){ %>
            <input style="margin-right: 20px" type="text" name="keyword" value='<%=keyword%>' required>
        <% } else { %>
            <input style="margin-right: 20px" type="text" name="keyword" required>
        <% } %>

        <!-- 전송버튼 -->
        <% if(session.getAttribute("sessionID")!=null) { %>
			<a style="margin-bottom: 20px" href="Write.jsp" class="btn btn-primary float-right">글쓰기</a>
		<% } %>
        <button style="margin-right: 10px" type="submit" class="btn btn-primary float-right">검색</button>
        </div>
    </form>
	</div>
	
	<div class="row">
		<input type="hidden" name="pageNumber" value=request.getParameter("pageNumber")> 
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">공개여부</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
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
						<td><%= boardList.get(i).getbOpen() %></td>
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
	<a href="MyPage.jsp?pageNum=<%=startPage-pageBlock%>">   이전   </a>
<%
	}
	for(int i=startPage; i<=endPage; i++){
%>
	<li style="text-align: center" class="page-item"><a href ="MyPage.jsp?pageNum=<%=i%>"><%= i %></a></li>
<%
	}
	if(endPage < pageCount){
%>
		<a href ="MyPage.jsp?pageNum=<%=startPage+pageBlock%>">   다음   </a>
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