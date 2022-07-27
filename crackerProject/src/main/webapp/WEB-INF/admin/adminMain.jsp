<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/index/css/reset.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/adminCSS/admincss.css">

</head>

<body>
	<div class="wrap">
		<div id="nav">
	
			<jsp:include page="${nav}" />
	
		</div>
	
		<div id="header"></div>
		
		<div id="container">
			<c:if test="${empty display}">
				<div id="sectionHeader"></div>
				<div id="sectioncontainer">
					<div id="adminSection1" class="section">
		
						<jsp:include page="${adminSection1}" />
					</div>
		
					<div id="adminSection2" class="section">
			
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
				</div>
			</c:if>
	
			<c:if test="${not empty display}">
				<jsp:include page="${display}" />
			</c:if>
			
		
			
		</div>
	</div>
</body>
</html>