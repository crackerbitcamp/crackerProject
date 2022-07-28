<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
a{
	text-decoration: none;
	color : black;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main_menu">
		<div style="height: 122px; display: flex; box-sizing: border-box; text-align: center; align-items: center; padding: 1px; width: 96.2%;">
			<div style="width: 220px; height: 100%; background: #286db4;  border-right: 1px solid #d3d3d3">
				<div style="font-family: '맑은 고딕','malgun gothic';font-size: 32px; color: white; width: 220px; padding-top: 30px;"><a href = "/index/shop/shopMypage" style="color: white;">My배송</a></div>
			</div>
				<div style="height: 100%; width : 30%; background: #82bce2; border-right: 1px solid #d3d3d3;">
					<div style="width: 100%; height: 50%;">
						<div style="font-family: '맑은 고딕','malgun gothic';font-size: 25px; color: white; text-align: center;">배송준비중</div>
					</div>
					<div style="width: 100%; height: 50%;">
						<div style="font-family: '맑은 고딕','malgun gothic';font-size: 32px; color: white; text-align: center;">0개</div>
					</div>
				</div>
				<div style="height: 100%; width : 30%; background: #82bce2; border-right: 1px solid #d3d3d3;">
					<div style="width: 100%; height: 50%;">
						<div style="font-family: '맑은 고딕','malgun gothic';font-size: 25px; color: white; text-align: center;">배송중</div>
					</div>
					<div style="width: 100%; height: 50%;">
						<div style="font-family: '맑은 고딕','malgun gothic';font-size: 32px; color: white; text-align: center;">0개</div>
					</div>
				</div>
				<div style="height: 100%; width : 30%; background: #82bce2; border-right: 1px solid #d3d3d3;">
					<div style="width: 100%; height: 50%;">
						<div style="font-family: '맑은 고딕','malgun gothic';font-size: 25px; color: white; text-align: center;">배송완료</div>
					</div>
					<div style="width: 100%; height: 50%;">
						<div style="font-family: '맑은 고딕','malgun gothic';font-size: 32px; color: white; text-align: center;">0개</div>
					</div>
				</div>
		</div>
	</div>
		<div style="float: left; width: 220px; background: #e1e4e6;">
			<ul style="list-style: none; margin: 0; padding: 0; border: 1px solid #80878d;">
				<li style="font-weight: bold; margin-bottom: 10px;">My 쇼핑</li>
				<li><a href = "/index/shop/cartView">장바구니</a></li>
				<li><a href="/index/shop/shoporder">주문목록/배송조회</a></li>
				<li>구매완료</li>
				<li>취소/반품/교환/환불내역</li>
			</ul>
			<ul style="list-style: none; margin: 0; padding: 0; border: 1px solid #80878d;">
				<li style="font-weight: bold; margin-bottom: 10px;">My 활동</li>
				<li><a href = "/index/shop/customerWriteForm" style="color: black; text-decoration: none;">문의하기</a></li>
				<li>문의내역 확인</li>
				<li>찜 리스트</li>
			</ul>
			<ul style="list-style: none; margin: 0; padding: 0; border: 1px solid #80878d;">
				<li style="font-weight: bold; margin-bottom: 10px;">My 정보</li>
				<li><a href = "/index/shop/shopmemberpasswordcheckForm">개인정보확인/수정</a></li>
				<li><a href="/index/shop/shopproductbuy">배송지 관리</a></li>
			</ul>
		</div>
				<div style="float: left; width: 70%; margin: 10px 0 0 10px;">
				<c:if test="${empty MyPageInclude}">
				
				</c:if>
					<jsp:include page="${MyPageInclude}"></jsp:include>
				</div>

	</body>
	
</html>