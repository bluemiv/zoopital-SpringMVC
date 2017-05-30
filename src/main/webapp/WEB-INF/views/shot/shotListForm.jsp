<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	폼페이지
	<form action="shotListPro.pet" method="post">
		
		주사이름:
		<select name="shot_name">
		<c:forEach items="${ list }" var="list">
			<option value="${ list.medicament_name }">${list.medicament_name}</option>
		</c:forEach>
		</select><br>
		주사맞은날: <input type="date" name="shot_date"><br>
		
		
		
		
	<input type="submit" value="확인">	
		
		
	</form>
</body>
</html>