<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>보고서 수정</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>보고서 수정</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action="updateReportPro.pet" method = "post">
					<input type = "hidden" name = "report_code" value="${reportDTO.report_code}"/>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">결재하는 사람</label>
							<select class="form-control" name="report_reader">
								<c:forEach items= "${empFullList}" var = "empFullList">
									<c:if test="${reportDTO.report_reader == empFullList.emp_name}">
										<option selected="selected" value = "${empFullList.emp_name}">${empFullList.emp_name}</option>
									</c:if>
									<c:if test="${reportDTO.report_reader != empFullList.emp_name}">
										<option value = "${empFullList.emp_name}">${empFullList.emp_name}</option>
									</c:if>
								</c:forEach>
							</select><br>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">작성자 직급</label>
							<se:authorize access="hasAnyRole('ROLE_FULL', 'ROLE_SUPER_FULL')">
								<input type="text" value="정규직" class="form-control" name="report_position" readonly ="readonly">
							</se:authorize>
							<se:authorize access="hasAnyRole('ROLE_PART', 'ROLE_SUPER_PART')">
								<input type="text" value="비정규직" class="form-control" name="report_position" readonly ="readonly">
							</se:authorize>	
						</div>
					</div>
					<hr>
					<div class="row control-group">
						<label for="message">보고내용</label>
							<textarea class="form-control" rows="10" name="report_contents" >${reportDTO.report_contents}</textarea><br><hr>
						<p class="help-block text-danger"></p>
					</div>
					<div>
						<input  type="submit" class = "btn btn-custom btn-md"  value="작성완료">
					</div>
				</form>
			</div>
		</div>
	</div>
				

	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>