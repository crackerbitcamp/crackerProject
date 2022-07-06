<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
body{ 
font-size: 14px;
font-family: -apple-system,BlinkMacSystemFont,"Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif
	,Helvetica Neue, Helvetica, Arial, "Apple SD Gothic Neo", "Malgun Gothic", Dotdum;
}

a{   color: black;
   text-decoration: none;
}

#loginform{
   padding: 20px;
   margin-bottom: 26px;
   box-shadow: 2px 2px 5px #000000;
}

.intro{
   color: #222222;
   padding-left: 3px;
   margin-bottom: 5px;
   font-weight: bold;
}
.info{
   text-align: center;
   margin: 16px 0px 0px 7px ;
   margin-bottom : 35px;
}

.infotext dd {
	float: left;
}

.infotext dd:after {
	
	padding: 0 0.7em;
	color: #999;
}

.infotext dd:last-child:after { /* 마지막 자식 작대기 없애기 */
	content: '';
	padding: 0 0;

}
#member {
width: 30%;
float: right;

}
#member:after{
	url: (./image/person.svg)
}
</style>
</head>

<body>
<div id="loginform">   
   <div id="login">
      <p class="intro" align="center">${memNickname }님 로그인</p>
      <p class="intro" align="center">${memEmail }</p>
      <button type="button" class="btn btn-primary btn-lg btn-block" style="width: 100%;
    	border: 1px #000000 solid; background: #000000;" onclick="location.href='/index/member/memberLogout'">로그아웃</button>
      <div class="info">
      	<dl class="infotext">
      		<dd id=infologin><img src="/index/image/home/person.svg"/ style="margin-bottom: 5px;"><a href="#" onclick="location.href='/index/member/memberUpdatePasswordCheckForm'">회원정보수정</a></dd>
      		<dd id="infologin" style="margin-left: 20px;">내정보</dd>
         	<dd id="member"><a href="#">내가쓴글</a></dd>
         	
      	</dl>
        
      </div>
   </div>   
</div>  

 
</body>
</html>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>