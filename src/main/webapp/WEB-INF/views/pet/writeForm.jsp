<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h3>동물 등록</h3>
	<hr>
	<form action="writePro.pet" method="post">
		이름:<input type="text" name="pet_name"><br>
		종류:<input type="text" name="pet_type"><br>
		성별:
		male<input type="radio" name="pet_sex" value="male">
		female<input type="radio" name="pet_sex" value="female"><br>
		나이:<input type="text" name="pet_age"><br>
		주인이름:<input type="text" name="pet_owner"><br>	
		전화번호:<input type="tel" name="pet_phone"><br>
		<input type="submit" value="확인"><br>
	</form>
</body>
</html>