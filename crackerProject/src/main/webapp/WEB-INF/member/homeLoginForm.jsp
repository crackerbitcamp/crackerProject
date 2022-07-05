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
      <p class="intro" align="center">CRACKER</p>
      <button type="button" class="btn btn-primary btn-lg btn-block" style="width: 100%;
    	border: 1px #000000 solid; background: #000000;" onclick="location.href='/index/member/memberLoginForm'">로그인</button>
      <div class="info">
      	<dl class="infotext">
      		<dd id=infologin><a href="#" >아이디&비밀번호 찾기</a></dd>
         	<dd id="member"><img src="./image/home/person.svg"/><a href="#">회원가입</a></dd>
         	
      	</dl>
        
      </div>
   </div>   
</div>  

 
</body>
</html>

<div id="loginResultDiv"> </div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$('#loginBtn').click(function(){
	   
	   $('#idDiv').empty();
	   $('#pwdDiv').empty();
	   	
	   if($('#id').val() == ''){
	      $('#idDiv').html('아이디를 입력해주세요.');
	      $('#idDiv').css({
	                  'color':'red',
	                  'font-size':'8pt'
	                  });
	      
	   }
	   else if($('#pwd').val() == ''){
	      $('#pwdDiv').html('비밀번호를 입력해주세요.');
	      $('#pwdDiv').css('color','red');
	      $('#pwdDiv').css('font-size','8pt');
	   }
	   else{
		   //1번인 경우 loginService.java 파일 건들면 안됨
	       // $('#loginForm').submit(); // 단순 sumbit 은 action 으로 넘어감
	      
		   //2번 경우
		   $.ajax({
			   type: 'post',
			   url: '/SpringProject/member/login',
			   data: {'id' : $('#id').val(),
				   	  'pwd' : $('#pwd').val()},
			   dataType: 'text',
			   success: function(data){
				   data = data.trim();
				   
				   if(data == 'ok') {
					   location.href = "/SpringProject/index";
					   
				   }else if(data == 'fail'){
					   $('#loginResultDiv').text('로그인 실패');
					   $('#loginResultDiv').css({
			                  'color':'red',
			                  'font-size':'13pt'
			                  });
					   
				   }
				   
			   },
			   error: function(err){
				   console.log(err);
			   }
		   });
	   }
	   
	});
</script>


