<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend>직원 목록</legend>

<hr>
		<form action="empUpdateDeletePro.pet" method="post">
			<c:forEach items="${selectEmpList}" var="emp">
	
		이름: <input type="text" name="emp_name" value="${ emp.emp_name }">
				<br />
		코드: <input type="text" name="emp_code" value="${ emp.emp_code }" readonly="readonly">
				<br />
		나이: <input type="text" name="emp_age" value="${ emp.emp_age }">
				<br />
		전화번호: <input type="text" name="emp_tel" value="${ emp.emp_tel }">
				<br />
		급여: <input type="text" name="emp_pay" value="${ emp.emp_pay }">
				<br />
		지점: <input type="text" name="store_code" value="${ emp.store_code }">
				<br />
				
				<input type="submit" name="update" value="수정">
				<input type="button" name="delete" value="삭제">
				<hr>

			</c:forEach>
		</form>

	</fieldset>

</body>
</html>