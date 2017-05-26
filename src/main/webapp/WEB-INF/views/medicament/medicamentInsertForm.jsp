<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>약품 추가</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<form action = "medicamentInsertPro.pet" method = "post">
		약품 이름 : <input type = "text" name = "medicament_name"><br>
		약품 개수 : <input type = "number" min = "1" name = "medicament_amount"><br>
		약품 가격 : <input type = "text" name = "medicament_cost"><br>
		약품 종류 : <input type = "text" name = "medicament_category"><br>
		약품 주기 : <input type = "number" min = "0" name = "medicament_cycle"><br>
		제조 일자 : <input type = "date" name = "medicament_mandate"><br>
		유통 기한 : <input type = "date" name = "medicament_exdate"><br>
		<input type = "submit" value = "약품 추가">
	</form>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>