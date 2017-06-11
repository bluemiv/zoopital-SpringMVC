<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>진료 대기 동물</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>진료대기 리스트</h2>
				<hr>
			</div>
			<!-- 두번째 줄 -->
			<div class="col-lg-9 text-center">
			</div>
			<div class="col-lg-3 text-center">
				<div class="row">
					<div class="form-group col-xs-12">
						<input class = "btn btn-custom btn-md" type="button" onclick = "location='searchMyWaiting.pet'" value="담당환자만 보기">
					</div>
				</div>
			</div>
		</div>
	
		<div class="row">
			<table width="100%" class="table table-stripedtable-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>대기 번호</th>
						<th>담당 의사</th>
						<th>동물 이름</th>
						<th>동물 종류</th>
						<th>동물 성별</th>
						<th>나이(개월)</th>
						<th>접수 시간</th>
						<th>접수 내용</th>
						<th>지점</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach  items="${clist }" var="c">
					<tr class = "board-custom">
						<td>${c.waiting_num }</td>
						<td>${c.emp_name }</td>
						<td>${c.pet_name }</td>
						<td>${c.pet_type }</td>
						<td>${c.pet_sex }</td>
						<td>${c.pet_age }</td>
						<td>${c.petaccept_date }</td>
						<td>${c.petaccept_coments }</td>
						<td>${c.store_code }</td>
						<td>
							<button class = "btn btn-custom btn-md"
							onclick="location='historyinsert.pet?pet_code=${c.petaccept_petcode}&petaccept_code=${c.petaccept_code }&m_total_cost=0&treat_cost=0'">
							진료보기 <span class="glyphicon glyphicon-random"></span></button>
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