<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>부트스트랩 차트그리기</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<body>
	<div class="container">
	<h2 style="margin-top:10px;">회원가입 현황</h2>
   	 <button id="sendAjax" onclick="window.location.reload()">새로고침</button>
	<br>
   	 <canvas id="myChart" width="460px" height="300px"></canvas>
    </div>
    <div style="margin-top: 10px;">
    	<button id="memberGraphBtn" >CRACKER 회원</button>
    	<button id="memberDayGraphBtn" >가입자 현황</button>
    </div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
  	  integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
  	  crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
  	  integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
  	  crossorigin="anonymous"></script>
 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
 	   integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
 	   crossorigin="anonymous"></script>

<script type="text/javascript" src="../js/chart.js"></script>
<script type="text/javascript">
</script>
</body>
</html>
