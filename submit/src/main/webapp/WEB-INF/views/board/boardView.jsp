<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<% String myid = (String)session.getAttribute("loginId"); //아이디값 가져옴 %>
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
.boardViewWrap {
	width: 60%;
	margin: 0 auto;
}

.middle {
	width: 90%;
	margin-top: 70px;
	text-align: center;
	border-top: 3px solid black;
	margin: 0 auto;
}

textarea {
	border: 0px;
	resize: none;
	background-color: white;
	font-size: 20px;
}

.title {
	text-align: left;
	padding-left: 60px;
	padding-top: 10px;
	border-bottom: 1px solid #D5D5D5;
	height: 30px;
	padding-top: 10px;
	font-weight: bold;
}

.content {
	padding-top: 10px;
	width: 90%;
	margin: 0 auto;
	text-align: left;
}

#name {
	width: 100%;
	font-size: 15px;
	color: #D5D5D5;
	text-align: right;
}

.listReply {
	width: 90%;
	margin: 0 auto;
}

.viewBottom {
	width: 100%;
	text-align: left;
}

#modifybutton {
	text-align: right;
	padding-top: 10px;
	height: 50px;
	padding-right: 10px;
}

#insertReply {
	height: 80px;
	margin: 0 auto;
	border: 1px solid #D5D5D5;
	display: flex;
}

#insertReply1 {
	padding-top: 15px;
	text-align: center;
	flex: 9;
	background-color: #EAEAEA;
}

#insertReply2 {
	padding-top: 10px;
	background-color: #EAEAEA;
	flex: 1;
	padding-right: 10px;
	text-align: right;
}

textarea.replyText {
	width: 700px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid #D5D5D5;
}

#replybottom {
	width: 90%;
	margin-top: 70px;
	text-align: center;
	border-top: 3px solid green;
	margin: 0 auto;
	border: 1px solid #EAEAEA;
}

#wirteLogo {
	margin-top: 40px;
	margin-left: 80px;
	width: 50%;
	margin-bottom: 10px;
}

#recommand {
	width: 100%;
	text-align: center;
	padding-bottom: 0px;
}

</style>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
    function modifyready(obj) {
		obj.action = "${contextPath}/board/modifyBoardForm.do";
		
		obj.submit();

	} 
	 

	
	 function deleteready(obj) {
		
		
		if(confirm("삭제 하시겠습니까??")){
		obj.action ="${contextPath}/board/deleteBoard.do?articleNO=${boardView.articleNO}";
		obj.submit();
		 }
	} 
	function recommand(obj){
		
		obj.action="${contextPath}/board/recommendation.do?articleNO=${boardView.articleNO}"
				obj.submit();
	}
	
	
	function replyAction(obj) {
		  var id = '<%=myid%>';
		// var id = document.getElementById("loginSession_ia");

		if (id == 'null') {

			alert("로그인한 사용자만 댓글작성이 가능합니다.");
			return false;

		} else {
			//alert("확인널아니면"+id+"로그인한 사용자만 댓글작성이 가능합니다.");
			obj.action = "${contextPath}/reply/insertReplyer";
			obj.submit();
		}

		
	}

	
	$(function listReply() {
		$
				.ajax({

					url : "${contextPath}/reply/listReply.do?articleNO=${boardView.articleNO}&id=${boardView.id}",
					success : function(result) {
						// responseText가 result에 저장됨.
						$("#listReply").html(result);
					}
				});
	});
	

</script>


</head>
<body>

	<div class="boardViewWrap">
		<div id="wirteLogo">
			<img width=25px src="${contextPath}/resources/image/pencil.PNG">자유게시판
		</div>
		<div class="middle">
			<form name="modifyForm" method="post" action="${contextPath}"
				enctype="multipart/form-data">
				<input type="hidden" name="articleNO" value="${boardView.articleNO}">
				<input type="hidden" name="title" value="${boardView.title}">

				<div class="title">${boardView.title}</div>

				<div class="content">



					<div id="name">작성자 :${boardView.id}  / 작성날짜 :
						${boardView.writeDate}</div>

					<br> <br>
					<c:if test="${boardView.imageFileName != null}">
						<img
							src="${contextPath}/download.do?articleNO=${boardView.articleNO}&imageFileName=${boardView.imageFileName}"
							height="250">
						<br>
						<br>
					</c:if>
					<input type="hidden" name="originFileName"
						value="${boardView.imageFileName}"> ${boardView.content} <br>
					<br> <br> <input type="hidden" name="content"
						value="${boardView.content}">


					


					<c:if test="${boardView.imageFileName == null}">
						<input type="hidden" name="originFileName" value="imageNull">

					</c:if>

				</div>
				<div id="recommand">
					<button
						style="border-radius: 5px; width: 60px; height: 40px; color: black; background-color: white; border: 1px solid #EAEAEA"
						onClick="recommand(this.form)">추천
						${boardView.recommendation}</button>
				</div>


				<div id="modifybutton">
					<c:if test="${loginSession.id==boardView.id}">

						<!-- <input type="button" value="수정" id="modifyReady_i"
					onClick="modifyReady(this.form)"> -->
						<input type="button" value="삭제" id="delete_i"
							style="border-radius: 5px; width: 50px; height: 35px; color: white; background-color: black; border: 1px solid black"
							<%-- onClick="location='${contextPath}/board/deleteBoard.do?articleNO=${boardView.articleNO}'"> --%>
									onClick="deleteready(this.form)">

						<input type="button" value="수정" id="modify_i"
							style="border-radius: 5px; width: 50px; height: 35px; color: white; background-color: black; border: 1px solid black"
							onClick="modifyready(modifyForm)">
					</c:if>
				</div>

			</form>

		</div>




		<div id="replybottom">
			<br>
			<br>
			<br>
			<div class="viewBottom">

				<!-- 		
	<p id="text">이 단락에 다른 텍스트를 불러와보죠!</p>
	<button id="requestBtn">데이터 불러오기!</button>
	
	 -->

				<div class="listReply" id="listReply"></div>
			</div>


			<br>
			<form name="replyForm" action="${contextPath}">
				<div id="insertReply">
					<div id="insertReply1">
						<input type="hidden" name="articleNO"
							value="${boardView.articleNO}"> <input type="hidden"
							name="replyer" value="${loginSession.id}"> <%-- <input
						type="hidden" value="${loginSession.id}" id="loginSession_ia"> --%>
						<textarea class="replyText" name="replyContent"></textarea>
						
					 <span style="font-size:13px;">&nbsp;&nbsp;&nbsp;비밀댓글</span>
					  <input id="secret" type="checkbox" value=1  name="secret"/>		
					  			
					</div>
					<div id="insertReply2">
						<input type="button" value="댓글입력" id="insertReply_i"
							style="border-radius: 5px; width: 80px; height: 60px; color: white; background-color: green; border: 1px solid green"
							onClick="replyAction(replyForm)">

					</div>
				</div>

			</form>
		</div>




		<br>
		<br>
	</div>
</body>
</html>