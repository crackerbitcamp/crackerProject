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
<link rel="preconnect" href="https://fonts.googleapis.com"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">


<style type="text/css">
body{
	margin: 0;
}
#display{
	margin-top: 50px;
}

#wrap {
	width: 100%;
	margin: 0 auto; /* 위아래여백,좌우여백  */
	
	
}

/* container */

#container{
	/* margin: 2% 3% 5% 3%; */
}

#container:after { /* after는 컨테이너 뒤에 붙는거 해제하라는 뜻 */
	content: '';
	display: block;
	clear: both; /* flex 써도 됨 */
}


.display_title {
	width : 90%;
	display : inline-block;
	margin-bottom: -25px;
	margin-left : 55px;

}
 .display_title_text{
	padding-right : 15px;
	padding-left : 15px;
	color : #f76900;
	text-align: left; 
}

.display_title_list{
	position : relative;
	float : right;
	color : #CBCBCB;
	text-decoration:none;
	top : -40px;
	
}

#imagecard {
	
	text-align : center;
	height: 450px;
	border-bottom: 1px solid #f76900;
	margin : 10px 65px;
	/* border : 1px solid red; */

}

#imagecard1 {
	position: relative;
	float : left;
	display : block;
	width : 434px;
	height : 200px;
	
	
}

.imagecard2 {
	width: 95%;
}

#imagecard1 a {
	text-decoration: none;
	height: 89.5%;
	width: 95%;
	background-color: rgba(0,0,0,0.2);
	box-sizing: border-box;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 2.6%;
}

#imagecard1 a:hover{

	text-decoration: none;
	height: 89.5%;
	width: 95%;
	background-color: rgba(0,0,0,0.67);
	box-sizing: border-box;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 2.6%;
}

.info_inner {
	position: absolute;
	top : 40%;
	width : 85%;
	
}

.info_inner_title {
	font-size : 3rem;
	color : #fff;
	text-shadow : 5px 2px 5px #000000;
	text-align : center;
	font-weight: bolder;
	font-family: 'Noto Sans KR', sans-serif;
}

#imagecard1 a:hover .info_inner_title {
	font-size : 4rem;
	color : #fff;
	text-shadow : 5px 2px 5px #000000;
	text-align : center;
	font-weight: bolder;
	font-family: 'Noto Sans KR', sans-serif;
}

#imagecard1 a:hover .info_inner {
	position: absolute;
	top : 30%;
	width : 85%;
}



#content {
	/* padding: 20px; */ /*섹센을 묶어서 20px만큼 상단으로부터 띄움*/
	position: relative; /* 자기 자신 중심 */
	height: 335px;
	width : 1300px;
	margin-left : 60px;
	/* float: left;  */
	/* border: 1px red solid; */

}


#display {
	padding: 0; /*섹센을 묶어서 20px만큼 상단으로부터 띄움*/
	position: relative; /* 자기 자신 중심 */
	float: left; /* 정렬 : 오른쪽 */
	width: 100%;
	height: 100%;
	/* border: 1px blue solid; /*솔리드 라인*/
	/* background-color: #f3f3f3; */
}

.imagecard {
	position: relative;
	width : 98%;
	height: 750px;
	margin : 0 auto;
	
	/* border: 1px blue solid; */
}

