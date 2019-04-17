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
.headcon {
	display: flex;
	background-color: #EAEAEA;
	line-height: 250%;
}

.menu {
	/* 

border-bottom:1px solid #D5D5D5;
color:#5A5A5A;
padding-left:300px;
padding-top:9px; */
	/* 	padding-left:300px; */
	text-align: left;
	padding-left: 20%;
	flex: 5.5;
}

.size {
	flex: 4.5;
}

#middleMenu {
	text-decoration: none;
	color: #5A5A5A;
	font-size: 95%;
	font-family: "나눔고딕";
	color: #A6A6A6;
}

em {
	font-style: normal;
	color: #D5D5D5;
}
</style>
</head>
<body>
	<div class="headcon">
		<div class="menu">

			<a id="middleMenu" href="${contextPath}/"> &nbsp;홈으로&nbsp; </a><em>｜</em>
			<a id="middleMenu" href="${contextPath}/board/listBoard.do?pageNum=1">
				&nbsp;게시판&nbsp; </a><em>｜</em> <a id="middleMenu" href="#">
				&nbsp;게시판 기능 설명&nbsp; </a>

		</div>
		<div class="size"></div>
	</div>
</body>
</html>