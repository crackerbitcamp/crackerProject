<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style type = "text/css">
.subjectA:link {color: black; text-decoration: none;}
.subjectA:visited {color : black; text-decoration: none;}
.subjectA:hover {color: blue; text-decoration: underline;}
.subjectA:active {color: #d81e5b; text-decoration: none;}
#samePage {color: red; text-decoration: none;}
#otherPage {color: black; text-decoration: none;}
#currentPaging{
	color:red;
	text-decoration:underline;
	cursor: pointer;
}
#paging{
	color:black;
	text-decoration:non;
	cursor: pointer;
}

#boardListDiv{
/* 	border: 1px solid red; */
	margin:auto;
	width: 70%;
	height: 700px;
}

#boardListDiv .goodCount{
/* 	border: 1px red solid; */
	float: left;
	width: 10%;
	margin: 10px;
}

#boardListDiv .subjcet{
/* 	border: 1px red solid; */
	float: left;
	margin: 10px;
	width: 40%;
}

#boardListDiv .logtime{
/* 	border: 1px red solid; */
	float: left;
	margin: 10px;
	width: 20%;
}

#boardListDiv .nickName{
/* 	border: 1px red solid; */
	float: left;
	margin: 10px;
	width: 19%;
}

#boardListDiv .listMenu{
/* 	border: 1px red solid; */
	text-align:center;
	height:6%;
	width:95%;
	margin: auto;
}
</style>


<input type="hidden" id="pg" value="${pg}"/>
<div id="boardListDiv">
	<div class="listMenu">
		<div class="goodCount">추천</div>
		<div class="subjcet">제목</div>
		<div class="logtime">작성날짜</div>
		<div class="nickName">닉네임</div>
	</div>
</div>
		<div><input style = "float:left; " type ="button" value="글쓰기"  onclick="location.href='/index/board/boardWriteForm'">
			<div id="boardPagingDiv"></div>
		</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="../js/boardList.js">
</script>
<script type="text/javascript">

function boardPaging(pg2) {
   var keyword = $('#keyword').val();

   if(keyword == ''){
      location.href = "/index/board/boardList?pg=" + pg2;
   }else{
	  $('#searchPg').val(pg2);
	  $('#boardSearchBtn').trigger('click');
	  $('#searchPg').val(1);
   }
   
   
}
</script>
