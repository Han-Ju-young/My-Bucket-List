<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
nav {
	font-size: 12pt;
	font-family: 'PT Sans', Arial, Sans-serif;
	position: relative;
}

nav ul {
	padding: 0;
	margin: 0 auto;
	width: auto;
}

nav li {
	
}

nav a {
	line-height: 50px;
	height: 50px;
}

nav li a {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

nav li:last-child a {
	border-right: 0;
}

nav a:hover, nav a:active {
	
}

nav a#pull {
	display: none;
}

html {
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

ul {
	/*list-style-type: none;*/
	margin: 0;
	padding: 0;
	background-color: #333;
	text-align: center;
}

li {
	/*position: relative;*/
	display: inline-block;
	font-size: 20px;
}

li a {
	color: #FFFFFF;
	text-align: center;
	padding: 14.5px 16px;
	text-decoration: none;
}

li a:hover {
	/*color: #597812;*/
	color: #FFD400;
	font-weight: normal;
}

.menu {
	width: 5000px;
	height: 50px;
	text-align: center;
	max-width: 100%;
	background-position: center;
	background-size: cover;
	background-color: #333333;
	color: white;
	position: absolute;
	z-index: 1;
}
#log {
	font-size:15px;
	display: right;
}
</style>
</head>
<%
	String nameval = (String)request.getParameter("menubar");
%>

<body topmargin="0" bottommargin="100" leftmargin="0" rightmargin="0" style="background-color: #F6F6F6">
	<div class="menu">
		<nav class="clearfix">
			<ul class="clearfix">
				<li style="float: left;  margin-left: 10px"><a href="Main.jsp">나의 버킷리스트</a></li>
<%
				if(nameval.equals("main")) {
					if(session.getAttribute("sessionID")==null){ 
          		%>
          			<li style="float: left; margin-left: 50px;"><a href="Main.jsp" style="color: #FFD400">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="JoinForm.jsp">회원가입</a></li>
          			<li style="float: right;"><a id="log" href="LoginForm.jsp">로그인</a></li>
          			
          		<%
          			} else {
          		%>
          			<li style="float: left; margin-left: 50px"><a href="Main.jsp" style="color: #FFD400">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="Write.jsp">새로운 버킷리스트 작성</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="MyPage.jsp">마이페이지</a></li>
          			<li style="float: right;"><a id="log" href="logout.do">로그아웃</a></li>
				<%
          			}
				} else if(nameval.equals("write")) {
					if(session.getAttribute("sessionID")==null){ 
				%>
					<li style="float: left; margin-left: 50px"><a href="Main.jsp">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="JoinForm.jsp">회원가입</a></li>
          			<li style="float: right;"><a id="log" href="LoginForm.jsp">로그인</a></li>
          		<%
          			} else {
          		%>
          			<li style="float: left; margin-left: 50px"><a href="Main.jsp">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="Write.jsp" style="color: #FFD400">새로운 버킷리스트 작성</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="MyPage.jsp">마이페이지</a></li>
          			<li style="float: right;"><a id="log" href="logout.do">로그아웃</a></li>
				<%
          			}
				} else if(nameval.equals("list")) {
					if(session.getAttribute("sessionID")==null){ 
				%>
					<li style="float: left; margin-left: 50px"><a href="Main.jsp">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp" style="color: #FFD400">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="JoinForm.jsp">회원가입</a></li>
          			<li style="float: right;"><a id="log" href="LoginForm.jsp">로그인</a></li>
          		<%
          			} else {
          		%>
          			<li style="float: left; margin-left: 50px"><a href="Main.jsp">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="Write.jsp">새로운 버킷리스트 작성</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp" style="color: #FFD400">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="MyPage.jsp">마이페이지</a></li>
          			<li style="float: right;"><a id="log" href="logout.do">로그아웃</a></li>
				<%
          			}
				} else if(nameval.equals("join")) {
					if(session.getAttribute("sessionID")==null){ 
				%>
					<li style="float: left; margin-left: 50px"><a href="Main.jsp">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="JoinForm.jsp" style="color: #FFD400">회원가입</a></li>
          			<li style="float: right;"><a id="log" href="LoginForm.jsp">로그인</a></li>
          		<%
          			} else {
          		%>
          			<li style="float: left; margin-left: 50px"><a href="Main.jsp">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="Write.jsp">새로운 버킷리스트 작성</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="MyPage.jsp">마이페이지</a></li>
          			<li style="float: right;"><a id="log" href="logout.do">로그아웃</a></li>
				<%
          			}
				} else if(nameval.equals("login")) {
					if(session.getAttribute("sessionID")==null){ 
				%>
					<li style="float: left; margin-left: 50px"><a href="Main.jsp">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="JoinForm.jsp">회원가입</a></li>
          			<li style="float: right;"><a id="log" href="LoginForm.jsp" style="color: #FFD400">로그인</a></li>
          		<%
          			} else {
          		%>
          			<li style="float: left; margin-left: 50px"><a href="Main.jsp">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="Write.jsp">새로운 버킷리스트 작성</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="MyPage.jsp">마이페이지</a></li>
          			<li style="float: right;"><a id="log" href="logout.do">로그아웃</a></li>
				<%
          			}
				} else if(nameval.equals("mypage")) {
					if(session.getAttribute("sessionID")==null){ 
				%>
					<li style="float: left; margin-left: 50px"><a href="Main.jsp">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="JoinForm.jsp">회원가입</a></li>
          			<li style="float: right;"><a id="log" href="LoginForm.jsp">로그인</a></li>
          		<%
          			} else {
          		%>
          			<li style="float: left; margin-left: 50px"><a href="Main.jsp">Home</a></li>
          			<li style="float: left; margin-left: 20px"><a href="Write.jsp">새로운 버킷리스트 작성</a></li>
          			<li style="float: left; margin-left: 20px"><a href="BoardList.jsp">목록보기</a></li>
          			<li style="float: right;"><a id="log" href="MyPage.jsp" style="color: #FFD400">마이페이지</a></li>
          			<li style="float: right;"><a id="log" href="logout.do">로그아웃</a></li>
				<%
          			}
				}
%>			
      		</ul>
    	</nav>
    </div>
    <br>
	<br>
	<br>
  </body>
</html>