<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	확인 : ${item.memberDTO.memberemail}<br>
	productJoinDTO.seq : ${item.productJoinDTO.seq }<br>
	productJoinDTO.productName : ${item.productJoinDTO.productName }<br>
	productJoinDTO.productSubject : ${item.productJoinDTO.productSubject }<br>
	productJoinDTO.productContent : ${item.productJoinDTO.productContent }<br> 
	${item.totalprice }
	$(item.shopqty)
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

</html>