#indexSection1 {
	border-bottom: 1px solid #f76900;
	display : flex;
	
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
.footer {
 	position : relative;
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


</style>
</head>
<body>
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
				
	<div id="wrap">
		<div id="header_menuDiv">
		
			<img alt="" src="/index/image/home/cracker.jpeg" id="headerLogo" style=" margin-left : 20px; ">
			<div id="header_ul">
				<ul id="header_menu_ul">
					<li class="header_menu_item"><a href="#" class="menu_item_a"><span>SHOP</span></a></li>
					<li class="header_menu_item"><a href="/index/board/boardList" class="menu_item_a"><span>FREE</span></a></li>
					<li class="header_menu_item"><a href="/index/recipeBoard/recipeBoardList" class="menu_item_a"><span>RECIPE</span></a></li>
				</ul>
				
				<ul id="header_login_ul">
					<li class="header_login_item">
						<button type="button" id="memberImgBtn"><img src="/index/image/home/person-circle.svg" 
						style=" width:25px; height:25px; margin-top:15px; " /></button>
					</li>
				</ul>
			
			</div>
		</div> <!-- header_menuDiv -->
		
		<div id="display">
				<c:if test="${empty display}">
			<header id="header">
			
				<!-- 헤더 상위 메뉴바 아래 -->
				<div id="searchFormOutDiv">
					<p class="title">다양한 레시피, 맛 보장 레시피!</p>
					<h1 class="title">CRACKER</h1>
					<div id = "searchForm">
						<img alt="돋보기" src="/index/image/home/search.svg" >
						<input type="text" id="boardSearch" placeholder="음식명">
						<input type="submit" id="boardSearchBtn" value="검색" onclick="#">
					</div>
				</div>
			</header>
	

		<div id="container">
		
		<!-- 	<input type="button" value="문의하기"
				onclick="location.href='/index/customer/customerWriteForm'"> -->
			
				
				<div class="display_title">
							<h2 class="display_title_text">레시피 리스트</h2>
							<a class="display_title_list" href="#">리스트 더보기</a>
				</div>
				
					<div id="imagecard">

						
						<div id="imagecard1">
							<img class="imagecard2" src="/index/image/home/korea.jpeg" onclick="">
							<a href="./recipeBoard/recipeBoardList?category=한식">
								<figure class="imagecard_category">
									<figcaption class="info">
										<div class="info_inner">
											<span class="info_inner_title">한식</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</div>
						
						<div id="imagecard1">
							<img class="imagecard2" src="/index/image/home/steak.jpeg" onclick="">
							<a href="./recipeBoard/recipeBoardList?category=양식">
								<figure class="imagecard_category">
									<figcaption class="info">
										<div class="info_inner">
											<span class="info_inner_title">양식</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</div>
						
						<div id="imagecard1">
							<img class="imagecard2" src="/index/image/home/japan.jpeg" onclick="">
							<a href="./recipeBoard/recipeBoardList?category=일식">
								<figure class="imagecard_category">
									<figcaption class="info">
										<div class="info_inner">
											<span class="info_inner_title">일식</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</div>
						
						<div id="imagecard1">
							<img class="imagecard2" src="/index/image/home/china.jpeg" onclick="">
							<a href="./recipeBoard/recipeBoardList?category=중식">
								<figure class="imagecard_category">
									<figcaption class="info">
										<div class="info_inner">
											<span class="info_inner_title">중식</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</div>
						
						<div id="imagecard1">
							<img class="imagecard2" src="/index/image/home/vietnam.jpeg" onclick="">
							<a href="./recipeBoard/recipeBoardList?category=아시아">
								<figure class="imagecard_category">
									<figcaption class="info">
										<div class="info_inner">
											<span class="info_inner_title">아시아</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</div>
						
						<div id="imagecard1">
							<img class="imagecard2" src="/index/image/home/ddukbokki.jpeg" onclick="">
							<a href="./recipeBoard/recipeBoardList?category=분식">
								<figure class="imagecard_category">
									<figcaption class="info">
										<div class="info_inner">
											<span class="info_inner_title">분식</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</div>

					</div>	
		
			
					<div class="display_title">
							<h2 class="display_title_text">자유 게시판 & 질문 게시판</h2>
							<a class="display_title_list" href="#">게시글 더보기</a>
					</div>
				
			
				<div id="content">				
					<div id="textSection">
						<div id="indexSection1" class="section">
							<jsp:include page="${indexSection1 }" />
						</div>
						
		
					</div> <!-- textSection -->
				
				</div> <!-- content -->
				
					<div class="display_title">
							<h2 class="display_title_text">레시피 전체 게시판</h2>
							<a class="display_title_list" href="#">레시피 더보기</a>
					</div>
				
				<div class="imagecard">
					<div id="indexSection5">
						<jsp:include page="${indexSection5 }" /> 
					</div>
				</div>
				

			</div><!-- container -->
			</c:if>	
		</div> <!-- display -->
			
			
			<c:if test="${not empty display}">
				<jsp:include page="${display}" />
			</c:if>
			
				
		</div> <!-- wrap -->

		
			
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

	 
	
	<!-- 우측상단 로그인 버튼 -->
	<div >
		<div id="userHistory_black">
		
		</div>
		<c:if test="${memLogin==null}">
			<div class="userHistory">
				<i id="userHistory_triangle"></i>
				<div>
					<button class="userHistoryBtnClass" id="loginBtn" style="cursor: pointer;">로그인</button>
				
				</div>
				<div>
					<button class="userHistoryBtnClass" style="cursor: pointer;" id="idinfo" onclick="idinfo();">아이디 비밀번호 찾기</button>
				
				</div>
				<div>
					<button class="userHistoryBtnClass" id="memberWriteBtn" style="cursor: pointer;">회원가입</button>
				</div>
			
			</div>
		</c:if>
		<c:if test="${memLogin!=null}">
		
			<div class="userHistory">
					<c:if test="${memEmail != null }">
						<button class="userHistoryBtnClass" id="logoutBtn" onclick="location.href='/index/member/memberLogout'" style="cursor: pointer;">로그아웃</button>
						<button class="userHistoryBtnClass" id="UpdatePasswordCheckForm" onclick="location.href='/index/member/memberUpdatePasswordCheckForm'" style="cursor: pointer;">회원 정보 수정</button>
						<button type="button" id="recipeBoardWriteFormBtn">레시피 글쓰기</button>
					</c:if>
					<c:if test="${naverEmail != null }">
										<button class="userHistoryBtnClass" id="logoutBtn" onclick="openPopUp()" style="cursor: pointer;">로그아웃</button>
						<button type="button" id="recipeBoardWriteFormBtn">레시피 글쓰기</button>
					</c:if>
					<c:if test="${kakaoEmail != null }">
						<button class="userHistoryBtnClass" id="logoutBtn" onclick="kakaoLogoutForm()" style="cursor: pointer;">로그아웃</button>
						<button type="button" id="recipeBoardWriteFormBtn">레시피 글쓰기</button>
					</c:if>
				
				<div>
				</div>
			</div>
		</c:if>
	</div>
	
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/index/js/index.js"></script>
<script type="text/javascript">
$('#recipeBoardWriteFormBtn').click(function(){
	
	location.href="/index/recipeBoard/recipeBoardWriteForm";

});
</script>

<script type="text/javascript" src="/index/js/member.js"></script>
</body>
</html>