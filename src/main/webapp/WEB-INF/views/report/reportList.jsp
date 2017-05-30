<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>   
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보고서 리스트</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<c:forEach items="${reportList}" var="list">
		보고서 번호 : ${list.report_code}<br>
		결재하는 사람 : ${list.report_reader}<br>
		작성자 : ${list.report_writer}<br>
		직위: 
		<c:if test="${list.report_position == 'doctor'}">의사</c:if>
		<c:if test="${list.report_position == 'worker'}">비정규직</c:if>
		<br>
		작성일: ${list.report_date}<br>
		보고내용: ${list.report_contents}<br>
		결재여부 : 
		<c:if test="${list.report_check == 'fail'}">
			미승인
		</c:if>
		<c:if test="${list.report_check == 'success'}">
			승인
		</c:if>
		<br>
		<se:authorize access="hasRole('ROLE_SUPER_ADMIN')">
			<c:if test = "${ list.report_check == 'success'}">
				<button onclick = "location='checkReport.pet?report_check=fail&report_code=${list.report_code}'">미승인</button>
			</c:if>
			<c:if test = "${ list.report_check == 'fail'}">
				<button onclick = "location='checkReport.pet?report_check=success&report_code=${list.report_code}'">승인</button>
			</c:if>
		</se:authorize>
		<se:authentication property="name" var="username"/>
		<c:if test = "${ username == list.report_writer}">
			<button onclick = "location='deleteReport.pet?report_code=${list.report_code}'">삭제</button>
			<button onclick = "location='updateReportForm.pet?report_code=${list.report_code}'">수정</button>
		</c:if>
		<hr>
	</c:forEach>

	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>