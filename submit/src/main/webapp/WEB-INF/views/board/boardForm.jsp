<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>

input::placeholder {
  color: #EAEAEA;

}
textarea::placeholder {
  color: #EAEAEA;

}

.boardFormWrap{
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
function writeAction(obj){
	
	 var title = document.getElementById("title_i");
	
	 if(title.value=="") {
         alert("제목을 입력해 주세요");
         title_i.focus();
         return false;
     }
	 
	obj.action ="${contextPath}/board/insertBoard.do";
	obj.submit();
}




/* function write(obj) {
	
	var title = $("#title_i").val();
	if(title == ""){
	    alert("제목을 입력하세요");
	    document.boardForm.title.focus();
	    return;
	}else{
		obj.action ="${contextPath}/board/insertBoard.do";
		obj.submit();
		
		
	}
}  */

</script>
</head>
<body>
<div class="boardFormWrap">
<div id="wirteLogo">
<img  width=25px src="${contextPath}/resources/image/pencil.PNG">글쓰기
</div>
<hr width="70%" size=3 color="black">
<br>
<br>

<div class="boardFormContainer">
<form name="boardForm" action="${contextPath}" method="post"  enctype="multipart/form-data">




<input id="id_i" type="hidden" name="id" value="${loginSession.id}">


<input id="title_i" type="text" name="title" placeholder="제목을 입력하세요" >
<p>

<textarea id="content_i" name="content" placeholder="내용을 입력하세요" ></textarea>

<!-- 
<div class="filebox">
<label for="ex_file">업로드</label> 
<input type="file" id="imageFileName_i" name="imageFileName"> 
</div>
 -->


<div id="writeForm">

<div id="imageForm">
<input id="imageFileName_i" type="file" name="imageFileName" >
 </div>

<!-- <input type="submit" value="작성완료"> -->

<div id="buttonForm">
<input type="button" value="작성완료" onClick="writeAction(boardForm)" 
	style="border-radius:5px; width:80px; height:50px; color:white; background-color:green; border:1px solid green">
</div>

</div>

</form>
</div>
</div>
</body>
</html>