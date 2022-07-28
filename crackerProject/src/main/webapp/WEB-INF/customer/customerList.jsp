<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="../css/adminCSS/admincss.css" type="text/css">    

<div id="Session2">
	<input type="hidden" id="pg" value="${requestScope.pg }"/>
	<div id="Allcustomer">
		<h3 style="margin-top:10px; margin-left: 10px;">고객문의 사항</h3>
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
	</div>
		<table id="customerListTable">
			<tr>
				<th class="thHead" style="width: 15%;">번호</th>
				<th class="thHead" style="width: 25%;">사용자</th>
				<th class="thHead" style="width: 35%;">제목</th>
				<th class="thHead">날짜</th>
			</tr>	
			<!-- 동적처리 -->
		</table> 
		
		<div id="adminCustomerPagingDiv"></div>
</div>

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
