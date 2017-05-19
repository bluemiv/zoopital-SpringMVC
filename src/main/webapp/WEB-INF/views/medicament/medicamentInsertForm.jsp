<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>약품 추가</title>
</head>
<body>
	<form action = "medicamentInsertPro.pet" method = "post">
		약품 이름 : <input type = "text" name = "medicament_name"><br>
		약품 개수 : <input type = "number" min = "1" name = "medicament_amount"><br>
		약품 가격 : <input type = "text" name = "medicament_cost"><br>
		제조 일자 : <input type = "date" name = "mandate"><br>
		유통 기한 : <input type = "date" name = "exdate"><br>
		<input type = "submit" value = "약품 추가">
	</form>
</body>
</html>