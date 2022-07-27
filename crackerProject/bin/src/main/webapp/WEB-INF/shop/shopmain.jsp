<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href="/index/css/indexCSS/indexmodal.css">
<link href="/index/css/shopCSS/shopMain.css" rel="stylesheet"
	type="text/css" />
<style>

*{
	margin: 0;
	padding: 0;
}

div{
	margin: 0;
	padding: 0;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 12px;
	font-weight: normal;
	letter-spacing: 0.4px;
	color: #333;
	display: block;
}


.header-wrap .header-top .inner-box{
	height: 145px;
	text-align: center;
}

.inner-box{
	position: relative;
	width: 1280px;
	margin: 0 auto;
}

.header-wrap .header-top .logo{
	position: absolute;
	top: 50%;
	left: 50%;
	transform : franslate(-50%, -50%);
	top: 66px;
}

h1{
	font-weight: 500;
	font-size: 100%;
	color: #333;
}

.header-wrap .header-top .search-wrap{
	position: absolute;
	top: 71px;
	left: 0px;
	width: 220px;
}

#hd_sch{
	box-sizing: border-box;
}

.search-form input[type="text"]{
	padding: 10px 45px 10px 15px;
	border: 0;
	border-radius: 20px;
	background: #f7f7f7;
	font-size: 14px;
	height: 40px;
	width: 205px;
	max-width: 205px;
}
input[type="text"],input[type="password"],
input[type="search"],input[type="number"]{
	display: inline-block;
	height: 24px;
	padding: 2px -10px -4px -10px;
	resize: none;
	border: 1px solid #dbdbdb;
	line-height: 24px;
	color: #555;
}
input{
	vertical-align: middle;
}

.search-form{
	position: relative;
}

.search-form .btn-search{
	display: block;
	position: absolute;
	top: 0;
	right: 0;
	width: 52px;
	height: 43px;
	font-size: 0;
}

button{
	border: 0;
	border-radius: 0;
	box-shadow: none;
	background: none;
	cursor: pointer;
	font-size: 15px;
	overflow: visible;
	margin: 0;
	padding: 0;
	display: block;
}

.search-form .btn-search::after{
	content: '';
	position: absolute;
	top: 50%;
	transform : translateY(-50%);
	right: 16px;
	width: 20px;
	height: 20px;
	display: inline-block;
	vertical-align: middle;
	font-size: 0;
	background-size: 100% 100%;
	background-image: url("/index/image/searchbtn.png");
}

body html{
	position: relative;
	min-height: 100vh;
	font-family: "Noto","SFPro",sans-serif;
	font-weight: 400;
	font-size: 15px;
	color: #333;
	letter-spacing: -0.3px;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	border: 0;
}

.header-wrap .header-top .util-wrap{
	position: absolute;
	top: 10;
	right: 0;
}

.header-wrap .header-top .util-wrap > ul > li a{
	display : inline-block;
	position : relative;
	font-size : 13px;
	padding-right : 17px;
	
}

.header-wrap{
	left: 0;
	right: 0;
	z-index: 100;
	background: #fff;
	transition: .3s;
}


.header-wrap .header-top{
	position: relative;
	z-index: 10;
	background: #fff;
}

header{
	display: block;
}

.header-wrap .header-top .util-wrap > ul{
	font-size: 0;
}
.header-wrap .header-top .util-wrap > ul > li{
	display: inline-block;
}

.header-wrap .gnb-area{
	position : relative;
	z-index : 9;
}

.gnb-wrap{
	position: relative;
	z-index : 2;
	background : #fff;
	padding : 19px 0;
	box-shadow : 0 1px 5px rgb(0 0 0 / 5%);
}
.gnb-wrap .inner-box ul{
	display : inline-block;
}
.gnb-wrap .inner-box > ul > li.mnu-all{
	padding-right : 40px;
}
.gnb-sub-wrap{
	position : absolute;
	top : 100%;
	left : 0;
	right : 0;
	transform : translateY(-100%);
	opacity : 0;
	z-index : -1;
	transition : .5s;
}

