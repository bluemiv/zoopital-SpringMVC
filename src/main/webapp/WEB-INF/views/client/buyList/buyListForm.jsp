<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<title>구매목록</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>구매목록</h2>
				<hr>
			</div>
		</div>
		
		<div class="row">
			<table width="100%" class="table table-striped table-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>사진</th>
						<th>구매번호</th>
						<th>상품번호</th>
						<th>상품종류</th>
						<th>상품이름</th>
						<th>상품개수</th>
						<th>총가격</th>
						<th>구매날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var ="var">
					<tr class = "board-custom">
						<td><img src="<c:url value="/resources/images/product_img/${var.product_url}" />" class="img-sm"></td>
						<td>${var.buyList_code}</td>
						<td>${var.product_code}</td>
						<td>${var.product_category}</td>
						<td>${var.product_name}</td>
						<td>${var.product_amount}개</td>
						<td>${var.product_amount * var.product_cost}원</td>
						<td>${var.butList_date}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	<!-- 푸터 파일 -->
	<jsp:include page="../../layout/footer.jsp"/>
</body>
</html>