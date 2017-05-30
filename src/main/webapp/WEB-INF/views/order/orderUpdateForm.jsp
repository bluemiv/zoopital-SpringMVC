<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>내역 수정</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>약품 등록</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action = "orderUpdatePro.pet" method = "post">
					<input type = "hidden" name = "order_code" value="${orderDTO.order_code}"/>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 내용</label>
							<input type = "text" value = "${orderDTO.order_name}" name = "order_name" readonly="readonly" class="form-control"/>
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">요청 개수</label>
							<input type = "number" min = "1" value = "${orderDTO.order_amount}" name = "order_amount" class="form-control"/>
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">요청받는 곳(목적지 지점)</label>
							<select name = "order_to" class="form-control">
							<c:forEach items="${order_toList}" var = "list">
								<option value = "${list}">${list}</option>
							</c:forEach>
							</select>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="수정 완료">
							<input class = "btn btn-custom btn-md" type="button" onclick = "location='orderInfoForm.pet'" value="발주 내역 보기">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>