.imgs>img {
    width:100%;
    position: absolute;
    transition: all 1s;
}
}

#imgslide{
	margin-top: 10px;
}

.imgs {
    position: relative;
    overflow: hidden;
    height:400px;
    background-color: #000;
}

.gnb-sub-wrap .mnu-type{
	background : #fff;
	border-radius : 5px;
	border : 1px solid #E5E5E5;
	padding : 0;
	width: 10%;
}


.gnb-sub-wrap .mnu-type li a{
	display : block;
	padding : 0 16px;
	height : 48px;
	font-size : 14px;
	line-height : 48px;
	transition : .3s;
}
.gnb-wrap .inner-box > ul > li{
	display : inline-block;
	position : relative;
	padding-right : 26px;
}
.gnb-wrap .inner-box > ul > li.mnu-all:before{
	display : block;
	content : '';
	position : absolute;
	top : 50%;
	transform : translateY(-50%);
	right : 20px;
	width : 1px;
	height : 14px;
	background : #ccc;
}

.gnb-wrap .inner-box > ul > li > a{
	display : block;
	position: relative;
	z-index : 2;
	line-height : 24px;
	background : #fff;
	text-align : center;
	font-size : 16px;
	letter-spacing: 0;
	
}
.gnb-wrap .inner-box ul:nth-child(2){
	text-align : right;
	width: 27%;
	float: right;
}
.gnb-wrap .inner-box > ul > li.mnu-all .icon{
	display:inline-block;
	margin-right : 5px;
	vertical-align : -6px;
}
.main .article.visual-article{
	height : 400px;
}

ol, ul, li{
	list-style : none;
}

a{
	color : #333;
	text-decoration : none;
	font-family : inherit;
}
.on{
	display: none;
}

.sort-type sort{
	
}
.productShopList1{
	margin: 40px;
}


</style>
</head>
<body>
<div id = "allstate">
	<!-- 모달창 -->
				
				<div class= "memberWriteModal">
					<div class = "memberModal">
						<span style="float: right; cursor: pointer;" id = "modalclose"><img src="/index/image/x.png" style="width: 20px; height: 20px; margin-right: 5px; margin-top: 5px;"></span>
						<div class = "modalcenter">
						<input type = "hidden" id = "modalcheck_all" value="false">
						<input type = "hidden" id = "modalchecked1" value="false">
						<input type = "hidden" id = "modalchecked2" value="false">
						<input type = "hidden" id = "modalchecked3" value="false">
					
							<h2>이용약관 동의</h2>	
							<div class = "modal_join_check_all">
								<label class = "modalcheckbox"><input type = "checkbox" id="check_all" class="modalcheck">모두 확인, 동의합니다.</label><br>
							</div>
							<div class = "modaljoin_team">
								<label class = "modalcheckbox"><input type = "checkbox" id="modalcheck1" name="modalchk" class="modalcheck" value = "1">만 14세 이상입니다.<font size="2" color="orange">(필수)</font></label>
							</div>
							<div class = "modaljoin_team">
								<label class = "modalcheckbox"><input type = "checkbox" id="modalcheck2" name="modalchk" class="modalcheck" value = "1">이용약관 동의<font size="2" color="orange">(필수)</font></label>
							</div>
							<div class = "modaljoin_team">
								<label class = "modalcheckbox"><input type = "checkbox" id="modalcheck3" name="modalchk" class="modalcheck" value = "1">개인정보 수집 및 이용동의<font size="2" color="orange">(필수)</font></label>
							</div>
							<div class = "modaljoin_team">
								<label class = "modalcheckbox"><input type = "checkbox" name="modalchk" class="modalcheck">선택정보 수집 및 이용동의</label>
							</div>
							<button class = "join_wrap_btn" style="cursor: pointer;">동의하고 가입하기</button>
						</div>
					</div>
				</div>
				<!-- 모달창 끝 -->
	<header id="headerWrap" class="header-wrap">
		<div style="height: 100%; width: 100%; margin: 0 auto;">
			<img alt="" src="/index/image/test1.png" style=" background-repeat : no-repeat; background-size:cover;width: 100%;">
		</div>
		<div class="header-top">
			<div class="inner-box">
			
				<h1 class="logo">
					<a href="/index/shop/shopmain"><img src ="/index/image/home/LOGO2.jpeg" style="width: 184px; height: 50px;"></a>
				</h1>
				<div class="search-wrap">
					<div class="search-form">
						<input type = "text" id="hd_sch" class="sch_input" autocomplete="off" data-typing="off">
						<button type="submit" id="btnSearch" class="btn-search">검색</button>
					</div>
				</div>
				<div class="util-wrap">
					<ul>
							<c:if test="${memLogin==null}">
						<li>
								<a href = "/index/member/memberLoginForm">로그인</a>
						</li>
						<li>
							<a id = "memberWriteBtn" style="cursor: pointer;">회원가입</a>
						</li>
							</c:if>
							<c:if test="${memLogin!=null}">
							<li>
								<a>내 정보</a>
							</li>
							<li>
								<a>장바구니</a>
							</li>
							</c:if>
						<li>
							<a>고객센터</a>
						</li>
						<li>
							<a>배송지역 검색</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
