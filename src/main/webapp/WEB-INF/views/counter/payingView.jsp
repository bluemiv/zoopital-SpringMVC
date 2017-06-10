<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수납</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>수납대기 리스트</h2>
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
						<th>대기 번호</th>
						<th>동물 이름</th>
						<th>동물 종류</th>
						<th>동물 성별</th>
						<th>나이(개월)</th>
						<th>방문 시간</th>
						<th>진료 시간</th>
						<th>지점</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach  items="${clist }" var="c">
					<tr class = "board-custom">
						<td>${c.waiting_num }</td>
						<td>${c.pet_name }</td>
						<td>${c.pet_type }</td>
						<td>${c.pet_sex }</td>
						<td>${c.pet_age }</td>
						<td>${c.petaccept_date }</td>
						<td>${c.pethistory_today }</td>
						<td>${c.store_code }</td>
						<td>
							<button class="btn btn-md btn-custom"
							onclick = "location='payingDetail.pet?pethistory_key=${c.pethistory_key}&petaccept_code=${c.petaccept_code }'">
							수납정보<span class="glyphicon glyphicon-list-alt"></span></button>
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