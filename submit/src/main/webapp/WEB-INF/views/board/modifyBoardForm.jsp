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
.modifyBoardFormWrap{
width:70%;
margin:0 auto;

}

.boardFormContainer{
width:60%;

margin:0 auto;
}
#wirteLogo{
margin-top:40px;
margin-left:200px;
width:50%;



}
#title_i{
width:99.3%;
}

#content_i{
width:99%;
height:300px;
resize:none;
}

#imageFileName_i{ 
/* display: inline-block;  */
padding: .7em .75em;
color: #999; 
font-size: inherit; 
line-height: normal; 
vertical-align: middle; 
background-color: #fdfdfd; 
border: 1px solid #ebebeb; 
border-bottom-color: #e2e2e2; 
border-radius: .25em; }

#writeForm{
/* display:felx; */


}
#imageForm{
/* flex:7; */
float:left;

}
#buttonForm{
/* flex:2; */
float:right;


}


</style>
<script>
function modifyAction(obj) {
	
	 var title = document.getElementById("title_i");
		
	 if(title.value=="") {
         alert("제목을 입력해 주세요");
         title_i.focus();
         return false;
     }
	
	obj.action = "${contextPath}/board/modifyBoard.do?";
	obj.submit();

}


</script>
</head>
<body>
<div class="modifyBoardFormWrap">
<div id="wirteLogo">
<img  width=25px src="${contextPath}/resources/image/pencil.PNG">글수정하기
</div>
<hr width="70%" size=3 color="black">
<br>
<br>

<div class="boardFormContainer">
	<form name="modifyForm" method="post" action="${contextPath}"
			enctype="multipart/form-data">
<input type="hidden" name="articleNO" value="${list.articleNO}">
	<c:if test="${originFileName != null}">
<input type="hidden" name="originFileName" value="${originFileName}">
	</c:if>
	<c:if test="${originFileName == imageNull}">
	
	</c:if>
	

<input id="title_i" type="text" name="title" value="${list.title}">
<p>
<textarea id="content_i" name="content">${list.content}</textarea>


<div id="writeForm">
<div id="imageForm">
<input  id="imageFileName_i"  type="file" name="imageFileName" value="${originFileName}" >
</div>

<div id="buttonForm">
	<input type="button" value="수정" id="modify_i" onClick="modifyAction(modifyForm)"
style="border-radius:5px; width:80px; height:50px; color:white; background-color:green; border:1px solid green">
	</div>
</div>
</form>
</div>
</div>
</body>
</html>