<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	margin: 0 auto;
	height: 1500px;
	width: 1500px;
}
#nav {
	width: 20%;
	height: 100%;
	float: left;
	background: #808080;
}
#header {
	width: 75%;
	height: 5%;
	text-align: center;
	float: left;
}
#container {
	float: left;
	width: 75%;
	height: 100%;
	background: #F0F8FF;
}
#section {
	width: 90%;
	height: 90%;
}
#section:after {
	conternt: '';
	display: block;
	clear: both;
}
div {
/* 	border: red solid 1px; */
}
#sectionHeader {
	margin-top: 2%;
	margin-left: 3%;
	float: left;
	width: 93%;
	height: 5%;
	background: #ffffff;
}
.section {
	float: left;
	margin-top: 5%;
	margin-left: 3%;
	width: 45%;
	height: 30%;
	background: #ffffff;
	box-shadow: 1px 1px 3px #333333;
}
#section:after {
	conternt: '';
	display: block;
	clear: both;
}
</style>
</head>

<body>
	<div id="nav">

		<jsp:include page="${nav}" />

	</div>

	<div id="header"></div>

	<div id="container">
		<c:if test="${empty display}">
			<div id="sectionHeader"></div>
			컨테이너
			<div id="adminSection1" class="section">

				<jsp:include page="${adminSection1}" />
			</div>

			<div id="adminSection2" class="section">
				세션2
				<jsp:include page="${adminSection2}" />

			</div>
			<div id="adminSection3" class="section">
				세션3
				<jsp:include page="${adminSection3}" />

			</div>
			<div id="adminSection4" class="section">
				세션4
				<jsp:include page="${adminSection4}" />

			</div>
		</c:if>

		<c:if test="${not empty display}">
			<jsp:include page="${display}" />
		</c:if>
	</div>
</body>
</html>