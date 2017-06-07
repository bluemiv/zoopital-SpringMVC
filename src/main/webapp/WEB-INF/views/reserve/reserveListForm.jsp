<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약관리</title>
<script type="text/javascript">


	//자바스크립트로 해야 컨펌창을 띄우고 넘길 수 있는데....
	//자바스크립트로 하면 value값이 제대로 안넘어가서 안된다 ㅠㅠㅠ 왜지???????????
	function response(){
		var response = confirm("방문 확인하시겠습니까? ");
		var value = document.getElementById("visited").value;
		alert(value);
		 if(response){	
			document.frm2.submit();
		} 
	}
	function response2(){
		var response2 = confirm("해당 예약 미방문 처리 하시겠습니까? ")
		if(response){
			window.location = "reserveVisited.pet?reserve_code="+document.getElementById("notvisited").value;
		}		
	}

	function delreserve(){
		var delreserve = confirm("해당 예약 취소 처리 하시겠습니까? ")
		if(response){
			window.location = "reserveDeletePro.pet?reserve_code="+document.getElementById("deleteReservation").value;
			
		}		
	}
</script>

</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
	<!-- 콘텐츠 -->
	<h3>예약 내역</h3>
	<hr>
	
	날짜 선택:
	<form action ="passReservationList.pet" method="post">
		<input type="date" name = "reserve_date"> 	
		<input type="submit" value="날짜선택 완료">
	</form><br><hr><br>
	
	
	<c:forEach items="${reserveList}" var="reserve">
		예약 번호: ${reserve.reserve_code}	<br>
		예약 동물명: ${reserve.pet_name}<br>
		보호자 연락처: ${reserve.pet_phone }<br>
		예약 날짜: ${reserve.reserve_date}<br>
		예약 시간: ${reserve.reserve_start_time}:00 ~
				${reserve.reserve_end_time}:00<br>
		담당: ${reserve.emp_name} <br>
		예약 내용: ${reserve.reserve_contents} <br>
		
		<button class = "btn btn-custom btn-md" name="visited" onclick = "location='reserveVisited.pet?visited=${reserve.reserve_code}'">방문 확인</button>
		<button class = "btn btn-custom btn-md" name = "notvisited" onclick = "location='reserveVisited.pet?notvisited=${reserve.reserve_code}'">미방문</button>
		<button class = "btn btn-custom btn-md" id = "deleteReservation" name = "deleteReservation" onclick = "location='reserveDeletePro.pet?reserve_code=${reserve.reserve_code}'">예약 취소</button>
		<form action="reserveUpdateForm.pet" method="post">
			<input type="hidden" name="reserve_code" value="${reserve.reserve_code}">
			<input type="submit" class = "btn btn-custom btn-md" value="예약 변경">
		</form>
		<br>
		<hr>
	</c:forEach>
	<br>
	<button class = "btn btn-custom btn-md" onclick="location='passReservationList.pet'">지난 예약 보기</button>

</body>
</html>