<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
	<!-- 콘텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>예약 내역</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<table width="100%" class="table table-stripedtable-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>예약 번호</th>
						<th>예약 날짜</th>
						<th>예약 시간</th>
						<th>담당</th>
						<th>예약 내용</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${passReservationList}" var="reserve">
					<tr class = "board-custom">
						<td>${reserve.reserve_code}</td>
						<td>${reserve.reserve_date}</td>
						<td>${reserve.reserve_start_time}:00 ~ ${reserve.reserve_end_time}:00</td>
						<td>${reserve.emp_name}</td>
						<td>${reserve.reserve_contents}</td>
						<td>
							<!-- 방문 완료 = 푸른색  -->
							<c:if test="${'Visited' eq reserve.reserve_status}">
							<font color="blue" style="font-weight:bold"> 방문 완료 </font>
							</c:if>
							<!-- 미방문 = 붉은색-->
							<c:if test="${'NotVisited' eq reserve.reserve_status}">
							<font color="red" style="font-weight:bold"> 미방문 </font>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>

</body>
</html>