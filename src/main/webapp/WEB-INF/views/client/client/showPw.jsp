<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<title>임시 비밀번호</title>
<style>
	.btn {
	line-height:0em;
	margin-top: 40px;
	width: 130px;
	height: 30px;
	border-radius: 30px;
	background: #336799;
	text-align: center;
	border:0px solid #fff;
	border-bottom: 3px solid rgba(255, 255, 255, 0.5);
	color:#fff;
}
</style>
</head>
<body bgcolor="#dbe9ef" onload="javascript: window.resizeTo(400,300)">
	<center>
	<div>
		고객님의 임시 비밀번호는<br><br>
		<font color="blue" style="font-weight:bold"> 
		${change_pw}</font><br><br>
		입니다.<br>
		로그인 후 변경해주세요.
	</div><br><br>
	<button class = "btn" onclick = "javascript:window.close();">닫기</button>
	</center>
		
</body>
</html>