<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%--  <c:if test="${requestScope.id == null }">
 	<jsp:include page="../member/loginForm.jsp"></jsp:include>
 </c:if>
 
 <c:if test="${requestScope.id != null }"> 
 	<jsp:include page="../member/loginOk.jsp"></jsp:include>
 </c:if>  --%>
 
 <c:if test="${ sessionScope.memId == null && naverEmail == null}">
 	<jsp:include page="../member/homeLoginForm.jsp" /> 
 </c:if>
 
  <c:if test="${memId != null }">
 	 <jsp:include page="../member/loginOk.jsp" /> 
 </c:if>
 <c:if test="${naverEmail != null }">
 	<jsp:include page="../member/naverOk.jsp" />
 </c:if>

  
  