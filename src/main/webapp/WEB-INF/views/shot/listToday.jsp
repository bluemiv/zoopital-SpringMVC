<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<script>
		function printTime() {
			var clock = document.getElementById("clock"); // 출력할 장소 선택
			var now = new Date(); // 현재시간
			var nowTime = now.getFullYear() + "년" + (now.getMonth() + 1) + "월"
					+ now.getDate() + "일";
			clock.innerHTML = nowTime; // 현재시간을 출력
			setTimeout("printTime()", 1000); // setTimeout(“실행할함수”,시간) 시간은1초의 경우 1000
		}
		window.onload = function() { // 페이지가 로딩되면 실행
			printTime();
		}
	</script>
</head>
<body>

	<font style="color: blue;">
	TODAY >> <span id="clock"></span><br></font>
	<c:if test="">
		<c:forEach items="${ list }" var="list" >
		강아지이름: ${ list.pet_name }
		예방접종: ${ list.shot_name }
		접종날짜: ${ list.shot_must }
		주인이름: ${ list.pet_owner }
		연락처: ${ list.pet_phone }
		</c:forEach>
	</c:if>
	
</body>
</html>