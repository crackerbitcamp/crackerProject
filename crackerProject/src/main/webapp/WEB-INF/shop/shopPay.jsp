<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css" src="/index/css/reset.css"></style>
<style type="text/css">
h2 {
    padding-left: 2px;
    margin-bottom: 8px;
    font-size: 20px;
    font-weight: 700;
    border-bottom: 3px solid #bbb;
    padding-bottom: 13px;
    color: #333;
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
    width: 3%;
    padding-left:14px;
    display: flex;
}
.item-product{
	float: left;
    width: 74%;
    text-align: center;
}
.item-product-select{
	width: 69%;
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
	display: flex;
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
    line-height: 145px;
	
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
.checkouttitle {
border-bottom: 2px solid;
}
.UserInfo {
	margin-top: 32px;
}
.Checkoutinfo h2{
	padding-left: 2px;
    margin-bottom: 8px;
    font-size: 20px;
    font-weight: 700;
    border-bottom: 3px solid #bbb;
    padding-bottom: 13px;
    color: #333;
}
.Checkoutinfo dl{
	display: flex;

    padding-bottom: 18px;
    border-bottom: 1px solid #ddd;
}

.Checkoutinfo dl dt{
	float: left;
	font-family: sans-serif;
    font-size: 100%;
    width: 104px;
    padding-left: 25px;
}
.Checkoutinfo dl dd{
	float: left;
	font-family: sans-serif;
    font-size: 100%;
}
.deliveryTable{
	border: 1px solid #bbb;
}
.dropship{
	display: inline-block;
	border: 1px solid;
	width: 100%;

}
#dropshipday{
	padding: 10px 15px 10px 20px;
	line-height: 40px;
	background-color: #eee;
	
}
.dropiteminfo{

    display: inline-block;
    padding: 10px 20px 10px 20px;

}
.productName {
    width: 600px;
	color: #555;
    line-height: 40px;
    float: left;
}
.productqty {
	float: left;
	padding: 14px 20px 10px 20px;
    font-size: 12px;
    
}
.dropshipday span{
	font-size:18px;
	font-weight: 700;
}
</style>
</head>
<body>
<div id="cartViewList">

	<section id="cart_itemList" class="cart_itemList">        
        <section class="checkouttitle">
            <h1 class="shop_basket">주문/결제</h1>
     		 <span class="steps">
			 장바구니&gt;<em>주문결제 &gt;</em>주문완료
			</span>
		</section>
		<section id="UserInfo" class="Checkoutinfo">
			<h2>구매자정보</h2>
			<dl>
				<dt>이름 </dt>
				<dd id="membername">${item.memberDTO.membername }</dd>
			</dl>	
			<dl>
				<dt>이메일 </dt>
				<dd id="memberemail">${item.memberDTO.memberemail }</span></dd>
			</dl>
			<dl>
				<dt>휴대폰 번호 </dt>
				<dd id="membertel">${item.memberDTO.membertel1 }-${item.memberDTO.membertel2 }-${item.memberDTO.membertel3 }</dd>
			</dl>
		</section>
		<section id="RecipientInfo" class="Checkoutinfo">
			<h2>받는사람정보</h2>
			<dl>
				<dt>이름 </dt>
				<dd id="membername">${item.memberDTO.membername }</dd>
			</dl>	
			<dl>
				<dt>배송주소 </dt>
				<dd id="memberaddress">${item.memberDTO.memberaddress1} ${item.memberDTO.memberaddress2}</dd>
			</dl>
			<dl>
				<dt>연락처 </dt>
				<dd id="membertel">${item.memberDTO.membertel1 }${item.memberDTO.membertel2 }${item.memberDTO.membertel3 }</dd>
			</dl>
		</section>
		<section id="delivery" class="UserInfo">
			<h2 style="border-bottom: 0px;">배송</h2>
				<div class="dropship">
					<dt id="dropshipday" class="dropshipday"><span>${item.day }</span> 도착 예정</dt>
					<div class="dropiteminfo">
						<dt class="productName" id="productName">${item.productJoinDTO.productName }</dt>
						<input type="hidden" class="random1" id="merchant_uid" value="">
						<input type="hidden" id="productSubject" value="${item.productJoinDTO.productSubject }">
						<input type="hidden" id="mainPhoto" value="${ item.productJoinDTO.mainPhoto}">
						<input type="hidden" id="productbuydate" value="${ item.day}">
						<input type="hidden" id="productqty1" value="${item.shopqty}">
						<dt class="productqty" id="productqty">${item.shopqty }개 / 무료배송</dt>
					</div>
				</div>
		</section>
		<section id="priceInfo" class="Checkoutinfo">
			<h2>결제정보</h2>
			<dl>
				<dt>총상품가격 </dt>
				<dd>${item.totalprice }원</dd>
			</dl>	
			<dl>
				<dt>즉시할인 </dt>
				<dd>0원</dd>
			</dl>
			<dl>
				<dt>배송비 </dt>
				<dd>0원</dd>
			</dl>
			<dl>
				<dt>총 결제금액 </dt>
				<dd id="totalprice" class="totalprice">${item.totalprice }원</dd>
			</dl>
			<dl>
				<dt>총결제방법 </dt>
				<dd class="total">
					<div> 
						<input type="radio" id="huey" name="drone" value="huey"checked><label for="huey">카드결제</label>
					</div>
				</dd>
			</dl>
		</section>
		
		<section class="Checkoutinfo">
			<div id="cart-button">
				<button class="cart-button-shop" id="cart-button-shop" onClick="location.href='/index/shop/shopmain'">쇼핑 하러가기</button>
				<button onclick="requestPay()" class="cart-button-shop"  id="cart-button-buy" >결제하기</button>
			</div>            
		</section>
	</section>
	
