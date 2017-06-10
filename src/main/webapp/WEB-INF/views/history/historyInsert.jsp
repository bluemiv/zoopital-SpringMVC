<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h3>다른 강쥐 검색 할래??</h3>
	<form action="searchforhistory.pet" method="post">
		<input type="text" name="petname">
		<input type="submit" value="검색!!">
	</form>
	<hr>
	<h3>이중에 어느 강쥐에 대해 등록할래?</h3>
	<c:forEach items="${plist}" var="p">
		${p.pet_name} ///// ${p.pet_code } &nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick = "location='historyinsert.pet?pet_code=${p.pet_code}'">입력!</button><br>
	</c:forEach>
</body>
</html>