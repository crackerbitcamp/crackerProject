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
	<div class="main_menu">
		<div style="height: 122px; display: flex; box-sizing: border-box; text-align: center; align-items: center; padding: 1px; width: 96.2%;">
			<div style="width: 220px; height: 100%; background: #286db4;  border-right: 1px solid #d3d3d3">
				<div style="font-family: '맑은 고딕','malgun gothic';font-size: 32px; color: white; width: 220px; padding-top: 30px;">My배송</div>
			</div>
				<div style="height: 100%; background: #82bce2; border-right: 1px solid #d3d3d3;">
					<div style="width: 220px; height: 50%;">
						<div style="font-family: '맑은 고딕','malgun gothic';font-size: 25px; color: white; width: 220px;">배송중</div>
					</div>
					<div style="width: 220px; height: 50%;">
						<div style="font-family: '맑은 고딕','malgun gothic';font-size: 32px; color: white; width: 220px;">0개</div>
					</div>
				</div>
			<div style="width: 61%; background: #82bce2; height: 100%;">
				<div style="height: 40%; margin-top:10px; margin-left:10px; font-weight: bold; text-align: left; padding: 0 0 10px; color: white; border-bottom: 1px solid #78add0; display: flex;">충전 금액 
					<span style="text-align: right;color: white; width: 80%;">0 원</span> 
				</div>
				<div style="height: 50%;  margin-top:10px; margin-left:10px; font-weight: bold; text-align: left; display: flex; color: white;">Cracker캐시 
					<span style="text-align: right;color: white; width: 78%;">0 원</span>
				</div>
			</div>
		</div>
	</div>
		<div style="float: left; width: 220px; background: #e1e4e6;">
			<ul style="list-style: none; margin: 0; padding: 0; border: 1px solid #80878d;">
				<li style="font-weight: bold; margin-bottom: 10px;">My 쇼핑</li>
				<li><a href="/index/shop/shoporder">주문목록/배송조회</a></li>
				<li>취소/반품/교환/환불내역</li>
				<li></li>
			</ul>
			<ul style="list-style: none; margin: 0; padding: 0; border: 1px solid #80878d;">
				<li style="font-weight: bold; margin-bottom: 10px;">My 활동</li>
				<li>문의하기</li>
				<li>문의내역 확인</li>
				<li>찜 리스트</li>
			</ul>
			<ul style="list-style: none; margin: 0; padding: 0; border: 1px solid #80878d;">
				<li style="font-weight: bold; margin-bottom: 10px;">My 정보</li>
				<li>개인정보확인/수정</li>
				<li>결제수단</li>
				<li>배송지 관리</li>
			</ul>
		</div>
				<div style="float: left; width: 70%; margin: 10px 0 0 10px;">
				<c:if test="${empty display}">
				
				</c:if>
					<jsp:include page="${MyPageInclude}"></jsp:include>
				</div>

	</body>
	
</html>