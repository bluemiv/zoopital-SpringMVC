<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../../layout/header.jsp"/>
	
	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>물품 정보</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 이름</label>
							<input type = "text" readonly="readonly" value="${productDTO.product_name}" class="form-control">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 개수</label>
							<input type = "number" readonly="readonly" value="${productDTO.product_amount}" min = "0" class="form-control" placeholder="개수">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 가격</label>
							<input type = "number" readonly="readonly" value="${productDTO.product_cost}" min = "0" class="form-control" placeholder="판매가격">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 종류</label>
							<input type = "text" readonly="readonly" class="form-control" value="${productDTO.product_category}">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">상품 사진</label>
							<input type = "file" class="form-control" name ="">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="button" onclick = "location='productListForm.pet'" value="약품 리스트">
						</div>
					</div>
			</div>
		</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../../layout/footer.jsp"/>
</body>
</html>