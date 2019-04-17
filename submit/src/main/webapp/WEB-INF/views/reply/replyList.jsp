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
table.replyTable {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid white;
	/* 	border-top:1px solid white;
	border-right:1px solid white;
	border-left:1px solid white; */
	border-bottom: 1px solid #D5D5D5;
}

tr.tr1 {
	border-bottom: 1px solid white;
}

td.td1 {
	width: 80%;
	/* border-right:1px solid white; */
}

#replyDate {
	color: #D5D5D5;
	font-size: 15px;
}

#replyDelete {
	text-decoration: none;
	color: #A6A6A6;
}

#replyDeleteAlign {
	padding-right: 10px;
	text-align: right;
}
</style>
</head>
<body>
	<div class="reply">
		<table border=1 class="replyTable">
			<c:forEach var="reply" items="${listReply}">
				<tr class="tr1">
					<td class="td0">${reply.replyer}</td>
					<td id="replyDate">${reply.writedate}</td>
				</tr>
				<tr>
				<c:choose>
				
				<c:when test="${reply.secret==0}">
				
				<td class="td1" >${reply.replyContent}</td>
				
				</c:when>
				<%-- <c:when test="${reply.secret==1}">
				
				<td class="td1" style="color:#D5D5D5">비밀댓글입니다.</td>
				
				</c:when>
				<c:when test="${reply.secret==1 && loginSession.id==null}">
				
				<td class="td1" style="color:#D5D5D5">비밀댓글입니다.</td>
				
				</c:when> --%>
				<c:when test="${reply.secret==1 && loginSession.id==reply.replyer}">
				
				<td class="td1">${reply.replyContent}</td>
				
				</c:when>
				<c:when test="${reply.secret==1 && loginSession.id==checkid}">
				
				<td class="td1">${reply.replyContent}</td>
				
				</c:when>
				<c:when test="${reply.secret==1 && loginSession.id=='admin'}">
				
				<td class="td1">${reply.replyContent}</td>
				
				</c:when>
				<c:otherwise>
				<td class="td1" style="color:#D5D5D5">비밀댓글입니다.</td>
				
				</c:otherwise>
				
				</c:choose>
				
			
			
					<td id="replyDeleteAlign"><c:if
							test="${loginSession !=null && loginSession.id==reply.replyer && loginSession.id!='admin'}">
							<a id="replyDelete"
								href="${contextPath}/reply/deleteReply.do?replyNO=${reply.replyNO}&articleNO=${articleNO}">
								삭제 </a>
						</c:if> <c:if test="${loginSession !=null && loginSession.id=='admin'}">
							<a id="replyDelete"
								href="${contextPath}/reply/deleteReply.do?replyNO=${reply.replyNO}&articleNO=${articleNO}">
								삭제 </a>
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>