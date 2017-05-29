<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>쪽지함</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<table width="100%" class="table table-striped table-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>시간</th>
						<th>제목</th>
						<th>보낸사람</th>
						<th>받는사람</th>
						<th>열람여부(y/n)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var ="var">
					<tr class = "board-custom">
						<td>${var.message_date}</td>
						<td>${var.message_title}</td>
						<td>${var.message_writer}</td>
						<td>${var.message_reader}</td>
						<td>${var.message_read}</td>
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