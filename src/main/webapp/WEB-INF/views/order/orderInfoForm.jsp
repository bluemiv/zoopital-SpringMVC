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
	<se:authentication property="name" var="username"/>
	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
		<thead>
			<tr class="info">
				<th>물품 내용</th>
				<th>요청 개수</th>
				<th>요청받는 곳(목적지 지점)</th>
				<th>요구하는 곳(해당 지점)</th>
				<th>승인 여부</th>
				<th>배송 완료</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var ="var">
			<tr>
				<td>${var.order_name}</td>
				<td>${var.order_amount}</td>
				<td>${var.order_to}</td>
				<td>${var.order_from}</td>
				<td>
				<c:if test="${var.order_check == 'yes'}">
					승인
				</c:if>
				<c:if test="${var.order_check == 'no'}">
					거절
				</c:if>
				<c:if test="${ username == var.order_to && var.order_check == 'no' }">
					<button onclick = "location='orderCheckPro.pet?order_check=yes&order_code=${var.order_code}'">승인</button>
				</c:if>
				<c:if test="${ username == var.order_to && var.order_check == 'yes' }">
					<button onclick = "location='orderCheckPro.pet?order_check=no&order_code=${var.order_code}'">거절</button>
				</c:if>
				</td>
				<td>
				<c:if test="${var.order_delivery == 'yes'}">
					수령 완료
				</c:if>
				<c:if test="${var.order_delivery == 'no'}">
					수령 미완료
				</c:if>
				<c:if test="${ username == var.order_from && var.order_delivery == 'no'}">
					<button onclick = "location='orderCheckPro.pet?order_delivery=yes&order_code=${var.order_code}'">수령 완료</button>
				</c:if>
				<c:if test="${ username == var.order_from && var.order_delivery == 'yes'}">
					<button onclick = "location='orderCheckPro.pet?order_delivery=no&order_code=${var.order_code}'">수령 미완료</button>
				</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>