<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>접수하기</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function accept_sub(){
	alert("접수가 완료 되었습니다");
	document.getElementById("frm").submit();
	}
</script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
	<!-- 콘텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>진료 접수</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action="insertAccept.pet" method="post" id="frm">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 코드</label>
							<input class="form-control" type="text" value="${pdto.pet_code }" name="petaccept_petcode" readonly="readonly"/><br>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 이름</label>
							<input class="form-control" type="text" value="${pdto.pet_name }" name="pet_name" readonly="readonly"/><br>
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 종류</label>
							<input class="form-control" type="text" value="${pdto.pet_type }" name="pet_type" readonly="readonly"/><br>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 성별</label>
							<input class="form-control" type="text" value="${pdto.pet_sex }" name="pet_sex" readonly="readonly"/><br>
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							
							<label for="name">동물 나이</label>
							<input class="form-control" type="text" value="${pdto.pet_age }" name="pet_age" readonly="readonly"/><br>
						</div>
					</div>
					<div class="row control-group">
							<label for="message">접수 내용</label> <br>
							<textarea class="form-control" name="petaccept_coments" rows="10" style="width:50%;"></textarea><br>
					</div>
							
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<input class = "btn btn-custom btn-md" type="button" value="접수완료" onclick="accept_sub()">
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