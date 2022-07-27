<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="preconnect" href="https://fonts.googleapis.com"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style type = "text/css">
.subjectA:link {color: black; text-decoration: none;}
.subjectA:visited {color : black; text-decoration: none;}
.subjectA:hover {color: blue; text-decoration: underline;}
.subjectA:active {color: #d81e5b; text-decoration: none;}
#samePage {color: red; text-decoration: none;}
#otherPage {color: black; text-decoration: none;}
#currentPaging{
	color:red;
	text-decoration:underline;
	cursor: pointer;
}
#paging{
	color:black;
	text-decoration:non;
	cursor: pointer;
}

#boardListDiv2{
/* 	border: 1px solid red; */
	width : 45%;
	height: 300px;
	background-color: #fff;
	margin-top: 20px;
/* 	box-shadow: 0 1px 3px 0 rgb(0 0 0 / 15%); */
/* 	border: solid 1px #98a0a7; */
}

#boardListDiv2 .goodCount{
/* 	border: 1px red solid; */
	float: left;
	width: 10%;
	margin: 12px;
	
}

#boardListDiv2 .category{
	float: left;
	width: 10%;
	margin: 12px;
}

#boardListDiv2 .subjcet{
/* 	border: 1px red solid; */
	float: left;
	/* text-align: left; */
	margin: 12px;
	width: 41%;
	white-space : nowrap;
 	overflow: hidden;
	text-overflow: ellipsis;
}

#boardListDiv2 .subjcet a:hover {
	text-decoration: none;
	color : black; 
}

#boardListDiv2 .logtime{
/* 	border: 1px red solid; */
	float: left;
	margin: 12px;
	width: 18%;
	
}

#boardListDiv2 .listMenu{
/* 	border: 1px red solid; */
	text-align:center;
	height:14%;
	width:95%;
	margin: auto;
	border-bottom:1px solid #aaaaaa;

}
</style>


<input type="hidden" id="pg" value="${pg}"/>
<input type="hidden" id='category' value = "${category}">

<div id="boardListDiv2">
	<div class="listMenu">
		<div class="category"><span style="font-size: large;font-weight: 900;">분류</span></div>
		<div class="subjcet"><span style="font-size: large;font-weight: 900;">제목</span></div>
		<div class="logtime"><span style="font-size: large;font-weight: 900;">작성날짜</span></div>
		<div class="goodCount"><span style="font-size: large;font-weight: 900;">추천</span></div>
	</div>
</div>
	
		

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/index/board/getBoardListIndex',
		data : {'pg' : $('#pg').val(),
			'category' : $('#category').val()
		},
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, items){
//					alert(JSON.stringify(data));
				$('<div/>').addClass('listMenu')
					.append($('<div/>',{
					align: 'center',
					text: items.category,
					class: 'category'
				})).append($('<div/>',{
					class: 'subjcet'
					}).append($('<a/>',{
						href:'#',
						text: items.subject,
						class: 'subjectA subjectA_'+items.seq
					}))
				).append($('<div/>',{
					class: 'logtime',
					align: 'center',
					text: items.logtime.toLocaleString()
				})).append($('<div/>',{
					align: 'center',
					text: items.goodcount,
					class: 'goodCount'
				})).appendTo($('#boardListDiv2'));
				
				
				$('.subjectA_'+items.seq).click(function(){
					if(data.memLogin == null){
						alert('먼저 로그인하세요')
					}else{
						location.href = '/index/board/boardView?seq='
										+items.seq+'&pg='+$('#pg').val();
					}
				});
				
				
				
			});//each

		},
		error: function(e){
			 console.log(JSON.stringify(error));
		}
		
	});//ajax
	
});
</script>
<script type="text/javascript">

function boardPaging(pg2) {
   var keyword = $('#keyword').val();

   if(keyword == ''){
      location.href = "/index/board/boardList?pg=" + pg2;
   }else{
	  $('#searchPg').val(pg2);
	  $('#boardSearchBtn').trigger('click');
	  $('#searchPg').val(1);
   }
   
   
}
</script>
