<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ������</title>

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
    
        // �ʼ� �Է������� ���̵�, ��й�ȣ�� �ԷµǾ����� Ȯ���ϴ� �Լ�
        function checkValue()
        {
            if(!document.userInfo.mId.value){
                alert("���̵� �Է��ϼ���.");
                return false;
            }
            
            if(!document.userInfo.mPw.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
            
            // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
            if(document.userInfo.mPw.value != document.userInfo.passwordcheck.value ){
                alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
                return false;
            }
            
            if(!document.userInfo.mName.value) {
            	alert("�г����� �Է��ϼ���.");
            	return false;
            }
        }
    </script>
    
<jsp:include page="Header.jsp">
	<jsp:param name="menubar" value="join" />
</jsp:include>
</head>
<body>
	<!-- div ����, ������ �ٱ������� auto�� �ָ� �߾����ĵȴ�.  -->
	<div>
		<br>
		<br> <b><font size="6" color="gray">ȸ������</font></b> <br><br><br>
		<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
		<!-- ��(�Ķ����) ������ POST ���, ������ �������� JoinPro.jsp -->
		<form method="post" action="join.do" name="userInfo" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td><input type="text" name="mId" maxlength="20"></td>
				</tr>
				<tr>
					<td id="title">��й�ȣ</td>
					<td><input type="password" name="mPw" maxlength="15"></td>
				</tr>
				<tr>
					<td id="title">��й�ȣ Ȯ��</td>
					<td><input type="password" name="passwordcheck" maxlength="15"></td>
				</tr>
				<tr>
					<td id="title">�г���</td>
					<td><input type="text" name="mName" maxlength="20"></td>
				</tr>
			</table>
			<br> <input type="submit" value="����" /> 
			<input type="reset" value="���" onclick="location.href='Main.jsp'">
		</form>
	</div>
</body>
</html>

