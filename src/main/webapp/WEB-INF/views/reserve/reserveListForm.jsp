<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<title>예약관리</title>
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
			<!-- 두번째 줄 -->
			<div class="col-lg-8 text-center">
			</div>
			<div class="col-lg-4 text-center">
				<div class="input-group">
					<form action ="passReservationList.pet" method="post">
						<span class="input-group-btn">
							<input type="date" name = "reserve_date" class="form-control">
							<button class="btn btn-custom" type="button">
								날짜 검색<i class="glyphicon glyphicon-search"></i>
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
						<th>예약 번호</th>
						<th>예약 동물명</th>
						<th>보호자 연락처</th>
						<th>예약 날짜</th>
						<th>예약 시간</th>
						<th>담당</th>
						<th>예약 내용</th>
						<th>수정/삭제</th>
						<th>(미)방문</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${reserveList}" var="reserve">
					<tr class = "board-custom">
						<td>${reserve.reserve_code}</td>
						<td>${reserve.pet_name}</td>
						<td>${reserve.pet_phone }</td>
						<td>${reserve.reserve_date }</td>
						<td>${reserve.reserve_start_time}:00 ~ ${reserve.reserve_end_time}:00</td>
						<td>${reserve.emp_name}</td>
						<td>${reserve.reserve_contents}</td>
						<td>
							<form action="reserveUpdateForm.pet" method="post" class = "form-inline">
								<button class = "btn btn-custom btn-md" id = "deleteReservation" name = "deleteReservation"
								onclick = "location='reserveDeletePro.pet?reserve_code=${reserve.reserve_code}'">
								예약 취소
								</button>
								<input type="hidden" name="reserve_code" value="${reserve.reserve_code}">
								<input type="submit" class = "btn btn-custom btn-md" value="예약 변경">
							</form>
						</td>
						<td>
							<!-- 방문 -->
							<button type="button" class = "btn btn-custom btn-md" data-toggle="modal" data-target="#visitor">
								방문
							</button>
							<div class="modal fade" id="visitor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel">방문 확인</h4>
										</div>
										<div class="modal-body">
											방문 처리 하시겠습니까?
										</div>
										<div class="modal-footer">
											<button type="button" class = "btn btn-custom btn-md" data-dismiss="modal">취소</button>
											<button class = "btn btn-custom btn-md" name="visited" onclick = "location='reserveVisited.pet?visited=${reserve.reserve_code}'">방문</button>
										</div>
									</div>
								</div>
							</div><!-- 모달 끝 -->
							<!-- 미방문 -->
							<button type="button" class = "btn btn-custom btn-md" data-toggle="modal" data-target="#non-visitor">
								미방문
							</button>
							<div class="modal fade" id="non-visitor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel">미방문 확인</h4>
										</div>
										<div class="modal-body">
											미방문 처리 하시겠습니까?
										</div>
										<div class="modal-footer">
											<button type="button" class = "btn btn-custom btn-md" data-dismiss="modal">취소</button>
											<button class = "btn btn-custom btn-md" name = "notvisited" onclick = "location='reserveVisited.pet?notvisited=${reserve.reserve_code}'">미방문</button>
										</div>
									</div>
								</div>
							</div><!-- 모달 끝 -->
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