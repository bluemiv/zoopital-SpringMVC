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
	<form class="form-horizontal" action = "orderUpdatePro.pet" method = "post">
		<input type = "hidden" name = "order_code" value="${orderDTO.order_code}"/>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				물품 내용
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" value = "${orderDTO.order_name}" name = "order_name" readonly="readonly" class="form-control"/>
				<span class="input-group-addon">한/A</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				요청 개수
			</label>
			<div class="col-sm-3 input-group">
				<input type = "number" min = "1" value = "${orderDTO.order_amount}" name = "order_amount" class="form-control"/>
				<span class="input-group-addon">개</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				요청받는 곳(목적지 지점)
			</label>
			<div class="col-sm-3 input-group">
				<select name = "order_to" class="form-control">
				<c:forEach items="${order_toList}" var = "list">
					<option value = "${list}">${list}</option>
				</c:forEach>
				</select>
				<span class="input-group-addon">본사</span>
			</div>
		</div>
		<div>
			<div class="col-sm-5 blockquote-reverse">
				<input type = "submit" class="btn btn-md btn-info" value = "수정 완료">
			</div>
		</div>
	</form>
</body>
</html>