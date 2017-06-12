<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지점목록</title>
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
				<h2>지점 목록</h2>
				<hr>
			</div>
			<!-- 두번째 줄 -->
			<div class="col-lg-8 text-center">
			</div>
			<div class="col-lg-4 text-center">
				<div class="input-group">
					<form action="search.pet" method="post">
						<span class="input-group-btn">
							<input type="text" name="store_name" id= "search_box" class="form-control" placeholder="지점 이름 검색">
							<button class="btn btn-custom" type="button">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</form>
				</div>
			</div>
		</div>
		
		<div class="row">
			<table width="100%" class="table table-striped table-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>지점 코드</th>
						<th>지점 이름</th>
						<th>관리비</th>
						<th>급여</th>
						<th>수입</th>
						<th>임대비</th>
						<th>정규직</th>
						<th>비정규직</th>
						<th>가입날짜</th>
						<th>권한</th>
						<th>기타</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach  items="${adminList}" var="list">
					<tr class = "board-custom">
						<td>${list.store_code}</td>
						<td>${list.store_name}</td>
						<td>${list.store_cost}원</td>
						<td><font color="red">${list.store_payment}</font>원</td>
						<td><font color="blue">${list.store_income}</font>원</td>
						<td>${list.store_rentCost}원</td>
						<td style="text-align : center;">${list.store_doctor}명</td>
						<td style="text-align : center;">${list.store_worker}명</td>
						<td>${list.store_date }</td>
						<td>
						<c:if test="${list.store_role == 'ROLE_SUPER_FULL'}">
							본사
						</c:if>
						<c:if test="${list.store_role == 'ROLE_FULL'}">
							지점
						</c:if>
						</td>
						<td>
							<center>
							<button onclick = "location='adminUpdate.pet?store_code=${list.store_code}'"
							class="btn btn-md btn-custom">수정</button>
							<button onclick = "location='deletePro.pet?store_code=${list.store_code}'"
							class="btn btn-md btn-custom">삭제</button>
							<br><br>
							<button onclick = "location='storeInfoRefresh.pet?store_code=${list.store_code}'"
							class="btn btn-md btn-custom">정보갱신</button>
							</center>
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
					<li><a href="selectAll.pet?pageNum=${currentPageNum-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					</c:if>
					<c:forEach begin="1" end="${totalPageNum}" var="pageNum">
						<li><a href="selectAll.pet?pageNum=${pageNum}">${pageNum}</a></li>
					</c:forEach>
					<c:if test="${totalPageNum > currentPageNum}">
					<li><a href="selectAll.pet?pageNum=${currentPageNum+1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>