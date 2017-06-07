<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>약품 리스트</title>
	<link href="<c:url value="/resources/css/stylish-portfolio.css" />" rel="stylesheet" type="text/css"/>
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
				<h2>약품 리스트</h2>
				<hr>
			</div>
			<!-- 두번째 줄 -->
			<div class="col-lg-7 text-center">
			</div>
			<div class="col-lg-3 text-center">
				<div class="input-group">
					<form action="medicamentListForm.pet" method="get">
						<span class="input-group-btn">
							<input type="text" name="search" id= "search_box" class="form-control" placeholder="약품 이름 검색">
							<button class="btn btn-custom" type="button">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</form>
				</div>
			</div>
			<div class="col-lg-2 text-center">
				<button onclick = "location='medicamentInsertForm.pet'" class="btn btn-md btn-custom">약품 추가</button>
			</div>
		</div>
		
		<div class="row">
			<table width="100%" class="table table-striped table-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>약품 이름</th>
						<th>개수</th>
						<th>가격</th>
						<th>종류</th>
						<th>약품주기</th>
						<th>수정/삭제</th>
						<th>발주요청</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var ="var">
					<tr class = "board-custom">
						<td>${var.medicament_name}</td>
						<td>${var.medicament_amount} 개</td>
						<td>${var.medicament_cost} 원</td>
						<td>${var.medicament_category}</td>
						<td>
						<c:if test="${var.medicament_category == '주사'}">
							${var.medicament_cycle}개월
						</c:if>
						<c:if test="${var.medicament_category != '주사'}">
							해당없음
						</c:if>
						</td>
						<td class="form-inline">
							<button class="btn btn-md btn-custom"
							onclick = "location='medicamentUpdateForm.pet?medicament_code=${var.medicament_code}'">
							수정 <span class="glyphicon glyphicon-random"></span></button>
							<button class="btn btn-md btn-custom"
							onclick = "location='medicamentDeletePro.pet?medicament_code=${var.medicament_code}'">
							<span class="glyphicon glyphicon-trash"></span></button>
							<button class="btn btn-md btn-custom"
							onclick = "location='medicamentDetailForm.pet?medicament_code=${var.medicament_code}'">
							상세보기<span class="glyphicon glyphicon-list-alt"></span></button>
						</td>
						<td>
							<form action = "medicamentRequestPro.pet" method = "post" class="form-inline">
								<input type = "hidden" name = "medicament_code" value = "${var.medicament_code}"/>
								<input type = "hidden" name = "medicament_name" value = "${var.medicament_name}"/>
								<input type = "hidden" name = "medicament_cost" value = "${var.medicament_amount}"/>
								<input type = "hidden" name = "medicament_manDate" value = "${var.medicament_mandate}"/>
								<input type = "hidden" name = "medicament_exDate" value = "${var.medicament_exdate}"/>
								<input type = "hidden" name = "store_code" value = "${var.store_code}"/>
								<select name = "order_to" class="form-control">
								<se:authentication property="name" var="username"/>
								<c:forEach items = "${storeCodeList}" var = "storeList">
									<c:if test="${session_store_code != storeList}">
										<option value = "${storeList}">${storeList}</option>
									</c:if>
								</c:forEach>
								</select>
								<input type="number" min = "0" name="medicament_amount" class="form-control"/>
								<input class="btn btn-md btn-custom" type = "submit" value="요청하기"/>
							</form>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class = "row">
			<div class="col-lg-7">
			</div>
			<div class="form-inline col-lg-5">
				<ul class="pagination">
					<c:if test="${currentPageNum > '1'}">
					<li><a href="medicamentListForm.pet?pageNum=${currentPageNum-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					</c:if>
					<c:forEach begin="1" end="${page.pageTotalNum}" var="pageNum">
						<li><a href="medicamentListForm.pet?pageNum=${pageNum}">${pageNum}</a></li>
					</c:forEach>
					<c:if test="${page.pageTotalNum > currentPageNum}">
					<li><a href="medicamentListForm.pet?pageNum=${currentPageNum+1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>