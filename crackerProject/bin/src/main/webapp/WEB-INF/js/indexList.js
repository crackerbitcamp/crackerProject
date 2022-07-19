//1번
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/index/board/getBoardListbest',
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
				})).appendTo($('#bestBardListTable'));
			}); //each
	
		},
		error: function(e){
			console.log(e);
		}
	});
});
//2번
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/index/board/getBoardListhot',
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
				})).appendTo($('#hotBoardListTable'));
			}); //each
	
		},
		error: function(e){
			console.log(e);
		}
	});
});
//3번
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/index/board/getBoardListinfo',
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
				})).appendTo($('#infoBoardListTable'));
			}); //each
	
		},
		error: function(e){
			console.log(e);
		}
	});
});
//4번
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/index/board/getBoardListtest',
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
				})).appendTo($('#testBoardListTable'));
			}); //each
	
		},
		error: function(e){
			console.log(e);
		}
	});
});
