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
</style>


<input type="hidden" id="pg" value="${pg}"/>
<table id="boardListTable" border="1" bordercolor="black" cellspacing="0" cellpadding="5" frame ="hsides" rules = "rows">
	<tr>
		<th width="100">글번호</th>
		<th width="300">제목</th>
		<th width="100">작성자</th>
		<th width="100">작성일</th>
		<th width="100">조회수</th>
	</tr>
	<!-- 동적처리 -->
</table>

<div style = "margin: 10px; width : 600px; text-align: center;">


	<input style = "float:left; " type ="button" value="글쓰기"  onclick="location.href='/index/board/boardWriteForm'">

	
	<div id="boardPagingDiv"></div>
	
</div>
<br><br>
<form id = "boardSearchForm" name = "boardSearchForm" >
	<input type="hidden" name="pg" id="searchPg" value="1"/>

</form>

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
