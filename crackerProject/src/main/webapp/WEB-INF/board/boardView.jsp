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

<input type = "hidden" name="seq" id="seq" value="${seq}"/>
<input type = "hidden" name="pg" value="${pg}"/>
<input type = "text" id="memId"value="${memId }" />



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
<div style="margin-right:1px;">
	<button type="button" id="goodBtn">추천</button><span id="goodcount"></span>
</div>

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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		type : "post",
		url : "/index/good/goodCount", 
		dataType : "text",
		data : 'seq='+ $('#seq').val(),
		error : function(){
			alert("통신 에러");
		},
		success : function(data) {
				$('#goodcount').html(data);
	});
});

$('#goodBtn').click(function() {
	$.ajax({
		type : "post",  
        url : "/index/good/updateGood",       
        dataType : "json",   
        data : {'seq' : $('#seq').val(), 'memId' : $('#memId').val()},
        error : function(){
			alert("통신 에러");
		},
		success : function(data) {
		  if(data == 0){
		        	alert("추천완료.");
		        	
		        }
		        else if (data == 1){
		        alert("추천취소");
		    }
		}
	});
});

</script>


</body>
</html>