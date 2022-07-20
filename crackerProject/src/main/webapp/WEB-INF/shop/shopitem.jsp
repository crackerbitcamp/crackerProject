<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://kit.fontawesome.com/d84eab0825.js" crossorigin="anonymous"></script>
<style>
.content{
	width: 100%;
	min-width: 1280px;
	margin: 0 auto;
	position: fixed;
}

.shopcontent dl>dt{
	float : left;
	width : 116px;
	min-height : 18px;
	font-size : 16px;
	line-height : 18px;
	color: #333;
}
.shopcontent dl{
 clear: both;
 display: flex;
}
.shopcontent dl>dd{
	float: left;
	width : 384px;
	min-height : 18px;
	line-height : 18px;
	font-size : 13px;
}
.shopcontent dl>dd b{
	margin 0 3px 0 0;
	font-size : 30px;
	font-family : "Tahoma";
	vertical-align : top;
}
.shopcontent dl>dd .input{
	width: 40px;
	height: 36px;
	font-size : 18px;
	font-family : "Tahoma";
	text-align : center;
	border: 2px solid;
	padding : 0;
	
}

button{
padding: 0px;
margin : 0px;
background: none;
}

.shopcontent dl>dd .minus{
	left : 0;
	right: 0;
	width: 40px;
	height: 40px;
	border-right : 1px solid #dbdbdb;
	cursor: pointer;
}

.shopcontent dl>dd .plus{
	left : 0;
	right: 0;
	width: 40px;
	height: 40px;
	border-left : 1px solid #dbdbdb;
	cursor: pointer;
}

.shopcontent dl>dt dd.drv{
	color:#767676;
}

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content">
		<div class = "image" style="max-width:510px; max-height: 510px;display: inline-block; float: left;">
		<img src = "/index/image/home/china.jpeg" style="max-width: 510px; min-height: 510px;">
		</div>
		<div class = "shopcontent" style="width: 510px; height: 510px; display: inline-block; padding-left: 20px;">
			<div class="shopsubject">
				<dl>
					<dt style="margin: 0 auto; width: 100%; font-size: 28px; line-height: 37px; font-weight: bold; border-bottom: 1px solid #99848452;">제목란</dt>
				</dl>
			</div>
				<div class = "shopcontent">
				<dl>
					<dt>판매가</dt>
					<dd><b>21920원</b></dd>
				</dl>
				<dl>
					<dt>100g당 단가</dt>
					<dd>987원</dd>
				</dl>
				<dl>
					<dt>중량</dt>
					<dd>2,200g(1,790kcal)</dd>
				</dl>
				<dl>
					<dt>유통기한</dt>
					<dd>제조일로부터 냉장 4일</dd>
				</dl>
				<dl>
					<dt>배송안내</dt>
					<dd class="drv">
						<span style="display: block;"><em><b style="font-size: 13px;">새벽배송</b></em> 서울/인천/경기권 (일부지역 제외)<br>07월 22일(금)부터 도착 가능</span>
						<span style="display: block;"><em><b style="color:#fe7600; font-size: 13px;">일반택배</b></em> 전국 (제주/도서산간 제외)<br>07월 22일(금)부터 도착 가능</span>
					</dd>
				</dl>
				<dl>
					<dt>수량</dt>
					<dd>
						<div style="height: 50px; display: inline-flex;">
							<button type="button" class="minus"><img src="/index/image/minus.png" style="width: 50%; height: 50%;"></button>
							<input type="text" class="input" value="1" maxlength=2>
							<button type="button" class="plus"><img src="/index/image/plus.png" style="width: 50%; height: 50%;"></button>
						</div>
					</dd>
				</dl>
				<dl>
					<dt style = "float: right; font-size: 16px;">총 제품 금액 : </dt>
					<dd><b style="font-size: 16px; font-family : Tahoma;">12000원</b></dd>
				</dl>
		</div>
		
		</div>
		<div style="display: flex;">
			<ul style="width: 510px; list-style: none; display: inline-block; padding-left:0;">
				<li><img src = "/index/image/home/china.jpeg" style="width: 65px; height: 65px;"></li>
			</ul>
			<div class = "contentBtn" style=" display: inline-block; margin-top: 20px;">
				<button type = "button" style="width: 247px; height: 56px; margin-right: 10px; border: 1px solid #666; font-size: 16px; line-height: 54px; color: #333; font-weight: bold; cursor: pointer;">장바구니</button>
				<button type = "button" style="width: 247px; height: 56px; background: #fe7600; border: 1px solid #fe7600;  font-size: 16px; line-height: 54px; color: #fff; font-weight: bold; cursor: pointer;">바로구매</button>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var input ;
	$('.minus').click(function(){
	    input = $('.input').val();
		if(input > 0){
		$('.input').prop('value',(input-1));
		}
	});
	$('.input').on('change',function(){
		input = $('.input').val();
	});
	
	$('.plus').click(function(){
	    input = $('.input').val();
		$('.input').prop('value',(parseInt(input)+1));
	});
</script>

</html>