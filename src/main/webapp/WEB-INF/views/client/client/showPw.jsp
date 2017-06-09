<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<title>임시 비밀번호</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	
	<!-- custom css -->
	<link href="<c:url value="/resources/css/stylish-portfolio.css" />" rel="stylesheet" type="text/css"/>

	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/jeju.css">
    <style>
      body {
        font-family: 'Jeju Gothic', sans-serif;
        font-size: 48px;
      }
    </style>
</head>
<body>
	
	<div class = "container">
		<div class="row">
			<h1>임시비밀번호</h1>
			<hr>
		</div>
		<div class="row">
		<center>
			<h4>고객님의 임시 비밀번호는 <br><br>
			<font color="blue" style="font-weight:bold">${change_pw}</font>
			<br><br>입니다. 로그인 후 변경해주세요.</h4>
			<button class = "btn btn-md btn-custom" onclick = "javascript:window.close();">닫기</button>
		</center>
		</div>
	</div><br><br>
	
	
		
</body>
</html>