<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<style>
body {
	margin: 0px;
}

#container {
	/*  width: 1920px; */
	width: 100%;
	min-width: 1100px;
	margin: 0px;
}

#header {
	line-height: 250%;
	height: 250%;
	background-color: green;
	margin: 0px;
	color: white;
}

#content {
	margin: 0px;
	width: 100%;
	padding: 0px;
}
/*  #footer {
     
          padding: 5px;
        margin-bottom: 5px;
        border: 1px solid #bcbcbc;
      	  text-align:right;
      } */
</style>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="header2">
			<tiles:insertAttribute name="header2" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<%--   <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div> --%>
	</div>
</body>
</html>