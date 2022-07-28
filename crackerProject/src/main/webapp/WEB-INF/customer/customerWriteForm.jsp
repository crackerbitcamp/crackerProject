<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


#customerTable{ 
	margin: 50px auto;
    display: flex;
    width: 900px;
    height: 600px;
}

.customerData{
	width: 155px;
	font-size: 20px;
	text-align: center;
}

.customerTableData #content {
	width : 650px;
	height : 250px;
	margin-left : 0px;
}

#customerTable input{
border:0 solid black;
}
.customerNone {
	background: none;
	/* border: none; */
	font-size: 20px;
	padding: 20px;
	margin: auto;
}
#subjectDiv {
	color: red;
}

#customerBtn input{
	margin-right:30px;
}

#customerWriteBtn {
	margin-left : 100px;
}
/* Header */

.customerBoardTop {
	width: 100%;
	border-bottom : 1px solid #f76900;
}

.inner {
	font-family: 'Noto Sans KR', sans-serif;
	padding: 48px 0px 48px 0px ;
	width: 100%;
	background-color: #f3f3f3;
}
.title2 {
	margin-top: 50px;
    text-align: center;
    font-size: 2rem;
    font-weight: bold;
    font-family: 'Noto Sans KR', sans-serif;
	
}

.title3 {
	color: #787878;
	text-align : center;
   	margin: auto;
   	margin-top: 20px;
   	font-size: 1.3rem;
  	font-family: 'Noto Sans KR', sans-serif;
}

</style>
</head>
<body>

<header class="customerBoardTop">
	<div class="inner">
		<h1 class="title2">문의하기</h1>
		<h2 class="title3">확인 후 바로 도와드리겠습니다.</h2>
	</div>
</header>

<form name="customerWriteForm" id="customerWriteForm">

	<table id="customerTable" border="1" cellspacing="0" cellpadding="5">
		<c:if test="${memLogin!=null}">
			<c:if test="${memEmail != null }">
			<tr class="customerTableData">
				<td class="customerData" >이름 </td>
				<td ><input type="text" class="customerNone" name="name" id="name" value="${name }" readonly></td>
			</tr>
			
			<tr class="customerTableData">
				<td class="customerData" >이메일</td>
				<td> <input type="text" class="customerNone" name="email" id="email" value="${email }" readonly> </td>
			</tr>
			</c:if>
			
			<c:if test="${naverEmail != null }">
			<tr class="customerTableData">
				<td class="customerData" >이름 </td>
				<td ><input type="text" class="customerNone" name="name" id="name" value="${naverName }" readonly></td>
			</tr>
			
			<tr class="customerTableData">
				<td class="customerData" >이메일입력</td>
				<td> <input type="text" class="customerNone" name="email" id="email" value="${naverEmail }" readonly> </td>
			</tr>
			</c:if>
			
			<c:if test="${kakaoEmail != null }">
			<tr class="customerTableData">
				<td class="customerData" >이름 </td>
				<td ><input type="text" class="customerNone" name="name" id="name" value="${kakaoNickname }" readonly></td>
			</tr>
			
			<tr class="customerTableData">
				<td class="customerData" >이메일입력</td>
				<td> <input type="text" class="customerNone" name="email" id="email" value="${kakaoEmail }" readonly> </td>
			</tr>
			</c:if>
			</c:if>	
			
			<tr class="customerTableData">
				<td class="customerData" >제목</td>
				<td><input type = "text" class="customerNone" name="subject" id = "subject" placeholder="제목을 입력하세요">
				<div id="subjectDiv"></div>
				</td>
			</tr>
			
			<tr class="customerTableData">
				<td class="customerData" >내용</td>
				<td>
				<textarea name="content"  class="customerNone" id="content" rows="15" cols="50" placeholder="내용을 입력하세요 "></textarea>
           		 <div class="alertMsg" id="contentDiv"></div>
				</td>
			</tr>
			
			
			 <tr>
         	   <td colspan="2" align="center" style="padding-top:70px;" id="customerBtn"> 
          	     	<input type="button" value="문의하기" id="customerWriteBtn">
          	     	<input type="reset" value="다시작성" onclick="location.reload();">
					<input type="button" value="뒤로가기" onclick="location.href='/index'">
          	  </td>	
         </tr>
         
	</table>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/index/js/customer.js"></script>

</form>
</body>
</html>