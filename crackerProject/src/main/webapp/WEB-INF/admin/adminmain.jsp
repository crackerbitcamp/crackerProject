<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	border: red solid 1px;
}

body {
	margin: 0;
	padding: 0;
	height: 1500px;
	width: 1500px;
}

#nav {
	width: 20%;
	height: 100%;
	float: left;
}

#header {
	width: 80%;
	height: 10%;
	text-align: center;
	float: left;
}

#container {
	float: left;
	width: 75%;
	height: 100%;
	background: #ffff00;
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
</style>
</head>
<body>
	<div id="nav">

		<jsp:include page="/WEB-INF/adminMain/adminNav.jsp"></jsp:include>

	</div>
	

	<div id="container">
		컨테이너
		<div id="section">
			세션
			<c:if test="${not empty display}">
				<jsp:include page="${display}" />
			</c:if>
		</div>
	</div>
</body>



</html>