<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>장바구니 등록</title>
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
				<h2>장바구니</h2>
				<hr>
			</div>
		</div>
		
		<div class="row">
			<table width="100%" class="table table-striped table-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>사진</th>
						<th>상품 이름</th>
						<th>상품 종류</th>
						<th>구입 개수</th>
						<th>총 가격</th>
						<th>내용보기</th>
						<th>구입/삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var ="var">
					<tr class = "board-custom">
						<td><img src="<c:url value="/resources/images/product_img/${var.product_url}" />" class="img-sm"></td>
						<td>${var.product_name}</td>
						<td>${var.product_category}</td>
						<td>${var.product_amount}개</td>
						<td>${var.product_amount * var.product_cost}원</td>
						<td>
							<!-- 상세보기 -->
							<button class="btn btn-md btn-custom"
							onclick = "location='../product/productDetailForm.pet?product_code=${var.product_code}'">
							상세보기<span class="glyphicon glyphicon-list-alt"></span></button>
						</td>
						<td>
							<form action = "" method = "post">
								<!-- 목록 삭제 -->
								<button type="button" class = "btn btn-custom btn-md" data-toggle="modal" data-target="#deleteBasketModal">
									삭제
								</button>
							</form>
							<!-- 삭제 모달 -->
							<div class="modal fade" id="deleteBasketModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel">삭제</h4>
										</div>
										<form action = "baksetDelete.pet" method="post">
											<div class="modal-body">
												<img src="<c:url value="/resources/images/product_img/${var.product_url}" />" alt="">
												<hr>
												<h3>${var.product_name}</h3>
												<p>삭제 하시겠습니까?</p>
												<input type="hidden" name="basket_code" value="${var.basket_code}"/>
											</div>
											<div class="modal-footer">
												<button type="button" class = "btn btn-custom btn-md" data-dismiss="modal">취소</button>
												<input type="submit" class = "btn btn-custom btn-md" value="삭제">
											</div>
										</form>
									</div>
								</div>
							</div><!-- 모달 끝 -->
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	<!-- 푸터 파일 -->
	<jsp:include page="../../layout/footer.jsp"/>
</body>
</html>