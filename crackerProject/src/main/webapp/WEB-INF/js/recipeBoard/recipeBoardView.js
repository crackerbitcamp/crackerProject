$(function() {
	$.ajax({
		type : "post",
		url : "/index/good/goodCount",
		dataType : "text",
		data : 'seq=' + $('#seq').val(),
		error : function() {
			alert("통신 에러");

		},
		success : function(data) {
			$('#goodcount').html(data);
		}
	});
});

$('#goodBtn').click(function() {
	$.ajax({
		type : "post",
		url : "/index/good/updateGood",
		dataType : "json",
		data : {
			'seq' : $('#seq').val(),
			'memEmail' : $('#memEmail').val()
		},
		error : function() {
			alert("통신 에러");
		},
		success : function(data) {
			if (data == 0) {
				alert("추천완료.");
				document.location.reload();

			} else if (data == 1) {
				alert("추천취소");
				document.location.reload();
			}
		}
	});
});



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
				location.href='/index/recipeBoard/recipeBoardView?seq='+$('#seq').val()+'&pg='+$('#pg').val();
			},
			error:function(e){
				console.log(e);
			}
				
		});
	});

$(function(){
	$.ajax({
		url : '/index/comment/commentView',
		type : 'post',
		data : {'seq':$('input[name=seq]').val(),
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
				
				/*for(i=0; i<items.lev; i++){
					$('.d'+items.seq).before('&emsp;');
				}*/
				
				//대댓글에 답글버튼 없애는거 
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
				
				
			});//each
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
					location.href='/index/recipeBoard/recipeBoardView?seq='
						+$('input[name=seq]').val()+'&pg='+$('input[name=pg]').val();
				},
				error:function(e){
					alert('답글 작성완료');
					location.href='/index/recipeBoard/recipeBoardView?seq='
						+$('input[name=seq]').val()+'&pg='+$('input[name=pg]').val();
					console.log(e);
				}
			});//ajax
		});//대댓글 와이트 버튼
	});//commentReplyBtn 클릭이벤트
});
