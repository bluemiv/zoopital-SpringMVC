<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<script>
		function printTime() {
			var clock = document.getElementById("clock"); // 출력할 장소 선택
			var now = new Date(); // 현재시간
			var nowTime = now.getFullYear() + "년" + (now.getMonth() + 1) + "월"
					+ now.getDate() + "일" + now.getHours() + "시" + now.getMinutes()
					+ "분" + now.getSeconds() + "초";
			clock.innerHTML = nowTime; // 현재시간을 출력
			setTimeout("printTime()", 1000); // setTimeout(“실행할함수”,시간) 시간은1초의 경우 1000
		}
		window.onload = function() { // 페이지가 로딩되면 실행
			printTime();
		}
	</script>
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
	<button onclick="location='history/selectallhistory.pet'">히스토리 보기</button>
	<br>
	<button onclick="location='history/serarchview.pet'">히스토리 작성</button>
	<br>
	<button onclick="location='history/script.pet'">스크립트 테스트</button>
	<br>
	<button onclick="location='history/script2.pet'">스크립트 테스트2</button>
	<br>
	<a href = "j_spring_security_logout">로그아웃</a>
</body>
</html>
