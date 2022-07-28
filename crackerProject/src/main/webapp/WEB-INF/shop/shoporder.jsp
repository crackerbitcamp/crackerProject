<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/index/js/shop/buylist.js"></script>
<style type="text/css" src="/index/css/reset.css"></style>
<style>
/* footer */
#footer {
	position: relative;
	bottom: 8px;
	font-family: 'Noto Sans KR', sans-serif;
}

.footer .footerArea {
	border-top: 1px solid #cccccc;
	padding: 0; /* 좌측과 우축의 여백을 제거 */
	color: #666;
	font-size: 0.9em;
	width: 100%;
	height: 50px;
	margin: 0 auto;
	
}

.footer .footerArea:after {
	content: '';
	display: block;
	clear: both;
}

.btmnav {
	float: right; /* 오른쪽 정렬 */
	margin-right: 30px;
	margin-top: 18px;
}

.btmnav dd {
	float: left;
	
}

.btmnav dd:after {
	content: '|';
	padding: 0 0.7em;
	color: #999;
}

.btmnav dd:last-child:after { /* 마지막 자식 작대기 없애기 */
	content: '';
	padding: 0 0;
}

.btmnav dd a {
	text-decoration: none;
	color :  #666;
	margin-right: 30px;
	
}
.copy {
	float: left;
	line-height: 1.8;
	margin-left: 20px;
	margin-top: 18px;
}

.copy a {
	text-decoration: none;
	color :  #666;
}

.blind {
	display: block;
	overflow: hidden;
	position: absolute;
	left: 0;
	top: -1000em;
}

.containerSearch {
	height: 45px;
	border: 1px solid;
}

.containerSearchIcon {
	background-image: url("/index/image/searchbtn.png");
	background-repeat: no-repeat;
	background-size: 32px;
	height: 45px;
	width: 50px;
	position: absolute;
	margin: 0;
	top: 10px;
	right: -30px;
	cursor: pointer;
}

#cart_itemList {
	width: 980px;
	margin: 0 auto;
	
}

.tabs {
	text-align: center;
}	
.cartItemCount{
	float: left;
    width: 100%;
    border-top: 2px solid #0073e9;
    border-right: 2px solid #0073e9;
    border-bottom: 0;
    border-left: 2px solid #0073e9;
    padding-top: 17px;
    padding-bottom: 16px;
    background: #fff;
    font-weight: 700;
    color: #0073e9;
}


.cartTable {
	width: 100%;
	display: inline-block;
	margin-top: 30px;
	border-top: 1px solid #ddd;
    
	
}
.cartTable tr.head{
	border-bottom: 1px solid #ddd;
    display: inline-block;
    line-height: 40px;
    width: 100%;

}
.cartTable v.body{
	border-bottom: 1px solid #ddd;
	position: relative;
    display: -webkit-inline-box;
    line-height: 20px;
    font-size: 13px;
 
}

.head{
	width: 100%;
    height: 100%;
	border-bottom: 1px solid #ddd;	
	display: -webkit-inline-box;
}

.body{
	padding-top: 12px;
    padding-bottom: 12px;
    border-bottom: 1px solid #ddd;
    width: 100%;
    height: 100%;
    display: -webkit-inline-box;
    }

.cartTable th{
	
    font-size: 13px;}
    
.shop_basket{
	font-size: 24px;
	display: inline-block;
	font-weight: 900;
}
	
.shop_pree{
	display: contents;
	font-size: 13px;
}
.item-checkbox{    
	float: left;
    width: 11%;
    padding-left:14px;
}
.item-checkbox-select{
	float: left;
    width: 100px;
    padding-left:14px;
    display: flex;
}
.item-product{
	float: left;
    width: 72%;
    text-align: center;
}
.item-product-select{
	width: 60%;
    display: inline-block;
    float: left;
}

.item-price{
	float: left;
    width: 13%;
    text-align: center;
    
}
.{
	float: left;
    width: 14%;
    text-align: center;
}

.item-product-select h3{
	text-align : center;
    padding-left: 15px; 
}
.item-product-select p{

    display: flex;
    padding-left: 15px;
}


.totalSum {
	    background: chartreuse;
}

.price-area{
	border: 3px solid #ddd;
    text-align: center;
    line-height: 80px;
    font-size: large;
    word-spacing: 4.6px;
    font-weight: bold;
}

#cart-button{
	text-align: center;
    padding: 30px;
}
.cart-button-shop{

	margin: 10px;
	width: 247px;
    height: 56px;
    background: #fe7600;
    border: 1px solid #fe7600;
    font-size: 16px;
    line-height: 54px;
    color: #fff;
    font-weight: bold;
    cursor: pointer;
}
.item-product-select .minus{
	left : 0;
	right: 0;
	width: 40px;
	height: 40px;
	border-right : 1px solid #dbdbdb;
	cursor: pointer;
}

