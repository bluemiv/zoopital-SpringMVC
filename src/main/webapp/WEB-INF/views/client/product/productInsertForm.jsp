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
				<h2>물품 등록</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action = "productInsertPro.pet" method = "post" enctype="multipart/form-data">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 이름</label>
							<input type = "text" class="form-control" name = "product_name" placeholder="물품 이름">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 개수</label>
							<input type = "number" min = "1" name = "product_amount" class="form-control" placeholder="개수">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 가격</label>
							<input type = "text" name = "product_cost" class="form-control" placeholder="판매가격">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">물품 종류</label>
							<select class="form-control" name = "product_category">
								<option value = "음식" selected="selected">음식</option>
								<option value = "놀이">놀이</option>
								<option value = "의류">의류</option>
								<option value = "기타">기타</option>
							</select>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">상품 사진</label>
							<input type = "file" class="form-control" name ="imgFile">
							<p class="help-block text-danger"></p>
						</div>
					</div>

					<br>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="물품 등록">
							<input class = "btn btn-custom btn-md" type="reset" value="다시쓰기">
							<input class = "btn btn-custom btn-md" type="button" onclick = "location='productListForm.pet'" value="약품 리스트">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../../layout/footer.jsp"/>
</body>
</html>