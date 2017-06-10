<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../../layout/header.jsp"/>
	
	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>물품 정보</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action="productBuyForm.pet" method="post">
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<img src="<c:url value="/resources/images/product_img/${productDTO.product_url}" />" alt="" class="img-md">
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 이름</label>
							<input type = "text" readonly="readonly" name="product_name" value="${productDTO.product_name}" class="form-control">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 개수</label>
							<input type = "number" readonly="readonly" value="${productDTO.product_amount}" min = "0" class="form-control" placeholder="개수">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">구입할 개수</label>
							<input type="number" min="0" name = "buy_amount" class="form-control"/>
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 가격</label>
							<input type = "number" readonly="readonly" name="product_cost" value="${productDTO.product_cost}" min = "0" class="form-control" placeholder="판매가격">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 종류</label>
							<input type = "text" readonly="readonly" class="form-control" name="product_category" value="${productDTO.product_category}">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="form-group col-xs-12">
							<input type = "hidden" value="${productDTO.product_code}" name="product_code"/>
							<se:authorize access = "isAuthenticated()">
								<input class = "btn btn-custom btn-md" type="submit" value="구입">
							</se:authorize>
							<se:authorize access="isAnonymous()">
								<label for="name"><a href="../../loginForm.pet">로그인</a><font color="red"> 후 구매 가능 합니다.</font></label>
							</se:authorize>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../../layout/footer.jsp"/>
</body>
</html>