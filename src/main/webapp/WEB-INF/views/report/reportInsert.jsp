<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
<title>보고서</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<se:authentication property="name" var="username"/>
	<h1>업무 보고서</h1>
	<form action="reportPro.pet">
		<div>
			보고받는 사람 : 
			<select name="report_reader">
				<c:forEach items= "${empFullList}" var = "empList">
				<c:if test="${username != empList.emp_code}">
				<option value = "${empList.emp_code}">${empList.emp_code}</option>
				</c:if>
				</c:forEach>
			</select>
			작성자 직급:
			<select name="report_position">
			<se:authorize access="hasAnyRole('ROLE_FULL', 'ROLE_PART')">
				<option value = "ROLE_FULL">정규직</option>
				<option value = "ROLE_PART">비정규직</option>
			</se:authorize>
			<se:authorize access="hasAnyRole('ROLE_SUPER_FULL', 'ROLE_SUPER_PART')">
				<option value = "ROLE_SUPER_FULL">정규직</option>
				<option value = "ROLE_SUPER_PART">비정규직</option>
			</se:authorize>
			</select>
			<hr>
			보고내용: <textarea rows="5" cols="30" name="report_contents"></textarea><br><hr>
		</div>
		<div>
			<input type="submit"  value="작성완료">
		</div>
	</form>

	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>