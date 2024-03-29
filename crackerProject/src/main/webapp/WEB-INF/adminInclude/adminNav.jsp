<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	
		<div class="header">
			<h1 class="logo"><img src="../image/home/logo.png"
				 onclick= "location.href='/index/admin/adminMain'" style="cursor: pointer;"></h1>
		</div> <!-- header -->
		<div class="line">
		<c:if test="${sionAdminId == null}">
			<input type="button" value="회원가입" id="adminWriteFormBtn">
			<input type="button" value="로그인" id="adminLoginFormBtn"> 
		
		</c:if>
		<c:if test="${sionAdminId != null}">
			<div class="adminmember"> ${sionAdminName} 님 </div>
			<div class="adminmember"> ${sionAdminEmail}</div>
		</c:if>
		
		<!-- <div class="managerinfo"><img src="../image/snapchat.svg"><a href="#">관리자닉네임</a></div> -->
		</div>
		<br>
		<div class="management">
			<c:if test="${sionAdminId != null }">
			<ul>
				<li><img src="../image/person.svg"><a href="/index/admin/adminMemberList" id="adminList">사용자 관리</a> </li>
				<li class="boardMenuTop"><img src="../image/gear.svg"><a id="adminList">게시판 관리</a>
					<ul class="boardMenuTopUl">
						<li class="boardMenu"><img src="../image/gear.svg"><a href="/index/admin/adminBoardList" id="adminList">자유게시판</a></li>
						<li class="boardMenu"><img src="../image/gear.svg"><a href="/index/admin/adminRecipeBoardList" id="adminList">레시피게시판</a></li>
		
					
					</ul>
				</li>
				<li class="productMenuTop"><img src="../image/person.svg"><a id="adminList">상품관리</a>
					<ul class="productMenuTopUl">
						<li class="productMenu"><img src="../image/gear.svg"><a href="/index/product/productWriteForm">상품 등록</a></li>
						<li class="productMenu"><img src="../image/gear.svg"><a href="/index/product/productBoardWriteForm">상품게시글 등록</a></li>
						<li class="productMenu"><img src="../image/gear.svg"><a href="/index/product/productMangeList">상품 목록</a></li>
						<li class="productMenu"><img src="../image/gear.svg"><a href="/index/product/productMangeBoardList">상품 게시글</a></li>
						
					</ul>
				</li>
				<li><img src="../image/gear.svg"><a href="/index/customer/customerList" id="adminList">문의내용</a></li>
			
			</ul>
			</c:if>
		</div> <!-- management -->
		
	
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$('#adminWriteFormBtn').click(function(){
		location.href="/index/admin/adminWriteForm";

	});
	$('#adminLoginFormBtn').click(function(){
		location.href="/index/admin/adminLoginForm";

	});
	
$(function(){
	var count = 1;
	$('.boardMenu').hide();
	
	$('.boardMenuTop').click(function(){
		if(count%2 == 0){
			$('.boardMenu').hide();
			count++;
		}else{
			$('.boardMenu').show();
			count++;
		}
		
	});
});

$(function(){
	var countProduct = 1;
	$('.productMenu').hide();
	
	$('.productMenuTop').click(function(){
		if(countProduct%2 == 0){
			$('.productMenu').hide();
			countProduct++;
			
		}else{
			$('.productMenu').show();
			countProduct++;
			
		}
		
	});
});
</script>
</body>
</html>

