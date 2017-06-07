<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>처방전 히스토리</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>처방전 히스토리</h2>
				<hr>
			</div>
			<!-- 두번째 줄 -->
			<div class="col-lg-9 text-center">
			</div>
			<div class="col-lg-3 text-center">
				<div class="input-group">
					<form action="tt.pet" method="get">
						<span class="input-group-btn">
							<input class = "form-control" type="text" size="30" name="search" placeholder="이름으로 검색">
							<button class="btn btn-custom" type="button">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</form>
				</div>
			</div>
		</div>
	
		<div class="row">
			<table width="100%" class="table table-stripedtable-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>No.</th>
						<th>동물 이름</th>
						<th>동물 종류</th>
						<th>나이(개월)</th>
						<th>동물 성별</th>
						<th>진료 날짜</th>
						<th>지점</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach  items="${hlist }" var="h">
					<tr class = "board-custom">
						<td>${h.pethistory_key }</td>
						<td>${h.pet_name }</td>
						<td>${h.pet_type }</td>
						<td>${h.pet_age }</td>
						<td>${h.pet_sex }</td>
						<td>${h.pethistory_today }</td>
						<td>${h.store_code }</td>
						<td>
							<button class = "btn btn-custom btn-md"
							onclick="location='tt.pet'">
							수정 <span class="glyphicon glyphicon-random"></span></button>
							<button class = "btn btn-custom btn-md"
							onclick="location='tt.pet'">
							<span class="glyphicon glyphicon-trash"></span></button>
							<button class = "btn btn-custom btn-md"
							onclick="location='tt.pet'">
							상세보기<span class="glyphicon glyphicon-list-alt"></span></button>
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