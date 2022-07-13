<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="Session2">
	<input type="hidden" id="pg" value="${requestScope.pg }"/>
	<div id="Allcustomer">
		<h3>고객문의 사항</h3>
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
	<div id="customerTable">
		<hr>
		<table id="customerListTable">
			<tr>
				<th width="100" class="thHead">문의번호</th>
				<th width="100" class="thHead">사용자</th>
				<th width="auto" class="thHead">문의제목</th>
				<th width="120" class="thHead">문의날짜</th>
			</tr>	
			<!-- 동적처리 -->
		</table>
	
		<div style = "margin-top: 24px; width : auto; text-align: center;">
		
			<div id="adminCustomerPagingDiv"></div>
			
		</div>
	</div>
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
