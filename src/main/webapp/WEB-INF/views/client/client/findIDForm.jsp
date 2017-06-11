<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<head>
<title>Id 찾기</title>
<link href="<c:url value="/resources/css/stylish-portfolio.css" />" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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
</head>
<body>
	<div class="container">
		<div class = "row">
			<div class = "col-xs-12">
				<h2>아이디 찾기</h2>
				<hr>
			</div>
		</div>
		<form action="findIDPro.pet" method="post">
			<div class = "row">
				<div class = "col-xs-12">
					<label for="name" >이름 입력</label>
					<input required="required" name="client_name" class = "form-control" type="text" >
				</div>
			</div>
			<br>
			<br>
			<div class = "row">
				<div class = "col-xs-12">
					<label for="name" >가입 시 등록한 email 입력</label>
					<input required="required" type="text" class ="form-control" name="client_email">
					<br>
				</div>
			</div>
			<div class = "row">
				<div class="col-xs-12">
					<input class = "btn btn-md btn-custom" type="submit" value="찾기">
				</div>
			</div>
		</form>
		
		
	</div>



</body>
</html>