.item-product-select .plus{
	left : 0;
	right: 0;
	width: 40px;
	height: 40px;
	border-left : 1px solid #dbdbdb;
	cursor: pointer;
}

.item-product-select .input{
width: 40px;
	height: 36px;
	font-size : 18px;
	font-family : "Tahoma";
	text-align : center;
	border: 2px solid;
	padding : 0;	
}
#item-product-img{
    display: flex;
    float: left;
}

.item-price-select{
	float:left;
	width:13%;
	text-align: center;
	position: relative;
    line-height: 60px;
	
}

.itemimg{
 width: 100px;
 height: 50px;
 margin-left: 6px;
 
}

.steps {
	float: right;
    padding-right: 5px;
    margin-top: 20px;
    line-height: 50px;
    font-size: 15px;
    color: #bbb;
    font-weight: 700;
}
.steps em{
    font-weight: 700;
    color: #346aff;	
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type = "hidden" value="${memEmail}" id = "memberemail" name = "memberemail" >
	<div class="shopordercontainer" style="width: 100%; height: 100%; margin: 10px;">
		<span style="margin: 10px; display: block;">주문목록</span>
		<div
			style="width: 700px; position: relative; justify-content: space-between;">
			<input type="text" class="containerSearch"
				placeholder="주문한 상품을 검색할 수 있어요!"
				style="width: 100%; border-radius: 5px; display: block; margin: 10px;">
			<span class="containerSearchIcon"></span>
		</div>
		<div class="head" style="line-height: 48px;">
					    <div class="item-checkbox" >
					    	주문날짜</div>
					    <div class="item-product" >상품정보</div>
					    <div class = "item-price">상품갯수</div>
					    <div class="item-price">상품금액</div>
					</div>
		<div class="test"></div>
		<div class="orderinformation">
			<img src="/index/image/shoporder.png">
			<div>
				<span style="font-weight: 600; font-size: 24px; color: red;">취소/반품/교환
					신청</span><span style="font-weight: 600; font-size: 24px;">전 확인해주세요!</span>
				<span style="display: block; margin-top: 30px; font-size: 20px;"><strong>취소</strong></span>
				<span style="display: block; margin-top: 30px; font-size: 16px;">
					&nbsp;- 여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며,</span> <span
					style="display: block; margin-top: 30px; font-size: 16px;">
					&nbsp;- 취소수수료를 확인하여 2일 이내(주말,공휴일 제외) 처리결과를 문자로 안내해드립니다.(당일 접수 기준,
					마감시간 오후 4시)</span> <span
					style="display: block; margin-top: 30px; font-size: 16px;">
					&nbsp;- 문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지 않습니다.</span> <span
					style="display: block; margin-top: 30px; font-size: 20px;"><strong>반품</strong></span>
				<span style="display: block; margin-top: 30px; font-size: 16px;">
					&nbsp;- 상품 수령 후 7일 이내 신청하여 주세요.</span> <span
					style="display: block; margin-top: 30px; font-size: 16px;">
					&nbsp;- 상품이 출고된 이후에는 배송 완료 후, 반품 상품을 회수합니다.</span> <span
					style="display: block; margin-top: 30px; font-size: 16px;">
					&nbsp;- 설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이 가능합니다. </span> <span
					style="display: block; margin-top: 30px; font-size: 20px;"><strong>교환</strong></span>
				<span style="display: block; margin-top: 30px; font-size: 16px;">
					&nbsp;- 상품의 교환 신청은 고객센터로 문의하여 주세요.</span>
			</div>
			<img src="/index/image/orderimg.png" style="position: absolute;">
		</div>
		<div style="width: 100%; height: 500px;">
			<div
				style="position: absolute; bottom: -1200px; width: 69%; height: 200px;">
				<div id="footer">
					<div class="footerArea">
						<dl class="btmnav">
							<dt class="blind">bottom navigation</dt>
							<dd>
								<a href="#">About</a>
							</dd>
							<dd>
								<a href="#">개인정보보호</a>
							</dd>
							<dd>
								<a href="#">광고문의</a>
							</dd>
							<dd>
								<a href="#">Contact us</a>
							</dd>
							<dd>
								<a href="#">Location</a>
							</dd>
						</dl>

						<p class="copy">
							Copyright &copy; COMPANY Design<br> Powered by Webazit,
							e-mail : <a href="mailto:cracker@community.com">cracker@community.com</a>
						</p>
					</div>
					<!-- footerArea -->

				</div>
				<!-- footer -->
			</div>
		</div>
</body>
</html>