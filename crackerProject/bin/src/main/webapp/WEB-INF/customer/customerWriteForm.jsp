<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>문의하기</h4>
<form name="customerWriteForm" id="customerWriteForm">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="150" align="center">이름 </td>
			<td> <input type="text" name="name" id="name" readonly></td>
		</tr>
		<tr>
			<td width="150" align="center">이메일입력</td>
			<td> <input type="text" name="email" id="email" readonly> </td>
		</tr>
		<tr>
			<td width="150" align="center">제목</td>
			<td><input type = "text" name="subject" id = "subject" placeholder="제목  입력">
			<div id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="150" align="center">내용</td>
			<td>
			<textarea name="content" id="content" rows="15" cols="50" placeholder="내용을 입력하세요 "></textarea>
            <div class="alertMsg" id="contentDiv"></div>
			</td>
		</tr>
		 <tr>
            <td colspan="2" align="center"> 
               	<input type="button" value="문의하기" id="customerWriteBtn">
               	<input type="reset" value="다시작성">
				<input type="button" value="뒤로가기" onclick="location.href='/index'">
            </td>
         </tr>
         
	</table>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/index/js/customer.js"></script>

</form>
</body>
</html>