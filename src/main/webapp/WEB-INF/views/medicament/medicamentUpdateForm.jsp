<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>약품 수정</title>

</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>약품 등록</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action = "medicamentUpdatePro.pet" method = "post">
					<input type = "hidden" name = "medicament_code" value = "${medicamentDTO.medicament_code}">
					<input type = "hidden" name = "store_code" value = "${medicamentDTO.store_code}">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 이름</label>
							<input type = "text" class="form-control" name = "medicament_name"
							value = "${medicamentDTO.medicament_name}" placeholder="약 이름">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 개수</label>
							<input type = "number" min = "0" name = "medicament_amount" required="required" value = "${medicamentDTO.medicament_amount}" class="form-control">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 가격</label>
							<input type = "text" name = "medicament_cost" required="required" value = "${medicamentDTO.medicament_cost}" class="form-control">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 종류</label>
							<select class="form-control" name = "medicament_category">
								<option value = "알약">알약</option>
								<option value = "주사">주사</option>
								<option value = "연고">연고</option>
								<option value = "기타">기타</option>
							</select>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 주기</label>
							<input type = "number" min = "0" name = "medicament_cycle" value = "${medicamentDTO.medicament_cycle}"  class="form-control">
							<p class="help-block text-danger"></p>
						</div>
					</div>

					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">제조 일자</label>
							<input type = "date" class="form-control" name = "medicament_mandate" value = "${medicamentDTO.medicament_mandate}" >
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom" >
							<label for="message">유통 기한</label>
							<input type = "date" name = "medicament_exdate" class="form-control" value = "${medicamentDTO.medicament_exdate}">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="약품 수정">
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