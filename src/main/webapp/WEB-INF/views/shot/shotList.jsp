<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
	
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>이 달의 예방접종 리스트</h2>
				<hr>
			</div>
			<!-- 두번째 줄 -->
			<div class="col-lg-9 text-center">
			</div>
			<div class="col-lg-3 text-center">
				<div class="input-group">
				</div>
			</div>
		</div>
	
		<div class="row">
			<table width="100%" class="table table-stripedtable-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>주사</th>
						<th>주사 주기</th>
						<th>펫 코드</th>
						<th>펫 이름</th>
						<th>맞은 날짜</th>
						<th>맞아야 할 날짜</th>
						<th>보호자 연락처</th>
					</tr>
				</thead>
				<tbody>
	
	<c:forEach items="${ list }" var="list" >
 	<c:if test="${  currentTime <= list.shot_must && list.shot_must <= lastDay }">
	<tr class = "board-custom">
	<td>${ list.shot_name }</td>
	<td>${ list.shot_cycle }</td>
	<td>${ list.pet_code }</td>
	<td>펫 이름(수정)</td>
	<td>${ list.shot_date }</td>
	<td>${ list.shot_must }</td>
	<td>보호자 연락처(수정)</td>
	</tr>
	</c:if> 
	</c:forEach>
	</tbody>
	</table>
	</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>