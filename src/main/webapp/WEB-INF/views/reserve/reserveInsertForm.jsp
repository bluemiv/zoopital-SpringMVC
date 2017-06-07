<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<form action="reserveInsertForm2.pet" method="post">

<h3>동물 이름: ${petInfo.pet_name}</h3>
<br>
보호자 연락처: ${petInfo.pet_phone}
<br><br>

<fieldset>
	<legend>직원 선택</legend>
	<c:forEach items="${empList}" var="emp">
		<input type="radio" name="emp_name" value="${emp.emp_name}">
		${emp.emp_name} 
		<br>
	</c:forEach>
</fieldset>
	<hr>
<fieldset>
		<legend>날짜 선택</legend>
	<input type="date" name="reserve_date" />
</fieldset>
<br>
	<input type="hidden" name=pet_code value="${petInfo.pet_code}">
	<input type = "submit" value="다음>">
</form>



</body>
</html>