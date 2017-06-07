<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>   
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보고서 리스트</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>보고서 리스트</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<!-- 둘째 줄 -->
			<table width="100%" class="table table-stripedtable-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>보고서 번호</th>
						<th>결재하는 사람</th>
						<th>작성자</th>
						<th>직위</th>
						<th>작성일</th>
						<th>보고내용</th>
						<th>결재여부</th>
						<th>수정/삭제</th>
						<th>승인/반려</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${reportList }" var="list">
						<tr class = "board-custom">
							<td>${list.report_code}</td>
							<td>${list.report_reader}</td>
							<td>${list.report_writer}</td>
							<td>
								<c:if test="${list.report_position == 'doctor'}">
									의사
								</c:if>
								<c:if test="${list.report_position == 'worker'}">
									비정규직
								</c:if>
							</td>
							<td>${list.report_date}</td>
							<td> ${list.report_contents}</td>
							<td>
								<c:if test="${list.report_check == 'fail'}">
									미승인
								</c:if>
								<c:if test="${list.report_check == 'success'}">
									승인
								</c:if>
							</td>
							<td class="form-inline">
								<se:authentication property="name" var="username"/>
									<c:if test = "${ username == list.report_writer}">
										<button class = "btn btn-custom btn-md" onclick = "location='deleteReport.pet?report_code=${list.report_code}'">삭제</button>
										<button class = "btn btn-custom btn-md" onclick = "location='updateReportForm.pet?report_code=${list.report_code}'">수정</button>
									</c:if>
									<c:if test="${ username != list.report_writer}">권한 없음</c:if>
							</td>
							<td class="form-inline">
								<se:authentication property="name" var="username"/>
									<c:if test="${username == list.report_writer}">
										<c:if test = "${ list.report_check == 'success'}">
											<button class = "btn btn-custom btn-md" onclick = "location='checkReport.pet?report_check=fail&report_code=${list.report_code}'">미승인</button>
										</c:if>
										<c:if test = "${ list.report_check == 'fail'}">
											<button class = "btn btn-custom btn-md" onclick = "location='checkReport.pet?report_check=success&report_code=${list.report_code}'">승인</button>
										</c:if>
									</c:if>
									<c:if test="${username != list.report_writer}"><font color="red">권한 없음</font></c:if>
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