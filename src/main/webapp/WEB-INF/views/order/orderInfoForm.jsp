<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>발주 내역</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>발주 내역</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<table width="100%" class="table table-striped table-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>물품 내용</th>
						<th>요청 개수 / 남은개수</th>
						<th>요청받는 곳(목적지 지점)</th>
						<th>요구하는 곳(해당 지점)</th>
						<th>승인 여부</th>
						<th>수령 여부</th>
						<th>내역 수정</th>
						<th>내역 삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var ="var">
					<tr class = "board-custom">
						<td>${var.order_name}</td>
						<td>${var.order_amount}/${var.medicament_amount}</td>
						<td>${var.order_to}</td>
						<td>${var.order_from}</td>
						<td>
						<c:if test="${var.order_check == 'yes'}">
							승인
						</c:if>
						<c:if test="${var.order_check == 'no'}">
							거부
						</c:if>
						<c:if test="${ session_store_code == var.order_to && var.order_check == 'no' && var.order_delivery == 'no'}">
							<button class = "btn btn-custom btn-md"
							onclick = "location='orderCheckPro.pet?amountState=down&order_check=yes&order_code=${var.order_code}'">승인</button>
						</c:if>
						<c:if test="${ session_store_code == var.order_to && var.order_check == 'yes' && var.order_delivery == 'no'}">
							<button class = "btn btn-custom btn-md"
							onclick = "location='orderCheckPro.pet?amountState=up&order_check=no&order_code=${var.order_code}'">거절</button>
						</c:if>
						</td>
						<td>
						<c:if test="${var.order_check == 'yes'}">
							<c:if test="${var.order_delivery == 'yes'}">
								수령 완료
							</c:if>
							<c:if test="${var.order_delivery == 'no'}">
								수령 미완료
							</c:if>
							<c:if test="${ session_store_code == var.order_from && var.order_delivery == 'no'}">
								<button class = "btn btn-custom btn-md"
								onclick = "location='orderCheckPro.pet?amountState=up&order_delivery=yes&order_code=${var.order_code}'">수령 완료</button>
							</c:if>
							<c:if test="${ session_store_code == var.order_from && var.order_delivery == 'yes'}">
								<button class = "btn btn-custom btn-md"
								onclick = "location='orderCheckPro.pet?amountState=down&order_delivery=no&order_code=${var.order_code}'">수령 미완료</button>
							</c:if>
						</c:if>
						<c:if test="${var.order_check == 'no'}">
							거부 상태
						</c:if>
						</td>
						<c:if test="${session_store_code == var.order_from && var.order_check == 'no'}">
						<td>
							<button class = "btn btn-custom btn-md"
							onclick = "location='orderUpdateForm.pet?order_code=${var.order_code}'">수정</button>
						</td>
						<td>
							<button class = "btn btn-custom btn-md"
							onclick = "location='orderDeletePro.pet?order_code=${var.order_code}'">삭제</button>
						</td>
						</c:if>
						<c:if test="${session_store_code != var.order_from || var.order_check == 'yes'}">
						<td>
							-
						</td>
						<td>
							-
						</td>
						</c:if>
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