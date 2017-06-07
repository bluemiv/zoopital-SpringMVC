<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일일매출</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>일일 매출</h2>
				<hr>
			</div>
			<!-- 두번째 줄 -->
			<div class="col-lg-9 text-center">
			</div>
			<div class="col-lg-3 text-center">
			</div>
		</div>
	
		<div class="row">
			<table width="100%" class="table table-stripedtable-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>No.</th>
						<th>날짜</th>
						<th>약품 수익</th>
						<th>진료 수익</th>
						<th>총 수익</th>
						<th>지출</th>
						<th>순 수익</th>
						<th>지점</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach  items="${slist }" var="s">
					<tr class = "board-custom">
						<td>${s.saleslog_key }</td>
						<td>${s.saleslog_date }</td>
						<td>${s.saleslog_m_income }</td>
						<td>${s.saleslog_t_income }</td>
						<td>${s.saleslog_income }</td>
						<td>${s.saleslog_spending }</td>
						<td>${s.saleslog_net_income }</td>
						<td>${s.store_code }</td>
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