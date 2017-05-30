<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>보고서 수정</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<h1>업무 보고서</h1>
	<form action="updateReportPro.pet" method = "post">
		<div>
		<input type = "hidden" name = "report_code" value="${reportDTO.report_code}"/>
			결재하는 사람:
			<select name="report_reader">
				<c:forEach items= "${storeCodeList}" var = "storeList">
					<c:if test="${reportDTO.report_reader == storeList}">
						<option selected="selected" value = "${storeList}">${storeList}</option>
					</c:if>
					<c:if test="${reportDTO.report_reader != storeList}">
						<option value = "${storeList}">${storeList}</option>
					</c:if>
				</c:forEach>
			</select><br>
			직위:
			<select name="report_position">
			<c:if test="${reportDTO.report_position == 'doctor'}">
				<option selected="selected" value = "doctor">의사</option>
				<option value = "worker">비정규직</option>
			</c:if>
			<c:if test="${reportDTO.report_position == 'worker'}">
				<option value = "doctor">의사</option>
				<option selected="selected" value = "worker">비정규직</option>
			</c:if>
			</select>
			<hr>
			보고내용: <textarea rows="5" cols="30" name="report_contents" >${reportDTO.report_contents}</textarea><br><hr>
		</div>
		<div>
			<input type="submit"  value="작성완료">
		</div>
	</form>

	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>