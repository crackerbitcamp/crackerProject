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
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 18px;
	font-weight: bold;
	text-align: right; /* 오른쪽으로 정렬 */
}

.mainnav ul {

}

</style>

<div class="mainnav" style="board: red 1px solid">
	<ul>
		<li><a href="#">SHOP</a></li>
		<li><a href="/index/board/boardList">FREE</a></li>
		<li><a href="/index/board/recipeBoardList">RECIPE</a></li>
		
	</ul>
</div>	