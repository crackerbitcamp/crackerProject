<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/member.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8" ></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style type="text/css" >
</style>
  <meta charset="utf-8">
  <title></title>
  </head>
	<body>
		<div class="main-container">
			<div class="main-wrap">
			<header>
				<div class="logo-wrap">
					<img src="/index/image/home/LOGO2.jpeg" alt="로고 넣는부분" style="width: 550px; height: 100px;">
				</div>
			</header>
			<section class="login-input-section-wrap">
				<form id = "memberLoginForm">
					<div class="login-input-wrap">	
						<input placeholder="ex)cracker123@naver.com" type="text" id = "memberLoginEmail" name = "memberemail"></input>
					</div>
						<div id="memberLoginIdDiv" class="memberLogin"></div>
					<div class="login-input-wrap password-wrap">	
						<input placeholder="비밀번호" type="password" id="memberLoginpwd" name = "memberpwd"></input>
					</div>
						<div id="memberLoginpwdDiv" class="memberLogin"></div>
					<div class="login-button-wrap">
						<button id="memberloginsubmitBtn" type="button" style="width: 470px;">로그인</button>
					</div>
					<div class="login-stay-sign-in">
						<i class="far fa-check-circle"></i>
						<span style="margin-left: 120px;"><a href = "#" id = "idifo" onclick="idinfo()">아이디 /비밀번호 찾기</a>
						 / <a href="/index/member/memberWriteForm" id = "writeinfo">회원가입</a></span>
					</div>
					<div class = "login-button-wrap">
						<button id="naverIdLogin_loginButton" type="button" style="width: 470px; background: #2DB400; border: none;">네이버 로그인</button>
						<button onclick="javascript:kakaoLogin();" style="width: 470px; background: #FEE500; border: none; margin-top: 10px;">카카오 로그인</button>
					</div>
				</form>
			</section>
			<footer>
				<div class="copyright-wrap">
				<span> Copyright © Tumblbuk Corp. All Rights Reserved.</span>
				</div>
			</footer>
			</div>
		</div>
  </body>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="../js/member.js"></script>
  <script type="text/javascript" src="../js/naver.js"></script>
  <script type="text/javascript" src="../js/kakao.js"></script>
</html>