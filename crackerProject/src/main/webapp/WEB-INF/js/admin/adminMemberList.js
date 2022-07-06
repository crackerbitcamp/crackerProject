$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/index/admin/getadminMemberList',
		data : 'pg=' + $('#pg').val(),
		dataType : 'json',
		success : function(data){
			//var memberemail = memberemail1 + "@" + memberemail2;
			//var membertel = membertel1 + " - " + membertel2 + " - " + membertel3;
			
			$.each(data.list, function(index, items) {
				$('<tr/>').append($('<td/>',{
					align : 'center',
					text : items.membername
				}))
				.append($('<td/>',{
					align : 'center',
					text : items.memberid
				}))
				.append($('<td/>',{
					align : 'center',
					text : items.memberemail1 + '@' + items.memberemail2
				}))
				.append($('<td/>',{
					align : 'center',
					text : items.membertel1 + '-' + items.membertel2 + '-' + items.membertel3
				}))
				.append($('<td/>',{
					align : 'center',
					text : items.membernickname
				})).appendTo($('#adminMemberListTable'));
				
			}); //each
		}, // success
		
		error : function(err) {
			console.log(err);
			} // error
			
	}); //ajax 
}); //document
