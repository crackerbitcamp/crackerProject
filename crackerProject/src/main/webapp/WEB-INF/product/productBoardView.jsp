<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.content{
	width: 100%;
	min-width: 1280px;
	margin: 0 auto;
}

.shopcontent dl>dt{
	float : left;
	width : 116px;
	min-height : 18px;
	font-size : 16px;
	line-height : 18px;
	color: #333;
	margin : 16px;
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
	margin: 16px;
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
	border: 1px solid;
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
	height: 38px;
	border : 1px solid;
	cursor: pointer;
}

.shopcontent dl>dd .plus{
	left : 0;
	right: 0;
	width: 40px;
	height: 38px;
	border : 1px solid;
	cursor: pointer;
}

.shopcontent dl>dt dd.drv{
	color:#767676;
}
.menubar ul li{
	list-style: none;
	float: left;
	width: 200px;
	cursor: pointer;
}

.menubar ul li .title{
	padding: 0;
    margin: 0;
}

.menubar ul li .title a{
   display: block;
   padding-top: 12px;
   font-size: 14px;
   text-indent: 12px;
   text-decoration: none;
   font-weight: bold;
   color: white;
   height: 23px;
   background: url('../image/background.jpg');
}

.selected {
   background: url('../image/background-selected.jpg') !important;
}

.menubar ul{
	padding: 0;
   margin: 50px auto;
   list-style: none;
   width: 800px;
	
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id = "productBoardViewForm">
	<div class="content">
		<input type = "hidden" name = "memberemail" id = "memberemail" value="${memEmail}">
		<input type="hidden" name = "seq" id="seq" value="${seq}">
		<div class = "image" style="max-width:510px; max-height: 510px;display: inline-block; float: left;">
		<img id="productMainPhoto" style="max-width: 510px; min-height: 510px;">
		</div>
		<div class = "shopcontent" style="width: 510px; height: 510px; display: inline-block; padding-left: 20px;">
			<div class="shopsubject">
				<dl>
					<dt id="productSubject_dt"style="margin: 0 auto; width: 100%; font-size: 28px; line-height: 37px; font-weight: bold; border-bottom: 1px solid #99848452;"></dt>
				</dl>
			</div>
				<div class = "shopcontent">
				<dl>
					<dt>판매가</dt>
					<dd><b id="productPrice_b"></b></dd>
				</dl>
				<dl>
					<dt>100g당 단가</dt>
					<dd>987원</dd>
				</dl>
				<dl>
					<dt >중량</dt>
					<dd id="productWeight_dd"></dd>
				</dl>
				<dl>
					<dt>유통기한</dt>
					<dd id="productLife_dd">제조일로부터 냉장 4일</dd>
				</dl>
				<dl>
					<dt>배송안내</dt>
					<dd class="drv">
						<span style="display: block;"><em><b style="font-size: 13px;">새벽배송</b></em> 서울/인천/경기권 (일부지역 제외)<br><span id ="date"></span>부터 도착 가능</span>
						<span style="display: block;"><em><b style="color:#fe7600; font-size: 13px;">일반택배</b></em> 전국 (제주/도서산간 제외)<br><span id ="date1"></span>부터 도착 가능</span>
					</dd>
				</dl>
				<dl>
					<dt>수량</dt>
					<dd>
						<div style="height: 50px; display: inline-flex;">
							<button type="button" class="minus"><img src="/index/image/minus.png" style="width: 50%; height: 50%;"></button>
							<input type="text" name = "shopqty" id ="shopqty" class="input" value="1" maxlength=2>
							<button type="button" class="plus"><img src="/index/image/plus.png" style="width: 50%; height: 50%;"></button>
						</div>
					</dd>
				</dl>
				<dl>
					<dt style = "float: right; font-size: 16px;">총 제품 금액  </dt>
					<dd><b  id="productPrice_total"style="font-size: 16px; font-family : Tahoma;"></b></dd>
				</dl>
					<input type = "hidden" name = "totalprice" id="totalprice" />
					<input type = "hidden" name = "day" id="day">
		</div>
		
		</div>
		<div style="display: flex;">
			<ul style="width: 510px; list-style: none; display: inline-block; padding-left:0;">
				<li><img src = "/index/image/home/china.jpeg" style="width: 65px; height: 65px;"></li>
			</ul>
			<div class = "contentBtn" style=" display: inline-block; margin-top: 20px;">
				<button type = "button" id = "cartBtn"style="width: 247px; height: 56px; margin-right: 10px; border: 1px solid #666; font-size: 16px; line-height: 54px; color: #333; font-weight: bold; cursor: pointer; display: initial; float: left;">장바구니</button>
				<button type = "button"  id = "productBtn" style="width: 247px; height: 56px; background: #fe7600; border: 1px solid #fe7600;  font-size: 16px; line-height: 54px; color: #fff; font-weight: bold; cursor: pointer;">바로구매</button>
			</div>
		</div>
	</div>
</form>

	<div class="menubar">
		<ul class="menubarUl">
			<li class="collapsible">
				<h2 class="title">
					<a>제품정보</a>
				</h2>
				<p class="item">내용들내용들내용들내용들내용들내용들내용들내용들</p>
			</li>
			<li class="collapsible">
				<h2 class="title">
					<a>
						제품정보고시
					</a>
				</h2>
				<p class="item">내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들</p>
			</li>
			<li  class="collapsible">
				<h2 class="title">
					<a>고객후기</a>
				</h2>
				<p class="item">내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들</p>
			</li>
			<li  class="collapsible">
				<h2 class="title">
					<a>주의사항</a>
				</h2>
				<p class="item">내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들</p>
			</li>
		</ul>
	</div>
	<div>
		<div id="productContent_div"></div>
	</div>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/product/productBoardView.js"></script>
<script type="text/javascript" src="/index/js/shop/shopView.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

$(function(){
		$('.collapsible').not(':eq(0)').find('.item').hide();
		$('.collapsible:eq(0) a').addClass('selected');
		
	$('.collapsible').click(function(){
		$('.collapsible a').removeClass('selected');
		$(this).find('a').addClass('selected');
		$('.collapsible').not(this).find('.item').hide();
		$(this).find('p').show();
		return false;
	});
});
</script>
 
 <script type="text/javascript">
 var date = new Date()
 var month = (date.getMonth()+1)+"월" //월
 var day = (date.getDate()+3)+"일"	//일
 getTodayLabel() 

 document.getElementById("date").innerText = month+day+'('+getTodayLabel()+')';
 document.getElementById("date1").innerText = month+day+'('+getTodayLabel()+')';
 document.getElementById('day').value =  month+day+'('+getTodayLabel()+')';
 function getTodayLabel() {        
	 var week = new Array('일', '월', '화', '수', '목', '금', '토');        
	 var today = new Date().getDay()+3;   
	  var todayLabel = week[today];        
	 return todayLabel;
	 }
 </script>
 
<script type="text/javascript">

</script>

</html>