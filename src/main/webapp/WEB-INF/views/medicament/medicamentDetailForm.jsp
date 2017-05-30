<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${medicamentDTO.medicament_name}</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>약품 정보</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action = "medicamentInsertPro.pet" method = "post">
				
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">지점 코드</label>
							<input type = "text" class="form-control" value = "${medicamentDTO.store_code}" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 이름</label>
							<input type = "text" class="form-control" value = "${medicamentDTO.medicament_name}" readonly="readonly">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 개수</label>
							<input type = "text" value = "${medicamentDTO.medicament_amount}개" class="form-control" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 가격</label>
							<input type = "text" value = "${medicamentDTO.medicament_cost}원" class="form-control" readonly="readonly">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 종류</label>
							<input type = "text" class="form-control" value = "${medicamentDTO.medicament_category}" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 주기</label>
							<input type = "text" class="form-control" value = "${medicamentDTO.medicament_cycle}개월" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
					</div>

					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">제조 일자</label>
							<input type = "date" class="form-control" value = "${medicamentDTO.medicament_mandate}" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">유통 기한</label>
							<input type = "date" class="form-control" value = "${medicamentDTO.medicament_exdate}" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="button" onclick = "location='medicamentListForm.pet'" value="약품 리스트">
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