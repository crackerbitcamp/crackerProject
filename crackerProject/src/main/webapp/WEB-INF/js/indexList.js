$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/index/board/getBoardList',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data){
			console.log(JSON.stringify(data));
			
			$.each(data.list, function(index, items){
				//console.log(index, items.seq, items.subject, items.id, items.logtime, items.hit);
				
				$('<tr/>').append( $('<td/>', {	 //제목
					}).append( $('<a/>', {
						href: '#',
						text: items.subject,
						class: 'subjectA subjectA_'+items.seq
				}))
				).append($('<td/>', { //번호
					text: items.seq
				})).append($('<td/>', { 	//조회수
					text: items.hit
				})).appendTo($('#boardListTable1'));
				
				//로그인 여부
				$('.subjectA_'+items.seq).click(function(){
					if(data.memId == null){
						alert('먼저 로그인하세요');
					}else{
						location.href = '/index/board/boardView?seq='+items.seq+'&pg='+$('#pg').val();
					}
				});
				
				//답글
				for(i=0; i<items.lev; i++){
					$('.subjectA_'+items.seq).before('&emsp;');
				}
				if(items.pseq != 0){
					$('.subjectA_'+items.seq).before($('<img/>', {
						src: '/index/image/reply.gif'
					}));
				}
				
			}); //each
	
		},
		error: function(e){
			console.log(e);
		}
	});
});
