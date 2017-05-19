<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>약품 리스트</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
	function test(){
		alert($(this).prev('.medicamentCode').val());
		
	}
	function sendAjax() {
		var dateForm = {
				medicament_code : $(this).prev('.medicamentCode').val(),
				medicament_name : $(this).prev('.medicamentName').val(),
				medicament_amount : $(this).prev('.medicamentAmount').val(),
				medicament_mandate : $(this).prev('.medicamentManDate').val(),
				medicament_exdate : $(this).prev('.medicamentExDate').val(),
				store_code : $(this).prev('.storeCode').val()
		};
		$.ajax({
			url : "medicamentPreViewAjax.pet",
			method : 'POST',
			type : 'json',
			data : JSON.stringify(dateForm),
			contentType : "application/json",
			success : function(data) {
				alert(data.medicament_cost);
			},
			error : function(data, status, er) {

				alert(data + status + er);
				$('#preView').html("<font color = 'red'>Error" + er + "</font>");
			}
		});
	}
</script>
</head>
<body>
	<h2>약품 코드 / 약품 이름 / 개수 / 가격 / 제조일자 / 유통기한 / 지점</h2><hr>
	<c:forEach items="${list}" var ="var">
	<input type = "hidden" name = "medicamentCode" value = "${var.medicament_code}"/>
	<input type = "hidden" name = "medicamentName" value = "${var.medicament_name}"/>
	<input type = "hidden" name = "medicamentAmount" value = "${var.medicament_amount}"/>
	<input type = "hidden" name = "medicamentManDate" value = "${var.medicament_mandate}"/>
	<input type = "hidden" name = "medicamentExDate" value = "${var.medicament_exdate}"/>
	<input type = "hidden" name = "storeCode" value = "${var.store_code}"/>
	${var.medicament_code} / 
	<a href = "medicamentDetailForm.pet?medicament_code=${var.medicament_code}">${var.medicament_name}</a> / 
	${var.medicament_amount} / ${var.medicament_cost}원 / ${var.medicament_mandate} / 
	${var.medicament_exdate} / ${var.store_code}<br>
	<button onclick = "location='medicamentUpdateForm.pet?medicament_code=${var.medicament_code}'">수정</button>
	<button onclick = "location='medicamentDeletePro.pet?medicament_code=${var.medicament_code}'">삭제</button>
	<button name = "preView" onclick="test()">미리보기</button>
	<hr>
	</c:forEach>
	<button onclick = "location='medicamentInsertForm.pet'">약품 추가</button>

	
</body>
</html>