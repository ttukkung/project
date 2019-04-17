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
<link href="https://fonts.googleapis.com/css?family=Gugi" rel="stylesheet">
<style>
.headerdiv {
	
	color: white;
	/* text-align: right; */
	/* padding-right: 280px; */
	display: flex;


}

.mainText {
	font-family:"Gugi", 휴먼매직체;
	/* font-family: 'Gugi', cursive; */
	font-size:35px;
    font-weight:bold;
/* 	padding-left: 130px; */
	flex:4.5;
	padding-top: 15px;

	text-align:center;
}

.topMenu {
	flex: 5.5;
	padding-top: 12px;
	 font-weight:bold;

	 text-align:center;
}

a.header {
	text-decoration: none;
	color: white;
	padding-right: 40px;
}
em{
font-size:10px;
padding-top: 0px;
}
</style>
</head>
<body>




	<div class="headerdiv">

		<br>


		<div class="mainText">
		
		게시판<em>beta</em>
		
		</div>

		<div class="topMenu">
			<c:choose>
				<c:when
					test="${loginSession.id != null and loginSession.id !='admin' }">

					<a class="header"
						href="${contextPath}/member/modifyForm.do?id=${loginSession.id}">내정보</a>
					<a class="header" href="#">고객센터</a>
					<a class="header" href="${contextPath}/member/logout.do">로그아웃</a>

				</c:when>
				<c:when test="${loginSession.id =='admin'}">
			
				관리자 모드입니다.&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="header" href="${contextPath}/member/listMembers.do">회원정보</a>
  				 <a class="header" href="${contextPath}/member/logout.do">로그아웃</a>
				</c:when>
				<c:otherwise>

					<a class="header" href="${contextPath}/member/memberForm">회원가입</a>
					<a class="header" href="#">고객센터</a>
					<a class="header" href="${contextPath}/member/loginForm">로그인</a>

				</c:otherwise>
			</c:choose>
		</div>
	</div>




</body>
</html>