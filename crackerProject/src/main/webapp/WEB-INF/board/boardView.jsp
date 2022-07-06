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
<form name = "boardViewForm">

<input type = "hidden" name="seq" value="${seq}"/>
<input type = "hidden" name="pg" value="${pg}"/>



<table width="600" border="1" bordercolor="black" cellspacing="0" cellpadding="5" frame ="hsides" rules = "rows">


				<tr>
					<td colspan="3">
					
						<h4><span id="subjectSpan"></span></h4>
					</td>
				</tr>
				<tr>
					<td width="150" align="center">글번호 : <span id="seqSpan"></span></td>
					<td width="150" align="center">작성자 : <span id="idSpan"></span></td>
					<td width="150" align="center">조회수 : <span id="hitSpan"></span></td>
				</tr>
				<tr>
					<td colspan=3 height="300" valign="top" >
						<div style="width : 100%; height: 100%; overflow: auto;">
							<pre id = "content" style="white-space:pre-line; word-break: break-all; overflow-wrap: anywhere; ">
							</pre> 
						</div>
					</td>
				</tr>

</table>

<table style="border:1px red solid;" id="commentInside">


</table>

<div>
	<div>
		댓글입력 : 
		<input type="text" id="commentContent"> 
		<input type="button" id="commentBtn" value="댓글입력">
	</div>
</div>

<input type="button" value="목록"
style = "margin: 5px;" onclick= "location.href='/index/board/boardList?pg=${pg}'">

<span id = "boardViewSpan">
	<input type="button" value="글수정" id="boardUpdateBtn">
	<input type="button" value="삭제" id="boardDeleteBtn">
</span>

<input type="button" value="답글" id="boardReplyBtn">
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="../js/boardView.js">
</script>


</body>
</html>