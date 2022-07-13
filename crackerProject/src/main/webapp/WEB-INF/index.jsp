<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- header -->
<link href="/index/css/indexCSS/header.css" rel="stylesheet" type="text/css" />
<link href="/index/css/indexCSS/userHistory.css" rel="stylesheet" type="text/css" />
<link href="/index/css/indexCSS/indexmodal.css" rel="stylesheet" type="text/css" />
<style type="text/css">

#wrap {
	width: 100%;
	margin: 0 auto; /* 위아래여백,좌우여백  */
}

/* container */

#container{
	margin: 2% 5% 5% 5%;
}

#container:after { /* after는 컨테이너 뒤에 붙는거 해제하라는 뜻 */
	content: '';
	display: block;
	clear: both; /* flex 써도 됨 */
}


.display_title_text, .display_title_text2 {
	float : left;
	display : block;
	padding-right : 15px;
	padding-left : 15px;
	color : #f76900;
	line-height: : 1.35em;
	text-align: left;
}

.display_title_list, .display_title_list2 {
	float : right;
	color : #f76900;
	line-height: 3em;
	text-decoration:none;
}


#imagecard {
	text-align : center;
	
}

#imagecard2 {
	float : left;
	display : block;
	width : 33.3333%
}

.imagecard {
	width: 95%;
	margin : 8px;
}

#content {
	padding: 20px; /*섹센을 묶어서 20px만큼 상단으로부터 띄움*/
	position: relative; /* 자기 자신 중심 */
	float: left; 
	width: 95%;
	border: 1px red solid; /*솔리드 라인*/
}

#display ,#display2 {
	padding: 20px; /*섹센을 묶어서 20px만큼 상단으로부터 띄움*/
	position: relative; /* 자기 자신 중심 */
	float: left; /* 정렬 : 오른쪽 */
	width: 97.5%;
	border: 1px blue solid; /*솔리드 라인*/
}

/* #rightbar {
	position: relative;
	float: right;
	width: 10%;
	height: 2000px;
	border: 1px solid red;
}
 */


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
		<header id="header">
			
			<div id="header_menuDiv">
			
				<img alt="" src="/index/image/home/LOGO2.jpeg" width="100px" height="50px" id="headerLogo">
				<div id="header_ul">
					<ul id="header_menu_ul">
						<li class="header_menu_item"><a href="/index/board/boardList"><span>전체 게시판</span></a></li>
						<li class="header_menu_item"><a href="#"><span>자유 게시판 </span></a></li>
						<li class="header_menu_item"><a href="/index/board/recipeBoardList"><span>레시피 게시판</span></a></li>
					</ul>
					
					<ul id="header_login_ul">
						<li class="header_login_item">
							<button type="button" id="memberImgBtn"><img src="/index/image/person.svg" width="50px" height="50px"/></button>
						</li>
					</ul>
				
				</div>
			</div>
				<!-- 헤더 상위 메뉴바 아래 -->
			
			<div id = "searchForm">
				<img alt="돋보기" src="/index/image/home/search.svg">
				<input type="text" id="boardSearch">
				<input type="button" id="boardSearchBtn" value="검색">
			</div>
		</header>
		<!-- header -->
	

		<div id="container">
			
		<!-- 	<input type="button" value="문의하기"
				onclick="location.href='/index/customer/customerWriteForm'"> -->
				
			<section class="section1">
				<div class="display_title">
					<h2 class="display_title_text">레시피 리스트</h2>
					<a class="display_title_list" href="#">리스트 더보기</a>
				</div>
			</section>
			
				<div id="display1">
					<div id="imagecard">
					
						<div id="imagecard2">
						<img class="imagecard" src="/index/image/home/korea.jpeg" onclick="#">
						</div>
						
						<div id="imagecard2">
						<img class="imagecard" src="/index/image/home/steak.jpeg" onclick="#">
						</div>
						
						<div id="imagecard2">
						<img class="imagecard" src="/index/image/home/japan.jpeg" onclick="#">
						</div>
						
						<div id="imagecard2">
						<img class="imagecard" src="/index/image/home/china.jpeg" onclick="#">
						</div>
						
						<div id="imagecard2">
						<img class="imagecard" src="/index/image/home/vietnam.jpeg" onclick="#">
						</div>
						
						<div id="imagecard2">
						<img class="imagecard" src="/index/image/home/ddukbokki.jpeg" onclick="#">
						</div>
					
					</div>	
				</div>
			
			
			<section class="section2">
				<div class="display_title2">
					<h2 class="display_title_text2">자유 게시판</h2>
					<a class="display_title_list2" href="#">게시물 더보기</a>
				</div>
			</section>
			
			<div id="display">
		
			<c:if test="${empty display}">
			
				<div id="content">
					<div id="textSection">
						<div id="indexSection1" class="section">
							<jsp:include page="${indexSection1 }" />
						</div>
					</div> <!-- textSection -->
									
					<div style="border: blue 1px solid;" class="imagecard">
						<div id="indexSection5">
							<jsp:include page="${indexSection5 }" />
						</div>
					</div>

				</div><!-- content -->
				
			</c:if>
			
		</div>
			
			
			<c:if test="${not empty display}">
				<jsp:include page="${display}" />
			</c:if>

			</div>
			
			
			
<!-- 			<div id="rightbar">
				<div class="card2">
					<div class="card-body">
						<h5 class="card-title">여긴뭐지??</h5>
						<h6 class="card-subtitle mb-2 text-muted">뭐할까요??</h6>
						<p class="card-text">어베레렐러러어러러ㅓ럴ㅇ라아라녀안녕하ㅔ요 우리는 크래커~~~</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
			</div> "rightbar"  
			
	 	</div>container -->
	
	
	</div><!-- wrap -->
	

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
		</div><!-- footerArea -->

	</div><!-- footer -->
	
	<!-- 우측상단 로그인 버튼 -->
	<div >
		<div id="userHistory_black">
		</div>
		<c:if test="${memNickname==null}">
			<div class="userHistory">
				<i id="userHistory_triangle"></i>
				<div>
					<button class="userHistoryBtnClass" id="loginBtn">로그인</button>
				
				</div>
				<div>
					<button class="userHistoryBtnClass">아이디 비밀번호 찾기</button>
				
				</div>
				<div>
					<button class="userHistoryBtnClass" id="memberWriteBtn">회원가입</button>
				</div>
			
			</div>
		</c:if>
		<c:if test="${memNickname!=null}">
		
			<div class="userHistory">
				로그인 되었습니다.
			
			</div>
		</c:if>
	</div>
	
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/index/js/index.js">
</script>
</body>
</html>