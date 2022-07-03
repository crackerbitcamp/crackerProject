<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

li{
	width: 400px;
	list-style: none;
}
#wrap {
	width: 1600px;
	margin: 0 auto;	/* 위아래여백,좌우여백  */
}

#container:after { /* after는 컨테이너 뒤에 붙는거 해제하라는 뜻 */
	content: '';
	display: block;
	clear: both; /* flex 써도 됨 */
}

#menu {
	border: 1px red; solid;
	float: left; /* 정렬 : 왼쪽 */
	width: 19%;
}

#menu h2 {
	padding: 10px 14px 8px 0;
	margin-left: 11px;
	margin-bottom: 20px;
	border-bottom: 1px solid #cccccc;
	color: #000000;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 30px;
	font-weight: bold;
	text-align: center; /* 오른쪽으로 정렬 */
}

#section {
	padding: 20px; /*섹센을 묶어서 20px만큼 상단으로부터 띄움*/
	position: relative; /* 자기 자신 중심 */
	float: left; /* 정렬 : 오른쪽 */
	width: 65%;
	margin-left:1%;
	margin-right:1%;
	border: 1px red solid;
}
#section h4{
	font-size: 18px;
    font-weight: bold;
}
#section ul{
	margin-top: 8px;
}
#section li{	
	width: 100%;
	line-height: 1.8;
	
}

#rightbar{
	position: relative;
	float: right;
	width: 14%;
}

#section h2 {
	padding: 24px 24px;
	color: #000000;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 50px;
	font-weight: bold;
}

#footer {
	position: relative;
	bottom : 8px;
	background-color: #fff;
}

#footer .footerArea {
	border-top: 1px solid #cccccc;
	padding: 0; /* 좌측과 우축의 여백을 제거 */
	color: #666;
	font-size: 0.9em;
	width: 90%;
	height: 50px;
	margin: 0 auto;
}

#footer .footerArea:after {
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

.copy {
	float: left;
	line-height: 1.8;
	margin-left: 20px;
	margin-top: 18px;
}

.blind {
	display: block;
	overflow: hidden;
	position: absolute;
	left: 0;
	top: -1000em;
}

#content .box {
	width: 80%;
	color: red;
}
#keyword{
width: 70%;
}

.search {
	
	text-align: -webkit-center;
}


#content{
 	
	padding: 0 20px;
}

#section1 {
  	width: 44%;
    float: left;
    margin: 0 40px 0 0;
}
#section2{
 	width: 44%;
    float: left;
    margin: 0 40px 0 0;
}
#hottext ul li{
		text-align: left;
        display: -webkit-box;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    -webkit-line-clamp: 1;
	    -webkit-box-orient: vertical;
	    word-break: break-all;
}
#index_cate_user_text1{
	width: 100%;
	height: auto;
}

#index_cate_subject{
overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
	width: 80%;
    float: left;
}
#index_cate_em{
 	float: left;
}
</style>
</head>
<body>
<div id="wrap">

	<div id="header">
		<h1 align="center"><img src="./image/home/LOGO2.jpeg" width="50%" height="50%"
				 onclick= "" style="cursor: pointer; margin-top : 50px;"></h1>
	<br>
	<hr>
	</div> <!-- header -->

	<div id="container">
		<div id ="menu">
			<br>
			<jsp:include page="/WEB-INF/main/nav.jsp"></jsp:include>
			<p class="search">
				<input type="search" name="keyword" id="keyword" value="" style="width:200px; border:1px solid black; margin-left : 15px;" >
				<img src="./image/home/search.svg" >
			</p>
			<h2>BOARD</h2>
			<jsp:include page="/WEB-INF/main/menu.jsp"></jsp:include>
		</div>
	<div id="section">	
		<div id="content">
			<div id="section1">
				<a href="#"><h4>실시간인기 글</h4></a>
				<ul id="hottext" style="padding: 0;">
					<li>
						<div id="index_cate_user_text1">
							<div id="index_cate_subject"><a href="#">제목이 보여집니다.최대 길이 확인하기 목이 보여집니다.최대 길이 확인하기</a></div>
							<div id="index_cate_em"><a href="#">[덧글 수]</a></div>
						</div>
					</li>
					
				
				</ul>
			</div>
			<div id="section2">	
				<a href="#"><h4>실시간인기 글</h4></a>
				<ul id="hottext" style="padding: 0;">
					<li><a href="#">카테고리 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					<li><a href="#">board의 제목이 보여집니다.</a></li>
					
				</ul>
			</div>
	  	</div> 
	</div><!-- "section" -->
		
		<div id="rightbar">
		</div><!-- "rightbar"  -->
	</div> <!-- container -->
	

	

</div> <!-- wrap -->
	<div id="footer">
		<div class="footerArea">
			<dl class="btmnav">
				<dt class="blind">bottom navigation</dt>
				<dd><a href="#">About</a></dd>
				<dd><a href="#">개인정보보호</a></dd>
				<dd><a href="#">광고문의</a></dd>
				<dd><a href="#">Contact us</a></dd>
				<dd><a href="#">Location</a></dd>		
			</dl>
		
			<p class="copy">
				Copyright &copy; COMPANY Design<br>
				Powered by Webazit, e-mail : <a href="mailto:cracker@community.com">cracker@community.com</a>
			</p>
		</div><!-- footerArea -->
		
	</div> <!-- footer -->
</body>
</html>