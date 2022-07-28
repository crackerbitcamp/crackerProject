<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.left_member, .left_memberaddress{

	background: #fff;
    padding: 30px;
    box-sizing: border-box;
    border-radius: 8px;
    border: 1px solid #e0e0e0;
}
.left_member_main, .left_memberaddress_main{
    font-size: 18px;
    line-height: 18px;
    color: #222;
    letter-spacing: -0.18px;
}
.left_member_name, .left_memberaddress_name{
	position: relative;
    display: inline-block;
}
.left_member input{
    outline: 0;
    border: 1px solid #222;
    width: 400px;
    height: 48px;
    padding: 0 16px;
    font-size: 16px;
    line-height: 44px;
    caret-color: #11d70d;
    box-sizing: border-box;
    border-radius: 8px;
}
.left_memberaddress input:not(:first-child){
    outline: 0;
    border: 1px solid #222;
    width: 400px;
    height: 48px;
    padding: 0 16px;
    font-size: 16px;
    line-height: 44px;
    caret-color: #11d70d;
    box-sizing: border-box;
    border-radius: 8px;
}
.left_member div{
	padding: 12px;
}
.left_memberaddress div{
	padding: 12px;
}
.left_member label{
	padding-bottom: 5px;
	margin-right: 30px;
}
.left_memberaddress label{
	padding-bottom: 5px;
	margin-right: 30px;
}
.delivery_request_text{
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    padding-left: 16px;
    color: #aaa;
    height: 100%;
    font-size: 15px;
    line-height: 48px;
}
.memberaddress_delivery_request{
	position: relative;
	display: inline-block;
    margin-top: 15px;
    width: 400px;
    height: 56px;
    background: #fff;
    box-sizing: border-box;
    z-index: 0;
    border: 1px solid #000;
    border-radius: 8px;
}
.delivery_request {
    width: 100%;
    height: 100%;
    padding-left: 16px;
    background: #fff;
    font-size: 16px;
    line-height: 56px;
    opacity: 0;
    font-family: inherit;
}
</style>
</head>
<body>
<input type="hidden" id="memEmail" name="memEmail" value="${memEmail }"/>
<div class="productcontent_wrap">
	<div class="productcontent_box">
	<form id="memberaddressForm">
		<div class="contentbox_left">
			<div class="left_member">
				<div class="left_member_main">주문자 정보</div>
				<div class="left_member_name">
					<label class="member_name">주문자</label>
					<input type="text" id="name" name="name" placeholder="이름을 입력해 주세요." value="">
				</div>
				<div class="left_member_phone">
					<label class="member_phone">연락처</label>
					<input type="tel" id="phone" name="phone" placeholder="“-“없이 입력해 주세요." value="">
				</div>
				<div class="left_member_email">
					<label class="member_email">이메일</label>
					<input type="email" id="email" name="email" placeholder="crackerProject@naver.com" value="">
				</div>
			</div>
			<br>
			<div class="left_memberaddress">
				<div class="left_memberaddress_main">배송지 정보</div>
				<div class="box_equal_member">
					<input type="checkbox" id="equal_member" name="equal_member" class="input_checkbox" />
					<label for="equal_member" id="member_chk">주문자 정보와 동일</label>
				</div>
				<div class="left_memberaddress_name">
					<label class="memberaddress_name">주문자</label>
					<input type="text" id="address_name" name="name" placeholder="이름을 입력해 주세요." value="">
				</div>
				<div class="left_memberaddress_phone">
					<label class="memberaddress_phone">연락처</label>
					<input type="tel" id="address_phone" name="phone" placeholder="“-“없이 입력해 주세요." value="">
				</div>
				<div class="left_memberaddress_zipcode">
					<div style="width: 77px; display: inline-block; padding: 0;">
						<label class="memberaddress_zipcode">주소</label>
					</div>
						<input type="text" id="zipcode" name="zipcode" value="" readonly style= "width: 198px; margin-bottom: 10px;">
						<input type="button" value="주소검색" onclick="checkPost()" style= "width: 198px;">
						<br>
						<div style="width: 77px; padding: 0; display: inline-block; "></div>
						<input style="margin-bottom: 10px;"" type="text" name="addr1" id="addr1" placeholder="주소" size="50" readonly>
						<br>
						<div style="width: 77px; padding: 0; display: inline-block;"></div>
						<input type="text" name="addr2" id="addr2" placeholder="상세주소" size="50">
				</div>
				<!-- <div class="left_memberaddress_request">
					<label class="memberaddress_request" style="margin-right: 13px;">요청사항</label>
					<div class="memberaddress_delivery_request">
						<label for="delivery_request2" class="delivery_request_text">배송시 요청사항을 선택해 주세요.</label>
						<select id="delivery_request" class="delivery_request">
							<option value="0">배송시 요청사항을 선택해 주세요.</option>
							<option value="1">직접 수령하겠습니다.</option>
							<option value="2">배송 전 연락바랍니다.</option>
							<option value="3">부재 시 경비실에 맡겨주세요.</option>
							<option value="4">부재 시 문 앞에 놓아주세요.</option>
							<option value="5">부재 시 택배함에 넣어주세요.</option>
							<option value="6">직접 입력</option>
						</select>
					</div>
				</div> -->
				<div class="left_memberaddress_updateBtn">
					<button id="memberaddress_updateBtn" class="memberaddress_updateBtn">주소지 등록</button>
				</div>
			</div>
		</div>
		</form>
		<div class="contentbox_right">
		
		</div>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/productbuy.js">

</script>
</body>
</html>