$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/index/board/getBoardList',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			//console.log(JSON.stringify(data));
			$.each(data.list, function(index, items){
				//console.log(index, items.seq, items.subject, items.id, items.logtime, items.hit);
				
				$('<tr/>').append( $('<td/>', {
					
				}).append( $('<a/>', {
					href: '#',
					text: items.subject,
					/*id: 'subjectA',
					class: 'subjectA_'+items.seq (고유키) */ 
					class: 'subjectA subjectA_'+items.seq
				}))
			).append($('<td/>', {
					text: items.id
				})).append($('<td/>', {
					text: items.hit
				})).appendTo($('#board1ListTable'));
				
			}); //each
			
		},
		error: function(e){
			console.log(e);
		}
	});
});

$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/index/board/getBoardList',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			//console.log(JSON.stringify(data));
			$.each(data.list, function(index, items){
				//console.log(index, items.seq, items.subject, items.id, items.logtime, items.hit);
				
				$('<tr/>').append( $('<td/>', {
					
				}).append( $('<a/>', {
					href: '#',
					text: items.subject,
					/*id: 'subjectA',
					class: 'subjectA_'+items.seq (고유키) */ 
					class: 'subjectA subjectA_'+items.seq
				}))
			).append($('<td/>', {
					text: items.id
				})).append($('<td/>', {
					text: items.hit
				})).appendTo($('#board2ListTable'));
				
			}); //each
			
		},
		error: function(e){
			console.log(e);
		}
	});
});

$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/index/board/getBoardList',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			//console.log(JSON.stringify(data));
			$.each(data.list, function(index, items){
				//console.log(index, items.seq, items.subject, items.id, items.logtime, items.hit);
				
				$('<tr/>').append( $('<td/>', {
					
				}).append( $('<a/>', {
					href: '#',
					text: items.subject,
					/*id: 'subjectA',
					class: 'subjectA_'+items.seq (고유키) */ 
					class: 'subjectA subjectA_'+items.seq
				}))
			).append($('<td/>', {
					text: items.id
				})).append($('<td/>', {
					text: items.hit
				})).appendTo($('#board3ListTable'));
				
			}); //each
			
		},
		error: function(e){
			console.log(e);
		}
	});
});

$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/index/board/getBoardList',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			//console.log(JSON.stringify(data));
			$.each(data.list, function(index, items){
				//console.log(index, items.seq, items.subject, items.id, items.logtime, items.hit);
				
				$('<tr/>').append( $('<td/>', {
					
				}).append( $('<a/>', {
					href: '#',
					text: items.subject,
					/*id: 'subjectA',
					class: 'subjectA_'+items.seq (고유키) */ 
					class: 'subjectA subjectA_'+items.seq
				}))
			).append($('<td/>', {
					text: items.id
				})).append($('<td/>', {
					text: items.hit
				})).appendTo($('#board4ListTable'));
				
			}); //each
			
		},
		error: function(e){
			console.log(e);
		}
	});
});








