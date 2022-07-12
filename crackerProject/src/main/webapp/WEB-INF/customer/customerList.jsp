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
#customerListTable a{
	color: 000000;
}
#customerseq{
	display: contents;
}
</style>

<input type="text" id="pg" value="${param.pg }"/>
<table id="customerListTable" border="1" bordercolor="black" cellspacing="0" cellpadding="5" frame ="hsides" rules = "rows">
	<tr>
		<th width="70">글번호</th>
		<th width="100">이름</th>
		<th width="300">제목</th>
		<th width="100">날짜</th>
	</tr>
	<!-- 동적처리 -->
</table>

<div style = "margin: 10px; width : 600px; text-align: center;">


	<input style = "float:left; " type ="button" value="전체보기"  onclick="location.href='/index/customer/customerList'">

	<div id="adminCustomerPagingDiv"></div>
</div>
<br><br>
<form id = "customerSearchForm" name = "customerSearchForm" >
	<input type="hidden" name="pg" id="searchPg" value="1"/>
	<div style = "text-align:center;">
		<select name = "searchOption" id = "searchOption">
			<option value ="subject">내용</option>
			<option value ="name">이름</option>
		</select>
		<input type ="search" name="keyword" id="keyword" value="${keyword}">
		<input type ="button" id = "customerSearchBtn" value="검색">
	</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="../js/customer/memberCustomerList.js">
</script>
<script type="text/javascript">

function customerPaging(pg2) {
   var keyword = $('#keyword').val();

   if(keyword == ''){
	  location.href = "/index/customer/notkeywordcustomer?pg="+pg2;
      /* location.href = "customerList?pg=" + pg2; */
   }else{
	  $('#searchPg').val(pg2);
	  $('#customerSearchBtn').trigger('click');
	  $('#searchPg').val(1);
   }
   
   
}
</script>
