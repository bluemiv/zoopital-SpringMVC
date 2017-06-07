<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>접근거부</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
	    <div class="row">
	        <div class="col-md-12">
	        <center>
	            <div class="error-template">
	                <h1>접근 거부</h1>
	                <div><img alt="Error" src="<c:url value="/resources/images/error1.gif"/>"></div>
	                <h2>권한이 없습니다.</h2>
	                <div class="error-details">홈 버튼을 눌러주세요</div>
	                <div class="error-actions">
	                    <a href="<c:url value="/home.pet"/>" class="btn btn-custom btn-lg"><span class="glyphicon glyphicon-home"></span>
						HOME</a>
	                </div>
	            </div>
	        </center>
	        </div>
	    </div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="layout/footer.jsp"/>
</body>
</html>