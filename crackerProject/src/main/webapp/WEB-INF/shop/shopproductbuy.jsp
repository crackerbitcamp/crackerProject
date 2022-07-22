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
	padding: 15px;
}
.left_memberaddress div{
	padding: 15px;
}
.left_member label{
	padding-bottom: 5px;
}
.left_memberaddress label{
	padding-bottom: 5px;
}

</style>
</head>
<body>

<div class="productcontent_wrap">
	<div class="productcontent_box">
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
			
			<div class="left_memberaddress">
				<div class="left_memberaddress_main">배송지 정보</div>
				<div class="box_equal_member">
					<input type="checkbox" id="equal_member" name="equal_member" class="input_checkbox" />
					<label for="equal_member">주문자 정보와 동일</label>
				</div>
				<div class="left_memberaddress_name">
					<label class="memberaddress_name">주문자</label>
					<input type="text" id="name" name="name" placeholder="이름을 입력해 주세요." value="">
				</div>
				<div class="left_memberaddress_phone">
					<label class="memberaddress_phone">연락처</label>
					<input type="tel" id="phone" name="phone" placeholder="“-“없이 입력해 주세요." value="">
				</div>
			</div>
		</div>
		<div class="contentbox_right">
		
		</div>
	</div>
</div>

</body>
</html>