<nav class="gnb-area">
		<div class="gnb-wrap">
			<div class="inner-box">
				<ul>
					<li class="mnu-all">
						<a href="javascript:void(0);">
							<span class="icon">
								<img src="//www.thebanchan.co.kr/fo/images/ico/ico_category.png" class="off">
								<img src="//www.thebanchan.co.kr/fo/images/ico/ico_category_on.png" class="on">
							</span>
						카테고리</a>
					</li>
					<li class=""><a href="javascript:void(0);" onclick="overpass.link('SALE')">할인특가</a></li>
					<li class=""><a href="javascript:void(0);" onclick="overpass.link('NEW')">신상품</a></li>
					<li class="gbnLine"><a href="javascript:void(0);" onclick="overpass.link('BEST')">베스트</a></li>
					<li class="gbnLine"><a href="javascript:void(0);" onclick="overpass.link('THISGOURMET')"><i class="ico-up"></i>이달의맛집</a></li>
					<li><a href="javascript:void(0);" onclick="overpass.link('7DAY')">7데이</a></li>
					<li><a href="javascript:void(0);" onclick="overpass.link('REGULARMENU')">정기식단</a></li>
					
				</ul>
				<ul class="gnb-right">
               		<li><a href="javascript:overpass.dispctg.goCtgList({disp_type : 'BRAND'});">프렌즈스토어</a></li>
					<li><a href="/event/initEventAndCoupon.action">이벤트/혜택</a></li>
				</ul>
			</div>
		</div>
		<div class="gnb-sub-wrap">
			<div class="inner-box">
				<ul class= "mnu-type">
					<li><a href="/index/product/productBoardList?category=밀키트">밀키트</a></li>
					<li><a href="/index/product/productBoardList?category=냉동식품">냉동식품</a></li>
					<li><a href="/index/product/productBoardList?category=생선">생선</a></li>
					<li><a href="/index/product/productBoardList?category=고기">고기</a></li>

				</ul>
			</div>
		</div>
	</nav>
	</header>
	
	<c:if test="${empty display}">
	<div id = "container" style="outline: none;">
		<section id="content" class="main">
			<article class="article visual-article">
				<div class="imgs">
  					<img src="/index/image/home/china.jpeg" alt="no">
  					<img src="/index/image/home/japan.jpeg" alt="no">
  					<img src="/index/image/home/korea.jpeg" alt="no">
  					<img src="/index/image/home/ddukbokki.jpeg" alt="no">
				</div>
			</article>
		</section>
		<div style="boarder: red solid 1px; width: 1500px; height: 500px;">
			<div class="productForm">
				<div>
					
				</div>
			
			</div>
		</div>
		
	</div>
