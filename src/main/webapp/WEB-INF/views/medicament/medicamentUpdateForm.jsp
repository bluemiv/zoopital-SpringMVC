<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>약품 수정</title>

</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<form class="form-horizontal" action = "medicamentUpdatePro.pet" method = "post">
		<input type = "hidden" name = "medicament_code" value = "${medicamentDTO.medicament_code}">
		<input type = "hidden" name = "store_code" value = "${medicamentDTO.store_code}">
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				약품 이름
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "medicament_name" value = "${medicamentDTO.medicament_name}" class="form-control">
				<span class="input-group-addon">한/A</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				약품 개수
			</label>
			<div class="col-sm-3 input-group">
				<input type = "number" min = "1" name = "medicament_amount" required="required" value = "${medicamentDTO.medicament_amount}" class="form-control">
				<span class="input-group-addon">개</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				약품 가격
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "medicament_cost" required="required" value = "${medicamentDTO.medicament_cost}" class="form-control">
				<span class="input-group-addon">원</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				약품 종류
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "medicament_cost" required="required" value = "${medicamentDTO.medicament_category}" class="form-control">
				<span class="input-group-addon">원</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				제조 일자
			</label>
			<div class="col-sm-3 input-group">
				<input type = "date" name = "medicament_mandate" value = "${medicamentDTO.medicament_mandate}" class="form-control">
				<span class="input-group-addon">날짜</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				유통 기한
			</label>
			<div class="col-sm-3 input-group">
				<input type = "date" name = "medicament_exdate" value = "${medicamentDTO.medicament_exdate}" class="form-control">
				<span class="input-group-addon">날짜</span>
			</div>
		</div>
		<div>
			<div class="col-sm-5 blockquote-reverse">
				<input type = "submit" class="btn btn-md btn-info" value = "수정 완료">
			</div>
		</div>
	</form>
</body>
</html>