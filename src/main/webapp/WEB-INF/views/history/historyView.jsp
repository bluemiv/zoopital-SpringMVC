<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>목록 출력 가능??</h3>
	<c:forEach items="${hlist }" var="hlist">
		이름 : ${hlist.pethistory_petcode } <br>
		약품 : ${hlist.pethistory_medicine } <br>
		의견 : ${hlist.pethistory_coments } <br>
		시간 : ${hlist.pethistory_today } <br>
		<button onclick="location='historydelete.pet?key=${hlist.pethistory_key}'">삭제</button>
		<hr>
	</c:forEach>

</body>
</html>