<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약관리</title>
<script type="text/javascript">
	function response(){
		var response = confirm("방문 확인하시겠습니까? ")
		var value = document.getElementById("visited").value;
		alert("value");
		/* if(response){	
			window.location = "reserveVisited.pet?reserve_code="+value;
		} */		
	}
	function response2(){
		var response2 = confirm("해당 예약 미방문 처리 하시겠습니까? ")
		if(response){
			window.location = "reserveVisited.pet"
		}		
	}

</script>

</head>
<body>
	<h3>예약 내역</h3>
	<hr>
	
	날짜 선택:
	<form action ="dateSelectedList.pet" method="post">
		<input type="date" name = "reserve_date"> 	
		<input type="submit" value="날짜선택 완료">
	</form><br><hr><br>
	
	
	<c:forEach items="${reserveList}" var="reserve">
		예약 번호: ${reserve.reserve_code}	<br>
		예약 날짜: ${reserve.reserve_date}<br>
		예약 시간: ${reserve.reserve_start_time}:00 ~
				${reserve.reserve_end_time}:00<br>
		담당: ${reserve.emp_name} <br>
		예약 내용: ${reserve.reserve_contents} <br>
		<button id = "visited" name="visited" onclick = "response()" value = "${reserve.reserve_code}">방문 확인</button>
		<button id = "notvisited" name = "notvisited" onclick = "response2()" value = "${reserve.reserve_code}">미방문</button>
		<button id = "deleteReservation" name = "deleteReservation" value = "${reserve.reserve_code}">예약 취소</button>
		<hr>
	
	</c:forEach>
	<br>
	<button onclick="location='reserveInsertForm.pet'">예약내역 추가</button>
	<br>
	<button onclick="location='reserveUpdateForm.pet'">예약 변경</button>
	<br>

</body>
</html>