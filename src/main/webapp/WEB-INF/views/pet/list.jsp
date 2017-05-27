<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<title>동물 리스트</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>동물 리스트</h2>
				<hr>
			</div>
			<!-- 두번째 줄 -->
			<div class="col-lg-9 text-center">
			</div>
			<div class="col-lg-3 text-center">
				<div class="input-group">
					<form action="search.pet" method="get">
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
						<th>동물 이름</th>
						<th>동물 종류</th>
						<th>동물 성별</th>
						<th>나이(개월)</th>
						<th>전화번호</th>
						<th>지점</th>
						<th>수정/삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${ list }" var="list">
					<tr class = "board-custom">
						<td>${ list.pet_name }</td>
						<td>${ list.pet_type }</td>
						<td>${ list.pet_sex }</td>
						<td>${ list.pet_age }</td>
						<td>${ list.pet_phone }</td>
						<td>${ list.store_code }</td>
						<td>
							<input type="button" value="수정" class = "btn btn-custom btn-md"
							onclick="location='updateForm.pet?pet_code=${list.pet_code}'">
							<input type="button" value="삭제" class = "btn btn-custom btn-md"
							onclick="location='delete.pet?pet_code=${list.pet_code}'">
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