<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<h3>자세히 페이지</h3>
 	
	<c:forEach items="${ list }" var="list">
	${ list.shot_name }<br>
	${ list.shot_cycle}<br>
	${ list.pet_code }<br>
	${ list.shot_date }<br>
	${ list.shot_must }<br>
	<hr>
	</c:forEach> 
	
	<input type="button" value="등록" onclick="location='shotListForm.pet'">
</body>
</html>