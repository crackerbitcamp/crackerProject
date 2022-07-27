<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/index/css/reset.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/adminCSS/admincss.css" type="text/css">

</head>

<body>
	<div class="wrap">
		<div id="nav">
	
			<jsp:include page="${nav}" />
	
		</div>
	
		<div id="header">
			<div>
				
			</div>
		</div>
		
		<div id="container">
			<c:if test="${empty display}">
				
				<div id="sectioncontainer">
					<div id="adminSection1" class="section">
		
						<jsp:include page="${adminSection1}" />
					</div>
		
					<div id="adminSection2" class="section">
			
						<jsp:include page="${adminSection2}" />
		
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