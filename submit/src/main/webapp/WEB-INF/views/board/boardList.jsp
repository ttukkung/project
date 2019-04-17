<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
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
body {
	
}

.bigContainer {
	width: 60%;
	margin: 0 auto;
	height: 850px;
}

.left {
	width: 70%;
	margin-top: 10px;
	text-align: center;
	height: 760px;
	float: left;
}

.right {
	margin-top: 53px;
	margin-left: 15px;
	width: 25%;
	height: 710px;
	float: left;
}

.right1 {
	width: 100%;
	height: 340px;
	float: left;
	border: 1px solid #D5D5D5;
}

.right2 {
	margin-top: 10px;
	width: 100%;
	height: 340px;
	float: left;
	border: 1px solid #D5D5D5;
}

table {
	margin: 0 auto;
	border-collapse: collapse;
	width: 95%;
	border-right: 0px;
}

tr {
	box-sizing: border-box;
	height: 39px;
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

th.title {
	width: 60%;
	font-size: 15px;
}

.search {
	text-align: left;
	margin-top: 10px;
	width: 50%;
	flex: 3.5;
}

.bottom {
	display: flex;
	width: 95%;
	text-align: center;
	margin: 0 auto;
}

.pageBottom {
	text-align: left;
	padding-top: 20px;
	padding-left: 80px;
	flex: 5.5;
}

.write {
	text-align: right;
	flex: 1;
}

.boardTop {
	display: flex;
	width: 95%;
	margin: 0 auto;
}

.boardName {
	text-align: left;
	flex: 3;
	padding-left: 20px;
	padding-top: 10px;
}

#listTitle {
	font-size: 15px;
	text-decoration: none;
	color: #5A5A5A;
}

.boardTop {
	margin-bottom: 5px;
}

#pageNumber {
	font-size: 15px;
	text-decoration: none;
	color: #A6A6A6;
	font-size: 20px;
}

#adminDelete {
	text-decoration: none;
	color: #A6A6A6;
}

table.sideTable {
	color: black;
	font-size: 5px;
}

tr.sideTable {
	height: 30px;
	font-size: 15px;
	border: 1px solid white;
}

th.sideTable {
	background-color: white;
	border: 1px solid white;
	color: #8C8C8C;
	font-size: 15px;
	border-bottom: 3px dashed #D5D5D5;
	text-align: left;
	padding-left: 30px;
}

#sideTableFont {
	text-decoration: none;
	color: black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function page(idx) {
		var pageNum = idx;
		var contentNum = 15;
		location.href = "${contextPath}/board/listBoard.do?pageNum=" + pageNum
				+ "&option=${option}&keyword=${keyword}" + "&contentNum="
				+ contentNum;
	}
</script>
</head>
<body>
	<div class="bigContainer">


		<div class="left">
			<div class="boardTop">

				<div class="boardName">
					<img width=25px src="${contextPath}/resources/image/pencil.PNG">
					자유게시판


				</div>


			</div>


			<div class="tablebody">
				<table border=1>
					<tr>
						<th>글번호</th>
						<th class="title">제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<c:if test="${loginSession.id == 'admin'}">
							<th>삭제</th>
						</c:if>
					</tr>
					<c:forEach var="board" items="${Alllist}">
						<tr>
							<td>${board.articleNO}</td>

							<td><a id="listTitle"
								href="${contextPath}/board/viewBoard.do?articleNO=${board.articleNO}">${board.title}</a>
								[${board.replyCnt}]</td>
							<td>${board.id}</td>

							<td><fmt:parseDate var="parsedDate"
									value="${board.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
									var="newFormattedDateString" value="${parsedDate}"
									pattern="yy-MM-dd" /> ${newFormattedDateString}​</td>
							<td>${board.hit}</td>
							<c:if test="${loginSession.id == 'admin'}">
								<td><a id="adminDelete"
									href="${contextPath}/board/deleteBoard.do?articleNO=${board.articleNO}">삭제</a></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br>
			<div class="bottom">

				<div class="search">
					<form action="${contextPath}/board/listBoard.do">
						<input type="hidden" name="pageNum" value=1> <select
							name="option" style="width: 50px; height: 25px;">
							<option value="all">전체</option>
							<option value="id">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> <input type="text" name="keyword"
							style="width: 120px; height: 20px;"> <input type="submit"
							style="margin-top: 5px; border-radius: 5px; width: 40px; height: 25px; color: white; background-color: black; border: 1px solid black"
							value="검색">
					</form>
				</div>

				<div class="pageBottom">
					<c:if test="${page.prev}">
						<a id="pageNumber"
							href="javascript:page(${page.getStartPage()-1});">이전</a>
					</c:if>
					<c:forEach begin="${page.getStartPage()}"
						end="${page.getEndPage()}" var="idx">
						<a id="pageNumber" href="javascript:page(${idx});">&nbsp;${idx}&nbsp;</a>
						<%-- <input id="pageButton" type="button" value="${idx}" onClick="location='javascript:page(${idx});'"> --%>
						<%-- 	<a href="javascript:page(${idx});"> <span id="pageButton">${idx}</span></a>  --%>
					</c:forEach>
					<c:if test="${page.next}">
						<a id="pageNumber" href="javascript:page(${page.getEndPage()+1});">다음</a>
					</c:if>
				</div>
				<div class="write">
					<input type="button" value="글쓰기"
						onClick="location='${contextPath}/board/boardForm.do'"
						style="border-radius: 5px; width: 70px; height: 50px; color: white; background-color: green; border: 1px solid green">
				</div>

			</div>


		</div>
		<div class="right">
			<div class="right1">


				<table class="sideTable">
					<tr>
						<th class="sideTable">추천수 Best TOP 10</th>
					</tr>
					<c:forEach var="recommendationList" items="${recommendationList}">
						<tr class="sideTable">
							<td>&nbsp; &nbsp; · &nbsp;<a id="sideTableFont"
								href="${contextPath}/board/viewBoard.do?articleNO=${recommendationList.articleNO}">${recommendationList.title}</a>
							</td>
						</tr>
					</c:forEach>
				</table>

			</div>
			<div class="right2">
				<table class="sideTable" border=1>
					<tr>
						<th class="sideTable">조회수 Best TOP 10</th>
					</tr>
					<c:forEach var="hitList" items="${hitList}">
						<tr class="sideTable">
							<td>&nbsp; &nbsp; · &nbsp;<a id="sideTableFont"
								href="${contextPath}/board/viewBoard.do?articleNO=${hitList.articleNO}">${hitList.title}</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<br>



	</div>
</body>
</html>