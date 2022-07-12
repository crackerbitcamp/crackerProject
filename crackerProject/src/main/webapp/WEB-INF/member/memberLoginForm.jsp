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
					<img src="../image/logo.jpg" alt="로고 넣는부분">
				</div>
			</header>
			<section class="login-input-section-wrap">
				<form id = "memberLoginForm">
					<div class="login-input-wrap">	
						<input placeholder="아이디" type="text" id = "memberLoginId" name = "memberid"></input>
					</div>
						<div id="memberLoginIdDiv" class="memberLogin"></div>
					<div class="login-input-wrap password-wrap">	
						<input placeholder="비밀번호" type="password" id="memberLoginpwd" name = "memberpwd"></input>
					</div>
						<div id="memberLoginpwdDiv" class="memberLogin"></div>
					<div class="login-button-wrap">
						<button id="memberloginsubmitBtn" type="button">로그인</button>
					</div>
					<div class="login-stay-sign-in">
						<i class="far fa-check-circle"></i>
						<span style="margin-left: 120px;"><a href = "#" id = "idifo" onclick="idinfo()">아이디</a> / <a href="#" id="pwdinfo">비밀번호 찾기</a>
						 / <a href="/index/member/memberWriteForm" id = "writeinfo">회원가입</a></span>
					</div>
					<div class = "login-img">
						<span> <a id="naverIdLogin_loginButton" href="javascript:void(0)"><img alt="img" src="../image/naverlogo.png"width="30" height="30"></a></span>
						<span><a onclick="javascript:kakaoLogin();"><img alt="img" src="../image/kakaologo.jpg" width="30" height="30"></a></span>
						<span><img alt="facebook"></span>
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