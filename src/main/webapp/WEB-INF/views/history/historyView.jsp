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
	<h3>목록 출력 가능??</h3>
	<c:forEach items="${hlist }" var="hlist">
		동물코드 : ${hlist.pethistory_petcode } <br>
		동물이름 : ${hlist.pethistory_name } <br>
		약품처방 : ${hlist.pethistory_medicine } <br>
		의사의견 : ${hlist.pethistory_coments } <br>
		진료날짜 : ${hlist.pethistory_today } <br>
		<button onclick="location='historydelete.pet?key=${hlist.pethistory_key}'">삭제</button>
		<hr>
	</c:forEach>

</body>
</html>