<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>   
    
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
		병원명: ${list.report_storeName }
		직위: ${list.report_position}<br>
		작성일: ${list.report_date }<br>
		작성자: ${list.report_writer }<br>
		보고내용: ${list.report_contents }<br>
		<hr>
	</c:forEach>

	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>