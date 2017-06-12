<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Zoopital</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="layout/header.jsp"/>
	
	<!-- 컨텐츠 -->
	<br>
	<br>
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <img class="fill" src="<c:url value="/resources/images/bg1.jpg" />" />
                <div class="carousel-caption">
                    <h2>Zoopital</h2>
                </div>
            </div>
            
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <img class="fill" src="<c:url value="/resources/images/bg2.jpg" />" />
                <div class="carousel-caption">
                    <h2>Zoopital</h2>
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <img class="fill" src="<c:url value="/resources/images/bg3.jpg" />" />
                <div class="carousel-caption">
                    <h2>Zoopital</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>

    </header>
	<!-- Page Content -->
    <div class="container">
        <div class = "row">
			<se:authorize access="isAnonymous()">
            <div class="col-lg-3">
        		<h1>로그인</h1>
                <img src="<c:url value="/resources/images/menu1.jpg" />" alt="로그인" class="img-circle img-sm" onclick ="location='loginForm.pet'">
            </div>
            </se:authorize>
        	<div class="col-lg-3">
        		<h1>상품리스트</h1>
                <img src="<c:url value="/resources/images/menu2.jpg" />" alt="상품리스트" class="img-circle img-sm" onclick ="location='client/product/productListForm.pet'">
            </div>
            <se:authorize access="hasAnyRole('ROLE_SUPER_PART','ROLE_SUPER_FULL', 'ROLE_FULL', 'ROLE_PART')">
            <div class="col-lg-3">
        		<h1>관리자페이지</h1>
                <img src="<c:url value="/resources/images/menu3.jpg" />" alt="관리자페이지" class="img-circle img-sm" onclick ="location='home.pet'">
            </div>
            </se:authorize>
			<se:authorize access="hasAnyRole('ROLE_SUPER_PART','ROLE_SUPER_FULL')">
            <div class="col-lg-3">
        		<h1>상품 등록</h1>
                <img src="<c:url value="/resources/images/menu4.jpg" />" alt="상품 등록" class="img-circle img-sm" onclick ="location='client/product/productInsertForm.pet'">
            </div>
            </se:authorize>
        </div>
        <hr>
    </div>
    <!-- /.container -->
	
	
	<!-- 푸터 파일 -->
	<jsp:include page="layout/footer.jsp"/>
	
	<!-- Script to Activate the Carousel -->
    <script>
	    $('.carousel').carousel({
	        interval: 2000 //changes the speed
	    })
    </script>
</body>
</html>