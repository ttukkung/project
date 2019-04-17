<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function fn_enable(obj) {
		document.getElementById("pwd_i").disabled = false;
		document.getElementById("pwd2_i").disabled = false;

		document.getElementById("name_i").disabled = false;
		document.getElementById("email_i").disabled = false;
		document.getElementById("modifyReady_i").hidden = true;
		document.getElementById("delete_i").hidden = true;
		document.getElementById("modify_i").hidden = false;

	}

	function fn_modify(obj) {

		var pwd = document.getElementById("pwd_i");
		var pwd2 = document.getElementById("pwd2_i");
		var name = document.getElementById("name_i");
		var email = document.getElementById("email_i");

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

		obj.action = "${contextPath}/member/modifyMembers.do";
		alert("수정완료");
		obj.submit();
	}
	function fn_delete(obj) {
		if (confirm("정말로 탈퇴 하시겠습니까?")) {
			obj.action = "${contextPath}/member/deleteMembers.do?id=${modifyForm.id}";
			obj.submit();
		}
	}
</script>

<style>
.modifyFormContainer {
	padding-top: 100px;
	height: 90%;
	width: 60%;
	margin: 0 auto;
}

.modifyFormList {
	margin: 0 auto;
	width: 30%;
	height: 80%;
	height: 400px;
	color: #D5D5D5;
}

#id_i, #pwd_i, #name_i, #email_i, #pwd2_i {
	border: 1px solid #D5D5D5;
	height: 50px;
	width: 99%;
	background-color: white;
}

#memberInsert {
	height: 50px;
}
</style>
</head>

<body>
	<div class="modifyFormContainer">
		<form name="modifyForm" action="${contextPath}/member/modifyMembers">

			<div class="modifyFormList">
				ID <input type="text" value="${modifyForm.id}" id="id_i" readonly>
				<input type="hidden" name="id" value="${modifyForm.id}">


				PASSWORD <input type="password" name="pwd" value="${modifyForm.pwd}"
					id="pwd_i" disabled> PASSWORD CHECK <input type="password"
					name="pwd2" value="${modifyForm.pwd}" id="pwd2_i" disabled>

				NAME <input type="text" name="name" value="${modifyForm.name}"
					id="name_i" disabled> EMAIL <input type="text" name="email"
					value="${modifyForm.email}" id="email_i" disabled>

				<p>
					<input type="button" value="수정" onClick="fn_enable(this.form)"
						id="modifyReady_i"
						style="margin-top: 5px; width: 49.1%; height: 55px; color: white; background-color: green; border: 1px solid green">
					<input type="button" value="회원탈퇴" onClick="fn_delete(modifyForm)"
						id="delete_i"
						style="margin-top: 5px; width: 49.1%; height: 55px; color: white; background-color: green; border: 1px solid green">
					<input type="button" value="수정완료" onClick="fn_modify(modifyForm)"
						id="modify_i" hidden="true"
						style="margin-top: 5px; width: 99.5%; height: 55px; color: white; background-color: green; border: 1px solid green">
			</div>
		</form>
	</div>
</body>
</html>