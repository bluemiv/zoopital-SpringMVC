<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약관리</title>
</head>
<body>
	<h3>예약 내역</h3>
	<hr>
	
	<c:forEach items="${reserveList}" var="reserve">
		예약 번호: ${reserve.reserve_code}	<br>
		예약 날짜: ${reserve.reserve_date} <br>
		담당: ${reserve.emp_name} <br>
		예약 내용: ${reserve.reserve_contents} <br>
		<hr>
	
	</c:forEach>
	<br>

	<button onclick="location='reserveInsertForm.pet'">예약내역 추가</button>
	<br>
	<button onclick="location='reserveUpdateForm.pet'">예약 변경</button>
	<br>
	<button onclick="location='reserveDeleteForm.pet'">예약 취소</button>
	<br>
	

</body>
</html>