<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script>
	$(function(){
		$(".datepicker").datepicker();
	});
	
</script>

</head>
<body>
<form action="reserveInsertForm2.pet" method="post">

<fieldset>
	<legend>직원 선택</legend>
	<c:forEach items="${empList}" var="emp">
		<input type="radio" name="emp_name" value="${emp.emp_name}">
		${emp.emp_name} 
		<br>
	</c:forEach>
	<hr>
	<input type = "submit" value="다음>">
</fieldset>
</form>



</body>
</html>