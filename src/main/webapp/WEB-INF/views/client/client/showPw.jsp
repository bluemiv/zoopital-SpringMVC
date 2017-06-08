<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<title>임시 비밀번호</title>
</head>
<body>

	<div center>
		고객님의 임시 비밀번호는<br><br>
		<font color="blue" style="font-weight:bold"> 
		${change_pw}</font><br><br>
		입니다.<br>
		로그인 후 변경해주세요.
	</div>
	<button onclick = "javascript:window.close();">닫기</button>
		
</body>
</html>