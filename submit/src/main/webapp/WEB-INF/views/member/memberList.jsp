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
.middle {
	margin-top: 50px;
	text-align: center;
	width: 70%;
	margin: 0 auto;
}

table {
	margin: 0 auto;
	border-collapse: collapse;
	width: 70%;
	border-right: 0px;
}

tr {
	box-sizing: border-box;
	height: 30px;
	border: 1px solid #D5D5D5;
}

td {
	border: 0px;
}

th {
	background-color: #EAEAEA;
	border: 0px;
	height: 30px;
}
</style>
</head>
<body>
	<div class="middle">
		<br> <br>
		<c:choose>
			<c:when test="${loginSession.id=='admin'}">
				<table>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>가입날짜</th>
					</tr>
					<c:forEach var="member" items="${memberList}">
						<tr>
							<td>${member.id}</td>
							<td>${member.pwd}</td>
							<td>${member.name}</td>
							<td>${member.email}</td>
							<td>${member.joinDate}</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
잘못된접근입니다.
</c:otherwise>
		</c:choose>
	</div>
</body>
</html>