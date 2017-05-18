<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>약품 리스트</title>
</head>
<body>
	<h2>약품 코드 / 약품 이름 / 개수 / 가격 / 제조일자 / 유통기한 / 지점</h2><hr>
	<c:forEach items="${list}" var ="var">
	${var.medicament_code} / 
	<a href = "medicamentDetailForm.pet?medicament_code=${var.medicament_code}">${var.medicament_name}</a> / 
	${var.medicament_amount} / ${var.medicament_cost}원 / ${var.medicament_mandate} / 
	${var.medicament_exdate} / ${var.store_code}<br>
	<button onclick = "location='medicamentUpdateForm.pet?medicament_code=${var.medicament_code}'">수정</button>
	<button onclick = "location='medicamentDeletePro.pet?medicament_code=${var.medicament_code}'">삭제</button>
	<hr>
	</c:forEach>
	<button onclick = "location='medicamentInsertForm.pet'">약품 추가</button>

	
</body>
</html>