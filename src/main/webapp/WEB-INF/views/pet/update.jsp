<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<title>동물 수정</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>동물 수정</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action="updatePro.pet" method="post">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">이름</label>
							<input class="form-control" type="text" name="pet_name" value="${petDTO.pet_name}">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">종류</label>
							<input class="form-control" type="text" name="pet_type" value="${petDTO.pet_type}">
						</div>
					</div>
					
					<div class="row control-group">
					<c:if test="${ petDTO.pet_sex == 'male' }">
						<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
							<label for="name">수컷</label>
							<input type="radio" name="pet_sex" value="male" checked="checked" class="form-control">
						</div>
						<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
							<label for="name">암컷</label>
							<input type="radio" name="pet_sex" value="female" class="form-control">
						</div>
					</c:if>
					<c:if test="${ petDTO.pet_sex == 'female' }">
						<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
							<label for="name">수컷</label>
							<input type="radio" name="pet_sex" value="male" class="form-control">
						</div>
						<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
							<label for="name">암컷</label>
							<input type="radio" name="pet_sex" value="female" checked="checked" class="form-control">
						</div>
					</c:if>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">나이</label>
							<input type="number" min = "0" name="pet_age" class="form-control" value="${petDTO.pet_age}">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">전화번호</label>
							<input type="text" name="pet_phone" class="form-control" value="${ petDTO.pet_phone}">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">이메일</label>
							<input type="text" name="pet_email" class="form-control" value="${ petDTO.pet_email}" />
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">우편번호</label>
							<input type="text" name="pet_postCode" readonly="readonly" class="postcodify_postcode5 form-control" value="${ petDTO.pet_postCode}" />
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							검색해서 찾아주세요!<br>
							<p id="postcodify_search_button" class="btn btn-custom btn-md">검색</p>
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">주소</label>
							<input type="text" name="pet_addr" readonly="readonly" class="postcodify_address form-control" value="${ petDTO.pet_addr}" />						
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">상세주소</label>
							<input type="text" name="pet_addrDetail" class="postcodify_details form-control" value="${ petDTO.pet_addrDetail}" placeholder="상세주소를 입력해주세요"/>						
						</div>
					</div>
					<input type="hidden" name="pet_code" value="${petDTO.pet_code }">
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="수정">
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