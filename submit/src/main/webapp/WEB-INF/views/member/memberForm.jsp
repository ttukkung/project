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
<script>
	function insert(obj) {

		var id = document.getElementById("id_i");
		var pwd = document.getElementById("pwd_i");
		var pwd2 = document.getElementById("pwd2_i");
		var name = document.getElementById("name_i");
		var email = document.getElementById("email_i");

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

		if (pwd.value != pwd2.value) {
			alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
			pwd.value = "";
			pwd2.value = "";
			pwd_i.focus();
			return false;
		}

		if (name.value == "") {
			alert("이름를 입력해 주세요");
			name_i.focus();
			return false;
		}
		if (email.value == "") {
			alert("이메일를 입력해 주세요");
			email_i.focus();
			return false;
		}

		/* 	var title = $("id_i").val();
		 if(title == ""){
		 alert("아이디를 입력하세요");
		 }
		 */
		obj.action = "${contextPath}/member/insertMembers.do";

		obj.submit();
	}
</script>
<style>
.memberFormContainer {
	padding-top: 100px;
	height: 90%;
	width: 60%;
	margin: 0 auto;
}

.memberFormList {
	margin: 0 auto;
	width: 30%;
	height: 80%;
	height: 400px;
	color: #D5D5D5;
}

#id_i, #pwd_i, #pwd2_i, #name_i, #email_i {
	border: 1px solid #D5D5D5;
	height: 50px;
	width: 99%;
}

#memberInsert {
	height: 50px;
}

#IDCHECK {
	color: red;
	padding-left: 150px;
}
</style>
</head>
<body>
	<div class="memberFormContainer">

		<form name="memberForm" action="${contextPath}" method="post">

			<div class="memberFormList">


				ID
				<c:if test="${idCheck=='notExist'}">
					<span id="IDCHECK">중복된 아이디 입니다.</span>
				</c:if>
				<input id="id_i" type="text" name="id"> PASSWORD <input
					id="pwd_i" type="password" name="pwd" value="${memberDTO.pwd}">

				PASSWORD CHECK <input id="pwd2_i" type="password" name="pwd2"
					value="${memberDTO.pwd}"> NAME <input id="name_i"
					type="text" name="name" value="${memberDTO.name}"> EMAIL <input
					id="email_i" type="text" name="email" value="${memberDTO.email}">

				<p>



					<!-- <input type="submit" value="가입" 	style="margin-top:5px;width:99.5%; height:55px; color:white; background-color:green; border:1px solid green"> -->
					<input type="button" value="가입" onClick="insert(memberForm)"
						style="margin-top: 5px; width: 99.5%; height: 55px; color: white; background-color: green; border: 1px solid green">
			</div>
			<br>


		</form>

	</div>
</body>
</html>