<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#recipeBoardViewForm #commentContentDiv{
	font-size: 7px;
	color: red;
}
</style>
</head>
<body>
<form id="recipeBoardViewForm">

<input type = "hidden" name="seq" id="seq" value="${seq}"/>
<input type = "hidden" name="pg" id ="pg" value="${pg}"/>

<table width="800" border="1" bordercolor="black" cellspacing="0" cellpadding="5" frame ="hsides" rules = "rows">


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
					<td colspan=3 height="700" valign="top" >
						<div style="width : 100%; height: 100%; overflow: auto;">
							<pre id = "content" style="white-space:pre-line; word-break: break-all; overflow-wrap: anywhere; ">
							</pre> 
						</div>
					</td>
				</tr>
				
		
</table>
	<!-- 댓글 입력창 -->
	<div>
		<div>
			댓글입력 : 
			<input type="text" id="commentContent"> 
			<input type="button" id="commentBtn" value="댓글입력">
			<div id="commentContentDiv"></div>
		</div>
	</div>
	
	
	<!-- 댓글창 내려오는곳  -->
	<div style="border: 1px blue solid;" id="commentInside">
	</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type : 'post',
		url : '/index/board/getRecipeBoardView',
		data : 'seq=' + $('input[name=seq]').val(),
		dataType:'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$('#subjectSpan').html(data.boardDTO.subject);
			$('#seqSpan').html(data.boardDTO.seq);
			$('#idSpan').html(data.boardDTO.id);
			$('#hitSpan').html(data.boardDTO.hit);
			$('#content').html(data.boardDTO.content);
			
			if(data.memId == data.boardDTO.id){
				$('#boardViewSpan').show();
			}
			else{
				$('#boardViewSpan').hide();
			}
		},
		
		error:function(e){
			console.log(e);
		}
	});//ajax
});

$('#commentBtn').click(function(){
	if(!$('#commentContent').val()){
		$('#commentContentDiv').html('댓글을 입력하세요');
		
	}else{
		$.ajax({
			url : '/index/board/commentWrite',
			type : 'post',
			data : {'commentContent' : $('#commentContent').val(),
					'seq' : $('input[name=seq]').val()},
			success : function(){
				alert('댓글 작성 완료');
				if($('#category').val() == 'freedomCategory'){
					
					location.href='/index/board/boardView?seq='+$('#seq').val()+'&pg='+$('#pg').val();
				}else{
					
					location.href='/index/board/recipeBoardView?seq='+$('#seq').val()+'&pg='+$('#pg').val();
				}
			},
			error:function(e){
				console.log(e);
			}
			
		});//ajax
	}
	
});//'#commentBtn' 클릭 
$(function(){
	$.ajax({
		url : '/index/board/commentView',
		type : 'post',
		data : 'seq='+$('input[name=seq]').val(),
		dataType : 'json',
		success:function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<div/>')
				.append($('<div/>',{
					align:'center',
					text: items.nickName
				})).append($('<div/>',{
					align:'center',
					text: items.commentContent
				})).append($('<div/>',{
					align:'center',
					text: items.logtime.toLocaleString()
				})).appendTo($('#commentInside'));
			});
		},
		error:function(e){
			console.log(e);
		}
	});
	
});

</script>
</body>
</html>