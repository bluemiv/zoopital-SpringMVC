<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
</head>
<body>
<c:if test="${param.err != null}">
<h1>Error</h1>
</c:if>
<se:authorize access="isAnonymous()">
	<c:url value="/j_spring_security_check" var = "loginURL"/>
	<form action="${loginURL}" method="post">
		ID : <input type="text" name="username" /><br>
		Password : <input type="password" name="password" /><br>
		<input type="submit" value="로그인" />
	</form>
</se:authorize>
<se:authorize access = "isAuthenticated()">
	<button onclick= "location='j_spring_security_logout'">로그아웃</button>
</se:authorize>
</body>
</html>