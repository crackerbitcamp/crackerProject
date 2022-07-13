<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.header {
	text-align : center;
}

.line {
	margin-top : -10px;
	border-bottom : 1px solid #A9A9A9;
}

img {
	margin-right: 15px;
	fill: white;
}

.managerinfo {
	margin-left : 55px;
	margin-top : 20px;
	margin-bottom : 30px;
	
}

li {
	margin-left : 15px;
	list-style: none;
	margin-bottom : 30px;
}

a {
	color : #000000;
}

#adminList {
	color : #FFFFFF;
	text-decoration : none;
}

</style>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<h1 class="logo"><img src="../image/home/logo.png"
				 onclick= "location.href='/index/admin/adminMain'" style="cursor: pointer;"></h1>
		</div> <!-- header -->
		<div class="line"></div>
		<c:if test="${sionAdminId == null}">
			<input type="button" value="회원가입" id="adminWriteFormBtn">
			<input type="button" value="로그인" id="adminLoginFormBtn"> 
		
		</c:if>
		<c:if test="${sionAdminId != null}">
			<div> <a> ${sionAdminName} 님</a></div>
			<div> ${sionAdminEmail}</div>
		</c:if>
		
		<!-- <div class="managerinfo"><img src="../image/snapchat.svg"><a href="#">관리자닉네임</a></div> -->
		<div class="line"></div>
		<br>
		<div class="management">
			<c:if test="${sionAdminId != null }">
			<ul>
				<li><img src="../image/person.svg"><a href="/index/admin/adminMemberList" id="adminList">사용자 관리</a> </li>
				<li><img src="../image/gear.svg"><a href="#" id="adminList">사용자 관리</a></li>
				<li><img src="../image/person.svg"><a href="#" id="adminList">사용자 관리</a></li>
				<li><img src="../image/gear.svg"><a href="#" id="adminList">사용자 관리</a></li>
				<li><img src="../image/person.svg"><a href="#" id="adminList">사용자 관리</a></li>
				<li><img src="../image/gear.svg"><a href="#" id="adminList">사용자 관리</a></li>
			
			</ul>
			</c:if>
		</div> <!-- management -->
		
	</div> <!-- wrap -->
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$('#adminWriteFormBtn').click(function(){
		location.href="/index/admin/adminWriteForm";

	});
	$('#adminLoginFormBtn').click(function(){
		location.href="/index/admin/adminLoginForm";

	});
</script>
</body>
</html>

