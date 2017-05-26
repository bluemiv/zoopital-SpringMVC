<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="layout/header.jsp"/>

	<!-- 컨텐츠 -->
	현재시간 : <span id="clock"></span><br>
	<button onclick= "location='medicament/medicamentListForm.pet'">약품 리스트</button>
	<br>
	<se:authorize access="hasRole('ROLE_SUPER_ADMIN')">
		<button onclick="location='store/selectAll.pet'">관리자 회원가입 목록</button>
		<br>
		<button onclick="location='store/inputForm.pet'">관리자 회원가입 페이지 입니다. </button>
	</se:authorize>
	<input type="button" value="동물정보입력" onclick="location='pet/writeForm.pet'">
	<br>
	<input type="button" value="리스트" onclick="location='pet/list.pet'"> 
	<br>
	<button onclick="location='emp/empListForm.pet'">직원보기</button>
	<br>
	<button onclick= "location='order/orderInfoForm.pet'">발주 내역</button>
	<br>
	<button  onclick="location='store/report.pet'">보고서 페이지 </button>
	<br>
	<button onclick="location='store/getReportList.pet'">보고서 리스트 보기</button>
	<br>
	<button onclick="location='shot/todayList.pet'">오늘의강아지</button>
	<a href = "j_spring_security_logout">로그아웃</a>
	<br>

	<!-- 푸터 파일 -->
	<jsp:include page="layout/footer.jsp"/>
</body>
</html>