</div>
	</c:if>
	
	<c:if test="${not empty display}">
				<jsp:include page="${display}" />
	</c:if>
	
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/shop/shopMain.js"></script>

<script type="text/javascript">
var imgs = 3;
var now = 0;

function slide() {
    now = now == imgs ? 0 : now += 1; 

    $(".imgs>img").eq(now - 1).css({"margin-left": "-100%"});
    $(".imgs>img").eq(now).css({"margin-left": "0px"});
}

function start() {
    $(".imgs>img").eq(0).siblings().css({"margin-left": "-100%"});
    
    setInterval(function () { slide()}, 2000);
}
start();

</script>

<script type="text/javascript">
$('#btnSearch').click(function(){
	$.ajax({
		type : 'post',
		data : {'keyword' : $('#hd_sch').val()},
		url : '/index/product/productSearch',
		success:function(data){
			alert('성공');
		},error:function(e){
			console.log(e);
		}
	});
});
</script>

<script type="text/javascript">
	$('.mnu-all').hover(function(){
		$('.off').css('display','none');
		$('.on').css('display','inline-block');
		$('.mnu-all a').css('color','red');
		$('.gnb-sub-wrap').css('transform','translateY(-0%)');
		$('.gnb-sub-wrap').css('opacity','1');
		
	});
	
	$('.gnb-sub-wrap').hover(function(){
		$('.off').css('display','none');
		$('.on').css('display','inline-block');
		$('.mnu-all a').css('color','red');
		$('.gnb-sub-wrap').css('transform','translateY(-0%)');
		$('.gnb-sub-wrap').css('opacity','1');
	});
	$('.gnb-sub-wrap').mouseleave(function(){
		$('.on').css('display','none');
		$('.off').css('display','inline-block');
		$('.mnu-all a').css('color','black');
		$('.gnb-sub-wrap').css('transform','translateY(-100%)');
		$('.gnb-sub-wrap').css('opacity','0');
	});
	$('.mnu-all').mouseleave(function(){
		$('.on').css('display','none');
		$('.off').css('display','inline-block');
		$('.mnu-all a').css('color','black');
		$('.gnb-sub-wrap').css('transform','translateY(-100%)');
		$('.gnb-sub-wrap').css('opacity','0');
	});
</script>

<script type="text/javascript">


$('#memberWriteBtn').click(function(){
	$('.memberWriteModal').fadeIn(300);
	$('.memberWriteModal').css('display','block');
	return false;
});



$('#check_all').click(function(){
	if($("#check_all").is(":checked")){ 
		$("input[name=modalchk]").prop("checked", true);
		$('#modalcheck_all').attr('value','true');
	}
	else{
		$("input[name=modalchk]").prop("checked", false);
		$('#modalcheck_all').attr('value','false');
	}
});

$('.join_wrap_btn').click(function(){
		if($('#modalcheck1').is(':checked') && $('#modalcheck2').is(':checked') && $('#modalcheck3').is(':checked')){
			location.href = '/index/member/memberWriteForm'
		}
});

$('#modalclose').click(function(){
	$('.memberWriteModal').fadeOut(300);
});

$('#modalcheck1').change(function(){
	if($('#modalcheck1').is(":checked")){
		$('#modalchecked1').prop('value','true');
	}else{
		$('#modalchecked1').prop('value','false');
	}
});

$('#modalcheck2').change(function(){
	if($('#modalcheck2').is(":checked")){
		$('#modalchecked2').prop('value','true');
	}else{
		$('#modalchecked2').prop('value','false');
	}
});

$('#modalcheck3').change(function(){
	if($('#modalcheck3').is(":checked")){
		$('#modalchecked3').prop('value','true');
	}else{
		$('#modalchecked3').prop('value','false');
	}
});
</script>
</html>