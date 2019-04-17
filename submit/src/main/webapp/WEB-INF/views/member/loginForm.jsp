<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
input::-webkit-input-placeholder {
	color: #EAEAEA
}

.loginFormContainer {
	padding-top: 100px;
	width: 15%;
	margin: 0 auto;
	text-align: center;
}

#id_i, #pwd_i {
	width: 99%;
	height: 50px;
	border: 1px solid white;
	border-bottom: 1px solid #EAEAEA;
}

#loginLogo {
	font-size: 40px;
	font-weight: bold;
	color: #D5D5D5
}

#loginConfirm {
	font-size: 15px;
	color: red;
}
</style>
<script>
	function loginAction(obj) {

		var id = document.getElementById("id_i");
		var pwd = document.getElementById("pwd_i");

		if (id.value == "") {
			alert("아이디를 입력해 주세요");
			id_i.focus();
			return false;
		}
		if (pwd.value == "") {
			alert("비밀번호를 입력해 주세요");
			pwd_i.focus();
			return false;
		}

		obj.action = "${contextPath}/member/loginMembers.do"
		obj.submit();
	}
</script>
</head>
<body>
	<div class="loginFormContainer">
		<form name="loginForm" action="${contextPath}">
			<span id="loginLogo">LOGIN</span> <input placeholder="ID" id="id_i"
				type="text" name="id"> <input placeholder="PASSWORD"
				id="pwd_i" type="password" name="pwd"> <br>
			<br>
			<c:if test="${result=='loginFail'}">
				<span id="loginConfirm">아이디 또는 비밀번호가 잘못되었습니다.</span>
			</c:if>
			<br> <br> <input type="button" value="로그인"
				onClick="loginAction(loginForm)"
				style="margin-top: 5px; width: 99.5%; height: 55px; color: white; background-color: green; border: 1px solid green">
			<br>
			<br>
		</form>


		<a style="color: #D5D5D5; text-decoration: none;"
			href="${contextPath}/member/memberForm"> 회원가입 </a>
	</div>
</body>
</html>