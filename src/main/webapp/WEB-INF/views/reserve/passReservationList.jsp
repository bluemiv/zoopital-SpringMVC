<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
	<!-- 콘텐츠 -->
	<h3>예약 내역</h3>
	<hr>
	<!-- 
	날짜 선택:
	<form action ="dateSelectedList.pet" method="post">
		<input type="date" name = "reserve_date"> 	
		<input type="submit" value="날짜선택 완료">
	</form><br><hr><br> -->
	
	
	<c:forEach items="${passReservationList}" var="reserve">
		예약 번호: ${reserve.reserve_code}	<br>
		예약 날짜: ${reserve.reserve_date}<br>
		예약 시간: ${reserve.reserve_start_time}:00 ~
				${reserve.reserve_end_time}:00<br>
		담당: ${reserve.emp_name} <br>
		예약 내용: ${reserve.reserve_contents} <br>
		상태:
		
		<!-- 방문 완료는 푸른색, 미방문은 붉은색으로 표시! -->
		<c:if test="${'Visited' eq reserve.reserve_status}">
		<font color="blue" style="font-weight:bold"> 방문 완료 </font>
		</c:if>
		
		<c:if test="${'NotVisited' eq reserve.reserve_status}">
		<font color="red" style="font-weight:bold"> 미방문 </font>
		</c:if>
		
		<hr>
		
	</c:forEach>


</body>
</html>