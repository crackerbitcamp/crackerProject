$(function(){
	$.ajax({
		type : 'post',
		url : '/index/board/getBoardView',
		data : 'seq=' + $('input[name=seq]').val(),
		dataType:'json',
		success : function(data){
//			alert(JSON.stringify(data));
			$('#subjectSpan').html(data.boardDTO.subject);
			$('#seqSpan').html(data.boardDTO.seq);
			$('#nickNameSpan').html(data.boardDTO.nickname);
			$('#hitSpan').html(data.boardDTO.hit);
			$('#categorySpan').html(data.boardDTO.category);
			$('#goodCountSpan').html(data.boardDTO.goodcount);
			$('#logtimeSpan').html(data.boardDTO.logtime);
			$('#content1').html(data.boardDTO.content);  // content 이름 겹쳐 1 추가
			/*if(data.memLogin == data.boardDTO.id){
				$('#boardViewSpan').show();
			}
			else{
				$('#boardViewSpan').hide();
			}*/
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
		location.href='/index/board/boardReplyForm?pg='+$('input[name=pg]').val()+'&seq='+$('input[name=seq]').val()+'&category='+$('input[name=category]').val();
		
	});
	
	// 댓글
	$('#commentBtn').click(function(){
		$.ajax({
			url : '/index/comment/commentWrite',
			type : 'post',
			data : {'commentContent' : $('#commentContent').val(),
					'seq' : $('input[name=seq]').val(),
					'pg' : $('#pg').val(),
					'category' : $('#category').val()},
			success : function(){
				alert('댓글 작성 완료');	
				location.href='/index/board/boardView?seq='+$('#seq').val()+'&pg='+$('#pg').val();
			},
			error:function(e){
				console.log(e);
			}
				
		});
	});
});
$(function(){
	$.ajax({
		url : '/index/comment/commentView',
		type : 'post',
		data : {'seq' : $('input[name=seq]').val(),
				'category' : $('#category').val()},
		dataType : 'json',
		success:function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<li/>').addClass('comment_li')
				.append($('<div/>').addClass('d'+items.seq)
				
				
				.append($('<div/>',{
					class : 'comment_meta'
				}).addClass('comment_div')
				.append($('<span/>',{
					align:'',
					text: items.nickName,
					class: 'comment_nickName'
				}))
				.append($('<span/>',{
					align:'center',
					text: items.logtime.toLocaleString()
				}))).append($('<div/>',{
					text: items.commentContent
				}))).appendTo($('#commentInside')).before($('<input/>',{
					type:'hidden' ,
					value : items.seq,
					class: 'commentSeq'
				}));
				
				if(items.pseq == 0){
					$('.d'+items.seq)
					.append($('<div/>',{
					class : 'commentReplyBtnDiv'
					})
					.append($('<button/>',{
						type:'button',
						text : '답글',
						class : 'commentReplyBtn'
					})));
				}
				
				if(items.pseq != 0){
					//대댓글 한칸 띄우기
					$('.d'+items.seq).css(
						'padding-left','20px'
						
					);
					
					//대댓에 이미지 화살표 붙는거
					$('.d'+items.seq).filter(':first-child')
						.before(
							$(
								'<img>'
								,{src:'/index/image/reply.gif',
								class : 'imgg'
								}
							)
						)
				}//if
			});
		},
		error:function(e){
			console.log(e);
		}
	});
	$(document).on( "click", ".commentReplyBtn", function() {
		$('#commentReply').remove();
		/*$('.commentReplyWriteBtn').remove();*/
		$('.replyFormDiv').remove();
		
		
		$('<div/>').addClass('replyFormDiv').append($('<input/>',{
			type:'text',
			id:'commentReply'
		})).append($('<input/>',{
			type:'button',
			class:'commentReplyWriteBtn',
			value:'답글작성'
		}))
		.appendTo($(this).parent());
		
		$(this).next().find($('.commentReplyWriteBtn')).click(function(){
			$.ajax({
				
				type:'post',
				url:'/index/comment/commentReplyWrite',
				data:{
					'seq' : $(this).closest('li').prev().val(),
					'commentContent' : $('#commentReply').val(),
					'boardSeq' : $('input[name=seq]').val(),
					'category' : $('#category').val()
				},
				success:function(){
					alert('답글 작성완료');
					location.href='/index/board/boardView?seq='
						+$('input[name=seq]').val()+'&pg='+$('input[name=pg]').val();
				},
				error:function(e){
					alert('답글 작성완료');
					location.href='/index/board/boardView?seq='
						+$('input[name=seq]').val()+'&pg='+$('input[name=pg]').val();
					console.log(e);
				}
			});//ajax
		});//대댓글 와이트 버튼
	});//commentReplyBtn 클릭이벤
	
});












