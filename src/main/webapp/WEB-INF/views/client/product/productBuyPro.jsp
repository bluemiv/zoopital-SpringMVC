<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../../layout/header.jsp"/>
	
	<center>
	<c:if test="${check == true }">
		<h1>결제 완료! 감사합니다.</h1>
		<img src="<c:url value="/resources/images/buy/success_img.gif" />" alt="">
	</c:if>
	<c:if test="${check == false }">
		<h1>결제를 실패 했습니다.</h1>
		<img src="<c:url value="/resources/images/buy/fail_img.gif" />" alt="">
	</c:if>
	<hr>
	<h4>메인화면으로 가기</h4>
	<a href="<c:url value="/webHome.pet"/>" class="btn btn-custom btn-lg">
	<span class="glyphicon glyphicon-home"></span> HOME</a>
	</center>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../../layout/footer.jsp"/>
</body>
</html>