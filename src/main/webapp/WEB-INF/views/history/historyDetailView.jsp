<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>히스토리 상세보기</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>처방전</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form id="frm" name="frm" method = "post">
					<input type="hidden" value="${pdto.petaccept_code }" name="petaccept_code"/>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">진료 번호</label>
							<input type = "text" class="form-control" value = "${pdto.pethistory_key}" name="pethistory_key" readonly="readonly">
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">진료 지점</label>
							<input type = "text" class="form-control" value = "${pdto.store_code}" name="store_code" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">담당 의사</label>
							<input type = "text" class="form-control" value = "${pdto.emp_name}" name="emp_name" readonly="readonly">
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">접수 시간</label>
							<input type = "text" class="form-control" value = "${pdto.pethistory_btoday}" name="pethistory_btoday" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">진료 시간</label>
							<input type = "text" class="form-control" value = "${pdto.pethistory_today}" name="pethistory_today" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 이름</label>
							<input type = "text" value = "${pdto.pet_name}" class="form-control" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 종류</label>
							<input type = "text" value = "${pdto.pet_type}" class="form-control" readonly="readonly">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 성별</label>
							<input type = "text" class="form-control" value = "${pdto.pet_sex}" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 나이</label>
							<input type = "text" class="form-control" value = "${pdto.pet_age}개월" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<hr>
					<c:forEach items="${listpdto}" var="p" varStatus="i">
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">약품${i.count} 이름</label>
							<input type = "text" class="form-control" value = "${p.mName}" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">약품 개수</label>
							<input type = "text" class="form-control" value = "${p.mAmount}" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					</c:forEach>
					<hr>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 가격</label>
							<input type = "text" class="form-control" value = "${pdto.pethistory_m_cost}" name="pethistory_m_cost" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">진료 가격</label>
							<input type = "text" class="form-control" value = "${pdto.pethistory_cost}" name="pethistory_cost" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">총 가격</label>
							<input type = "text" class="form-control" value = "${pdto.pethistory_total_cost}" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">의사 소견</label>
							<textarea class="form-control" readonly="readonly">${pdto.pethistory_coments}</textarea>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="button" onclick = "location='selectallhistory.pet'" value="돌아가기">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>