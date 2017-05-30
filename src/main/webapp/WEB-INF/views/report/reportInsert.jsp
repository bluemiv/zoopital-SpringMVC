<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h1>업무 보고서</h1>
	<form action="reportPro.pet">
		<div>
			결재하는 사람 : 
			<select name="report_reader">
				<c:forEach items= "${storeCodeList}" var = "storeList">
				<option value = "${storeList}">${storeList}</option>
				</c:forEach>
			</select>
			직위:
			<select name="report_position">
				<option value = "doctor">의사</option>
				<option value = "worker">비정규직</option>
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