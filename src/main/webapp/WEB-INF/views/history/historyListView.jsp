<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>처방전 히스토리</title>
<script type="text/javascript">
	function delHistory(param){

		if(!confirm("삭제하겠습니까?")){
			/* history.go( -1 ); */
			return;
		}else{
			var route = "historydelete.pet?key=" + param;
			location.href=route;
		}
	}
</script>
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
				<div class="row">
					<div class="form-group col-xs-12">
						<input class = "btn btn-custom btn-md" type="button" onclick = "location='searchMyHistory.pet'" value="담당환자만 보기">
					</div>
				</div>
				<div class="input-group">
					<form action="searchHistory.pet" method="get">
						<span class="input-group-btn">
							<input class = "form-control" type="text" size="30" name="petname" placeholder="이름으로 검색">
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
						<th>담당 의사</th>
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
						<td>${h.emp_name }</td>
						<td>${h.pet_name }</td>
						<td>${h.pet_type }</td>
						<td>${h.pet_age }</td>
						<td>${h.pet_sex }</td>
						<td>${h.pethistory_today }</td>
						<td>${h.store_code }</td>
						<td>
							<button class = "btn btn-custom btn-md"
							onclick="location='modifyHistory.pet?pethistory_key=${h.pethistory_key}'">
							수정 <span class="glyphicon glyphicon-random"></span></button>
							<button class = "btn btn-custom btn-md"
							onclick="delHistory(${h.pethistory_key})">
							<span class="glyphicon glyphicon-trash"></span></button>
							<button class = "btn btn-custom btn-md"
							onclick="location='historyDetail.pet?pethistory_key=${h.pethistory_key}'">
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