<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body><h4>문의하기</h4>
<form name="customerView" id="customerView">

	<input type = "text" name="seq" value="${seq}"/>
	<input type = "text" name="pg" value="${pg}"/>
	
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="150" align="center">이름</td>
			<td> <span id="name"></span></td>
		</tr>
		<tr>
			<td width="150" align="center">이메일입력</td>
			<td>  <span id="email"></span></td>
		</tr>
		<tr>
			<td width="150" align="center">제목</td>
			<td><span id="subject"></span></td>
		</tr>
		<tr>
			<td width="150" align="center">내용</td>
			<td colspan=3 height="300" valign="top" >
						<div style="width : 100%; height: 100%; overflow: auto;">
							<pre id = "content" style="white-space:pre-line; word-break: break-all; overflow-wrap: anywhere; ">
							</pre> 
						</div>
					</td>
		</tr>
		 <tr>
            <td colspan="2" align="center"> 
               	<input type="button" value="뒤로가기" onclick="history.back(-1)">
				<input type="button" value="확인" onclick="location.href='/index/admin/adminMain'">
            </td>
         </tr>
         
	</table>
</form>	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/customer/customerView.js"></script>

</body>
</html>