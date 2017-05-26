<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
<fieldset>
<legend>직원 목록</legend>

직원 이름 / 직원 코드

<hr>
	<c:forEach items="${emplist }" var="emp">
		${emp.emp_name } // ${emp.emp_code }
		<br>
	</c:forEach>
	
</fieldset>

<button onclick="location='empInsertForm.pet'">직원추가</button>

<fieldset>
<legend>직원 정보 변경(삭제/수정)</legend>
<form action="empUpdateDeleteForm.pet" method="post">
변경 할 직원 코드 입력<input type="text" name="emp_code"><br/>
<input type = "submit" value="검색">
</form>

</fieldset>

	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>