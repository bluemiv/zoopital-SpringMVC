<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>정보입력</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
							<input class="form-control" type="text" name="pet_name" placeholder="동물 이름">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">종류</label>
							<input class="form-control" type="text" name="pet_type" placeholder="동물 종류">
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
							<label for="name">나이(개월)</label>
							<input type="number" min = "0" name="pet_age" class="form-control" placeholder="동물 나이 (개월)">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">전화번호</label>
							<input type="text" name="pet_phone" class="form-control" placeholder="'-'없이 입력해주세요">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">이메일</label>
							<input type="text" name="pet_email" class="form-control" placeholder="이메일 입력" />
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">우편번호</label>
							<input type="text" name="pet_postCode" readonly="readonly" class="postcodify_postcode5 form-control" placeholder="검색버튼을 눌러주세요" />
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							검색해서 찾아주세요!<br>
							<p id="postcodify_search_button" class="btn btn-custom btn-md">검색</p>
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">주소</label>
							<input type="text" name="pet_addr" readonly="readonly" class="postcodify_address form-control" placeholder="검색버튼을 눌러주세요" />						
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">상세주소</label>
							<input type="text" name="pet_addrDetail" class="postcodify_details form-control" placeholder="상세주소를 입력해주세요"/>						
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
	
	<!-- 주소 "검색"창  -->
	<script>
		$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
	</script>
	
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</body>
</html>