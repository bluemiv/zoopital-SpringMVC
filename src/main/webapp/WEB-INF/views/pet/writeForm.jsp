<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>정보입력</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>동물 등록</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action="writePro.pet" method="post">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">이름</label>
							<input class="form-control" type="text" name="pet_name">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">종류</label>
							<input class="form-control" type="text" name="pet_type">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
							<label for="name">수컷</label>
							<input type="radio" name="pet_sex" value="male" class="form-control">
						</div>
						<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
							<label for="name">암컷</label>
							<input type="radio" name="pet_sex" value="female" class="form-control">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">나이</label>
							<input type="text" name="pet_age" class="form-control">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">전화번호</label>
							<input type="text" name="pet_phone" class="form-control">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">지점</label>
							<input type="text" name="store_code" value="판교" class="form-control">
						</div>
					</div>
					
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="등록">
							<input class = "btn btn-custom btn-md" type="reset" value="다시쓰기">
							<input class = "btn btn-custom btn-md" type="button" onclick = "location='list.pet'" value="동물목록보기">
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