</body>

<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- iamport.payment.js  1.1.8 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
$(function(){ 
const random1 = Math.floor(Math.random()*100000000000000);
console.log(random1);

$('.random1').val(random1);

});


function requestPay() {
	var IMP = window.IMP; // 생략 가능
    IMP.init("imp06570380"); // 예: imp00000000
    
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: $('#merchant_uid').text(),
        name: $('#productName').text(),
        amount: parseInt($('#totalprice').text()),
        buyer_email: $('#memberemail').text(),
        buyer_name: $('#membername').text(),
        buyer_tel:  $('#membertel').text(),
        buyer_addr: $('#memberaddress').text(),
        buyer_postcode: $('#memberaddress').text()
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
        	$.ajax({
        		url : '/index/shop/memberBuyList',
        		type: "POST",
        		data: {
        	        'productordernumber' : $('.random1').val(),
        			'productsubject' : $('#productSubject').val(),
        	        'productprice': parseInt($('#totalprice').text()),
        	        'productqty' : $('#productqty1').val(),
        	        'productphoto' : $('#mainPhoto').val(),
        	        'productbuydate' : $('#productbuydate').val(),
        	        'memberemail': $('#memberemail').text(),
        	        'membername': $('#membername').text(),
        	        'membertel':  $('#membertel').text(),
        	        'memberaddress': $('#memberaddress').text(),
                 },
                success: function(data){
                 	alert("확인")
                 }, 
                 error:function(e){
                 	console.log(e)
                 }
        	});
          }
        });
}
   
  
</script>


</html>
<%-- 확인 : ${item.memberDTO.memberemail}<br>
	productJoinDTO.seq : ${item.productJoinDTO.seq }<br>
	productJoinDTO.productName : ${item.productJoinDTO.productName }<br>
	productJoinDTO.productSubject : ${item.productJoinDTO.productSubject }<br>
	productJoinDTO.productContent : ${item.productJoinDTO.productContent }<br> 
	${item.totalprice }
	$(item.shopqty) --%>