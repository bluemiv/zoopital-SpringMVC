<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상세 보기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>상세정보</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action="updatePro.pet" method="post">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">이름</label>
							<input class="form-control" type="text" readonly="readonly" value="${petDTO.pet_name}">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">종류</label>
							<input class="form-control" type="text" readonly="readonly" value="${petDTO.pet_type}">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">성별</label>
							<input type="text" value="male" readonly="readonly" class="form-control" value="${petDTO.pet_sex}">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">나이</label>
							<input type="number" min = "0" readonly="readonly" class="form-control" value="${petDTO.pet_age}">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">전화번호</label>
							<input type="text" readonly="readonly" class="form-control" value="${ petDTO.pet_phone}">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">이메일</label>
							<input type="text" readonly="readonly" class="form-control" value="${ petDTO.pet_email}" />
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">우편번호</label>
							<input type="text" readonly="readonly" class="postcodify_postcode5 form-control" value="${ petDTO.pet_postCode}" />
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">주소</label>
							<input type="text" readonly="readonly" class="postcodify_address form-control" value="${ petDTO.pet_addr}" />						
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">상세주소</label>
							<input type="text" readonly="readonly" class="postcodify_details form-control" value="${ petDTO.pet_addrDetail}" placeholder="상세주소를 입력해주세요"/>						
						</div>
					</div>
					<br>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="button" onclick = "location='updateForm.pet?pet_code=${petDTO.pet_code}'" value="수정하기">
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