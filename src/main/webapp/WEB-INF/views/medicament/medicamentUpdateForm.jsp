<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>약품 수정</title>
</head>
<body>
	<form action = "medicamentUpdatePro.pet" method = "post">
		<input type = "hidden" name = "medicament_code" value = "${medicamentDTO.medicament_code}">
		약품 이름 : <input type = "text" name = "medicament_name" value = "${medicamentDTO.medicament_name}"><br>
		약품 개수 : <input type = "number" min = "1" name = "medicament_amount" value = "${medicamentDTO.medicament_amount}"><br>
		제조 일자 : <input type = "date" name = "mandate" value = "${medicamentDTO.medicament_mandate}"><br>
		유통 기한 : <input type = "date" name = "exdate" value = "${medicamentDTO.medicament_exdate}"><br>
		<input type = "hidden" name = "store_code" value = "${medicamentDTO.store_code}"><br>
		<input type = "submit" value = "수정 완료">
	</form>
</body>
</html>