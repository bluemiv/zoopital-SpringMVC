<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
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
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<p>현재시간 : <span id="clock"></span></p>
			</div>
		</div>
	</div>
</body>
</html>