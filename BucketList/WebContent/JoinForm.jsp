<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>

<style>
div {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
table {
	margin-left: auto;
	margin-right: auto;
	border: 3px solid skyblue;
}
td {
	text-align: left;
	border: 1px solid skyblue;
	border-collapse : collapse;
}
#title {
	background-color: skyblue;
}
</style>
<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.mId.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.mPw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.mPw.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.mName.value) {
            	alert("닉네임을 입력하세요.");
            	return false;
            }
        }
    </script>
    
<jsp:include page="Header.jsp">
	<jsp:param name="menubar" value="join" />
</jsp:include>
</head>
<body>
	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div>
		<br>
		<br> <b><font size="6" color="gray">회원가입</font></b> <br><br><br>
		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post" action="join.do" name="userInfo" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="mId" maxlength="20"></td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="mPw" maxlength="15"></td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="passwordcheck" maxlength="15"></td>
				</tr>
				<tr>
					<td id="title">닉네임</td>
					<td><input type="text" name="mName" maxlength="20"></td>
				</tr>
			</table>
			<br> <input type="submit" value="가입" /> 
			<input type="reset" value="취소" onclick="location.href='Main.jsp'">
		</form>
	</div>
</body>
</html>

