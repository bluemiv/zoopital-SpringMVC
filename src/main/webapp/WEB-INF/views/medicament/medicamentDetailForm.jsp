<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${medicamentDTO.medicament_name}</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
	setInterval(function() {
		sendAjax();
	}, 100);
	function sendAjax() {
		var dateForm = {
				medicament_cost : $('#cost').val(),
				medicament_amount : $('#amount').val()
		};
		$.ajax({
			url : "medicamentSellAjax.pet",
			method : 'POST',
			type : 'json',
			data : JSON.stringify(dateForm),
			contentType : "application/json",
			success : function(data) {
				$('#resultCost').html("<font color = 'blue'>"+data.medicament_cost + "원</font>");
				$('#sellNum').val(data.medicament_amount);
			},
			error : function(data, status, er) {
				$('#resultCost').html("<font color = 'red'>Error" + er + "</font>");
			}
		});
	}
</script>
</head>
<body>
	<h2>약품 코드 / 약품 이름 / 개수 / 가격 / 제조일자 / 유통기한 / 지점</h2><hr>
	${medicamentDTO.medicament_code} / ${medicamentDTO.medicament_name} / 
	${medicamentDTO.medicament_amount} / ${medicamentDTO.medicament_cost}원 / 
	${medicamentDTO.medicament_mandate} / ${medicamentDTO.medicament_exdate} / 
	${medicamentDTO.store_code}<br>
	
	<input type = "hidden" value = "${medicamentDTO.medicament_cost}" id = "cost">
	
	<form action= "medicamentSell.pet" method = "post">
		개수 : <input type = "number" value = "0" min="0" id = "amount" max="${medicamentDTO.medicament_amount}"/>
		<input type = "hidden" name = "sellNum" id = "sellNum"/>
		<input type = "hidden" value = "${medicamentDTO.medicament_amount}" name = "medicament_amount"/>
		<input type = "hidden" value = "${medicamentDTO.medicament_code}" name = "medicament_code"/>
		<input type = "hidden" value = "${medicamentDTO.store_code}" name = "store_code"/>
		<label id = "resultCost">0원</label>
		<input type = "submit" value="판매" />
	</form>
	
	<form action= "medicamentSendPro.pet" method = "post">
		<h4>약품 보낼 곳</h4>
		<select name = "diffStore_code">
		<c:forEach items = "${storeList}" var = "store">
			<c:if test="${medicamentDTO.store_code != store}">
				<option value = "${store}">${store}</option>
			</c:if>
		</c:forEach>
		</select>
		<input type = "hidden" value = "${medicamentDTO.store_code}" name = "store_code"/>
		<input type = "hidden" value = "${medicamentDTO.medicament_amount}" name = "medicament_amount"/>
		<input type = "hidden" value = "${medicamentDTO.medicament_name}" name = "medicament_name"/>
		<input type = "hidden" value = "${medicamentDTO.medicament_code}" name = "medicament_code"/>
		<input type = "number" name = "sendNum" min = "0" max = "${medicamentDTO.medicament_amount}"/>개
		<input type = "submit" value="약품 보내기" />
	</form>
</body>
</html>