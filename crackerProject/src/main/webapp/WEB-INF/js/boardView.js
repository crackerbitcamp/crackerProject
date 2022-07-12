$(function(){
	$.ajax({
		type : 'post',
		url : '/index/board/getBoardView',
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
	
	$('#boardUpdateBtn').click(function(){
		location.href='/index/board/boardUpdateForm?seq='
		+$('input[name=seq]').val()+'&pg='+$('input[name=pg]').val();
	});//click
	
	$('#boardDeleteBtn').click(function(){
		if(confirm('선택하신 항목 삭제하시겠습니까')){
			$.ajax({
				type:'post',
				url : '/index/board/boardDelete',
				data : 'seq='+$('input[name=seq]').val(),
					
				success : function(){
						alert('삭제 되었습니다.');
						location.href='/index/board/boardList';
				},
				
				error:function(e){
					console.log(e);
				}
			});
		}
	});
	
	
	$('#boardReplyBtn').click(function(){
		location.href='/index/board/boardReplyForm?pg='
				+$('input[name=pg]').val()+'&seq='
				+$('input[name=seq]').val();
		
	});
	
	// 댓글
	$('#commentBtn').click(function(){
		$.ajax({
			url : '/index/board/commentWrite',
			type : 'post',
			data : {'commentContent' : $('#commentContent').val(),
					'seq' : $('input[name=seq]').val()},
			success : function(){
				
			},
			error:function(e){
				console.log(e);
			}
				
		});
	});
});
$(function(){
	$.ajax({
		url : '/index/board/commentView',
		type : 'post',
		data : 'seq='+$('input[name=seq]').val(),
		dataType : 'json',
		success:function(data){
//			alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr/>')
				.append($('<td/>',{
					align:'center',
					text: items.nickName
				})).append($('<td/>',{
					align:'center',
					text: items.commentContent
				})).append($('<td/>',{
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












