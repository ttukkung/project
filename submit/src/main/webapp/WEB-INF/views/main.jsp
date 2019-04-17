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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Oswald"
	rel="stylesheet">


<style>
body {
	
}

p {
	background: rgba(0, 0, 0, 0.5);
	height: 450px;
	margin-top: 0px;
	padding-left: 400px;
	font-family: 'Nanum Gothic', sans-serif;
	font-family: 'Oswald', sans-serif;
	/*  font-family: 'Nanum Gothic', sans-serif; */
}

.mainWelcome {
	width: 100%;
	height: 650px;
	background-image: url('${contextPath}/resources/image/green.jpg');
	background-size: 1920px;
	padding-top: 130px;
}

#r1 {
	widht: 1000px;;
	font-size: 50px;
	color: white;
	font-weight: bold;
}

#r2 {
	font-size: 30px;
	color: white;
}
</style>
</head>
<body>
	<%-- <img width=100% height=700px src="${contextPath}/resources/image/green.jpg"><br> --%>

	<div class="mainWelcome">

		<p>
			<br> <span id="r1">깃연동테스트development environment </span><br> <br>
			<span id="r2"> OS:Windows 10<br> JDK:jdk-10<br>
				Language:JSP/CSS/JAVASCRIPT/HTML5<br> Framework:SPRING<br>
				Database:Oracle Database 11g Express Edition Release 11.2.0.2.0<br>
				Was:Apache-Tomcat 9.0<br>




			</span>


		</p>

	</div>



























</body>
</html>