<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css" src="/index/css/member.css"></style>
<style type="text/css">
#customerTable{
	margin: auto;
}

.customerData{
	width: 200px;
	font-size: 24px;
	padding: 20px;
}

#customerTable input{
border:0 solid black;
}
.customerNone {
	background: none;
	border: none;
	font-size: 24px;
	padding: 20px;
	margin: auto;
}
#subjectDiv {
	color: red;
}
</style>
</head>
<body>
<h2>문의하기</h2>
<form name="customerWriteForm" id="customerWriteForm">
	<table id="customerTable" border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td class="customerData" >이름 </td>
			<td ><input type="text" class="customerNone" name="name" id="name" value="${name }" readonly></td>
		</tr>
		<tr>
			<td class="customerData" >이메일입력</td>
			<td> <input type="text" class="customerNone" name="email" id="email" readonly> </td>
		</tr>
		<tr>
			<td class="customerData" >제목</td>
			<td><input type = "text" class="customerNone" name="subject" id = "subject" placeholder="제목을 입력하세요">
			<div id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<td class="customerData" >내용</td>
			<td>
			<textarea name="content"  class="customerNone" id="content" rows="15" cols="50" placeholder="내용을 입력하세요 "></textarea>
            <div class="alertMsg" id="contentDiv"></div>
			</td>
		</tr>
		 <tr>
            <td colspan="2" align="center"> 
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