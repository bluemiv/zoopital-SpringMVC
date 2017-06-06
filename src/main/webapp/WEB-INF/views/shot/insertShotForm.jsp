<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="insertShotPro.pet">
	<c:forEach items="${ list }" var="list">
	<input type="hidden" value="${ list.shot_name }" name="shot_name" >
	<input type="hidden" value="${ list.shot_cycle }" name="shot_cycle" >
	<input type="hidden" value="${ list.pet_code }" name="pet_code" >
	<input type="hidden" value="${ list.shot_petName }" name="shot_petName">
	<input type="submit" value="확인">
	</c:forEach>
	</form>
</body>
</html>