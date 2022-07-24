<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.mainnav li {
	list-style: none; /* 점 안나오게 하는 것 */
}

.mainnav li a {
	
	margin-left: 11px;
	margin-bottom: 15px;
	color: #000000;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 18px;
	font-weight: bold;
	text-align: right; /* 오른쪽으로 정렬 */
}

.mainnav ul {

}

</style>

<div class="mainnav" style="board: red 1px solid">
	<ul>

		<li><a href="/index/board/boardList">전체</a></li>
		<li><a href="#">인기</a></li>
		<li><a href="#">자유게시판</a></li> <!-- 해당 카테고리 이동 경로 직접연결 -->
		<li><a href="/index/board/recipeBoardList">레시피 게시판</a></li>
		
	</ul>
</div>	