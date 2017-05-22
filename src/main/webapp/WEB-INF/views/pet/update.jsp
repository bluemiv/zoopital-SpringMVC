<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h3>동물정보 수정</h3>
	<hr>
	<form action="updatePro.pet" method="post">
		<c:forEach var="list" items="${ list }">
		이름:<input type="text" name="pet_name"  value="${list.pet_name}"><br>
		종류:<input type="text" name="pet_type" value="${list.pet_type}"><br>
		성별:
		<c:if test="${ list.pet_sex == 'male' }">
		male<input type="radio" name="pet_sex" value="male" checked="checked">
		female<input type="radio" name="pet_sex" value="female"><br>
		</c:if>
		<c:if test="${ list.pet_sex == 'female' }">
		male<input type="radio" name="pet_sex" value="male">
		female<input type="radio" name="pet_sex" value="female" checked="checked"><br>
		</c:if>
		나이:<input type="text" name="pet_age" value="${list.pet_age}"><br>
		전화번호:<input type="tel" name="pet_phone"  value="${ list.pet_phone}"><br>
		지점:<input type="text" name="store_code" value="${list.store_code}"><br>
		<input type="hidden" name="pet_code" value="${list.pet_code }">
		<input type="submit" value="수정"><br>
		</c:forEach>
	</form>
</body>
</html>