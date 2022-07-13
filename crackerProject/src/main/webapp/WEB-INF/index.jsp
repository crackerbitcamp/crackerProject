<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.join_wrap_btn{
	width: 100%;
	height: 64px;
	background-color: #f27935;
	font-weight: 700;
	font-size: 18px;
	color: #fff;
	letter-spacing: -.28px;
	border: none;
	margin-top: 50px;
}
.memberWriteModal{
	position:fixed;
	z-index:1000;
	width:100%;
	height: 100%;
	
	margin:auto;
	display: none;
	text-align:center;
	background-color: rgba(0,0,0,0.4);
}
.modal_join_check_all{
	margin-left: 29px;
	margin-top: 50px;
}
.memberModal{
	position: absolute;
	top: 150px;
	left:320px;
	width : 750px;
	height: 700px;
	border: 1px solid red;
	background-color: white;
}

.modalcheckbox{
	display: inline-block;
	font-size: 18px;
	font-family: '나눔고딕',NanumGothic;
	padding-left: 36px;
	float: left;
	vertical-align: top;
	line-height: 24px;
}

.modalcenter{
	width: 500px;
	height: 671px;
	margin: 0 auto;
}

.modalcheck{
	width: 24px;
	height: 24px;
	margin-right: 10px;
}

.modaljoin_team{
	padding: 21px 0 21px 28px;
}

#wrap {
	width: 90%;
	margin: 0 auto; /* 위아래여백,좌우여백  */
}

#boardListTable tr td {
	width: auto;
	padding: 0 auto;
}
/* container */
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

.search {
	text-align: -webkit-center;
}

/* section */
#content {
	padding: 20px; /*섹센을 묶어서 20px만큼 상단으로부터 띄움*/
	position: relative; /* 자기 자신 중심 */
	float: left; 
	width: 95%;
	border: 1px red solid; /*솔리드 라인*/
}
#display{
	padding: 20px; /*섹센을 묶어서 20px만큼 상단으로부터 띄움*/
	position: relative; /* 자기 자신 중심 */
	float: left; /* 정렬 : 오른쪽 */
	width: 65%;
	margin-left: 3%;
	border: 1px blue solid; /*솔리드 라인*/
}

#textSection {
	
}

.card {
	float: left;
	display: flex;
	margin-left: 8px;
	margin-top: 60px;
}

.card2 {
	position: sticky;
	position: -webkit-sticky;
	display: inline-block;
	top: 30px;
	width: 100%;
	height: 50%;
}

#rightbar {
	position: relative;
	float: right;
	width: 10%;
	height: 2000px;
	border: 1px solid red;
}

/* footer */
#footer {
	position: relative;
	bottom: 8px;
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

#keyword {
	width: 70%;
}

.subjectA:link {
	color: black;
	text-decoration: none;
}

.subjectA:visited {
	color: black;
	text-decoration: none;
}

.subjectA:hover {
	color: green;
	text-decoration: underline;
}

.subjectA:active {
	color: #d81e5b;
	text-decoration: none;
}

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.subjectA {
	width: 320px;
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
				<!-- 모달창 -->
				
				<div class= "memberWriteModal">
					<div class = "memberModal">
						<span style="float: right; cursor: pointer; font-size: 30px; margin: 10 20;" id = "modalclose">X</span>
						<div class = "modalcenter">
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
							<button class = "join_wrap_btn">동의하고 가입하기</button>
						</div>
					</div>
				</div>
	<div id="wrap">
		<div id="header">
			<h1 align="center">
				<img src="/index/image/home/LOGO2.jpeg" width="50%" height="50%"
					onclick="location.href='/index'"
					style="cursor: pointer; margin-top: 50px;">
			</h1>
			<br>
			<hr>
		</div>
		<!-- header -->

	

		<div id="container">
			<div id="menu">
				<br>
				<jsp:include page="/WEB-INF/main/nav.jsp"></jsp:include>
				<p class="search">
					<input type="search" name="keyword" id="keyword" value=""
						style="width: 200px; border: 1px solid black; margin-left: 15px;">
					<img src="/index/image/home/search.svg">
				</p>
				<h2>BOARD</h2>
				<jsp:include page="/WEB-INF/main/menu.jsp"></jsp:include>
			</div>

			<input type="button" value="문의하기"
				onclick="location.href='/index/customer/customerWriteForm'">
			<div id="display">
			<c:if test="${empty display}">

				<div id="content">
					<a href="/index/board/boardWriteForm">글쓰기</a>
					
					<div id="textSection">

						<div id="indexSection1" class="section">

							<jsp:include page="${indexSection1 }" />
						</div>
						

					</div>
					
					
					<div style="border: blue 1px solid;" class="imagecard">
						<div id="indexSection5">
							<jsp:include page="${indexSection5 }" />
						</div>
					</div>
					<!-- <div class="imagecard">
				<div class="card" style="width: 300px;">
  					<img src="./image/home/person.svg" class="card-img-top" style="height: 10rem;">
  					<div class="card-body">
  					<h5 class="card-title">제목</h5>
   			 		<p class="card-text">내용</p>
 			 		</div>
				</div>
			
				<div class="card" style="width: 300px;">
  					<img src="./image/home/person.svg" class="card-img-top" style="height: 10rem;">
  					<div class="card-body">
  					<h5 class="card-title">제목</h5>
   			 		<p class="card-text">내용</p>
 			 		</div>
				</div>
			
				<div class="card" style="width: 300px;">
  					<img src="./image/home/person.svg" class="card-img-top" style="height: 10rem;">
  					<div class="card-body">
  					<h5 class="card-title">제목</h5>
   				 	<p class="card-text">내용</p>
 				 	</div>
				</div>
   				   
  			</div> imagecard	 -->

			</div>
			</c:if>
			<!-- content -->
			<c:if test="${not empty display}">
				<jsp:include page="${display}" />
			</c:if>

			</div>
			<div id="rightbar">
				<div class="card2">
					<div class="card-body">
						<h5 class="card-title">여긴뭐지??</h5>
						<h6 class="card-subtitle mb-2 text-muted">뭐할까요??</h6>
						<p class="card-text">어베레렐러러어러러ㅓ럴ㅇ라아라녀안녕하ㅔ요 우리는 크래커~~~</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
			</div>
			<!-- "rightbar"  -->
		</div>
		<!-- container -->

	</div>
	<!-- wrap -->
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
				Copyright &copy; COMPANY Design<br> Powered by Webazit, e-mail
				: <a href="mailto:cracker@community.com">cracker@community.com</a>
			</p>
		</div>
		<!-- footerArea -->

	</div>
	<!-- footer -->
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	
	$('#memberWrite').click(function(){
		$('.memberWriteModal').fadeIn(300);
		$('.memberWriteModal').css('display','block');
		return false;
	});
	$('#check_all').click(function(){
		if($("#check_all").is(":checked")){ 
			$("input[name=modalchk]").prop("checked", true);
		}
		else $("input[name=modalchk]").prop("checked", false);
	});

	$('.join_wrap_btn').click(function(){
		if($('modalchecked1').val() == 'true' && $('#modalchecked2').val() == 'true' || $('#modalchecked3').val() == 'true'){
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