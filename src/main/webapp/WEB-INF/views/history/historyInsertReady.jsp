<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h3>입력시작 할 강쥐 이름 검색부터 해볼까?</h3>
	<form action="searchforhistory.pet" method="post">
		<input type="text" name="petname">
		<input type="submit" value="검색!!">
	</form>
</body>
</html>