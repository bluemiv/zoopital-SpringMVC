<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 홈페이지 입니다</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var idCheck;
			/* 초기 가입 버튼 비활성화 */
			$("#join_us_btn").prop("disabled", true);
			
			/* 비밀번호 확인 */
			window.setInterval(function(){
				if($("#pwd").val() != '' && $("#pwd_confirm").val() != ''){
					if($("#pwd").val() == $("#pwd_confirm").val()){
						$("#pwd_check_display").html("<font color = 'green'>사용가능합니다.</font>");
					} else if ($("#pwd").val() != $("#pwd_confirm").val()){
						$("#pwd_check_display").html("<font color = 'red'>사용 불가능합니다.</font>");
					}
				} else {
					$("#pwd_check_display").text("");
				}
			}, 100);
			
			/* 아이디 중복체크 Ajax */
			$("#id_check").click(function() {
				var dataForm = {
					store_code : $("#store_id").val()
				};
				$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
					url : "idConfirmAjax.pet",
					method : 'POST',
					type : 'json',
					data : JSON.stringify(dataForm),
					contentType : "application/json",
					success : function(result) {
						if(result == true && $("#store_id").val() != ""){
							$("#id_check_display").html("<font color = 'green'>사용가능합니다!</font>");
							idCheck = true;
						} else{
							$("#id_check_display").html("<font color = 'red'>사용 불가능합니다.</font>");
							idCheck = false;
						}
					},
					error : function(result, status, er) {
						$("#id_check_display").text(er);
					}
				});
			});
			
			window.setInterval(function(){
				if($("#pwd").val() != '' && $("#pwd_confirm").val() != '' && $("#pwd").val() == $("#pwd_confirm").val() && idCheck == true){
					$("#join_us_btn").attr("disabled", false);
				} else {
					$("#join_us_btn").attr("disabled", true);
				}
			}, 100);
		});
	</script>
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
				<form action = "input.pet" method = "post">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">지점 ID</label>
							<input type = "text" class="form-control" id = "store_id" name = "store_code" required="required" placeholder="지점 ID">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<br>
							<input type = "button" value="중복확인" id = "id_check" class = "btn btn-custom btn-md"/>
							<p id = "id_check_display"></p>
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">지점 Password</label>
							<input type = "password" id = "pwd" name = "store_password" required="required" class="form-control" placeholder="비밀번호를 입력해주세요">
							<p id = "pwd_check_display"></p>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">Password 확인</label>
							<input type = "password" id = "pwd_confirm" name = "store_password" required="required" class="form-control" placeholder="다시한번 비밀번호를 입력해주세요">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">지점 명</label>
							<input type = "text" name = "store_name" class="form-control" required="required" placeholder="병원이름을 입력해주세요">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">(비)활성화</label>
							<select name = "store_enabled" class="form-control">
								<option value = "1">활성화</option>
								<option value = "0">비활성화</option>
							</select>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">권한</label>
							<select name = "store_role" class="form-control">
								<option value = "ROLE_SUPER_ADMIN">수퍼 관리자</option>
								<option value = "ROLE_ADMIN">일반 관리자</option>
							</select>
						</div>
					</div>
					
					<br>
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<h3>지출 관련</h3>
							<hr>
						</div>
					</div>
					
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">관리비</label>
							<input type = "text" name = "store_cost" class="form-control">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">임대비</label>
							<input type = "text" name = "store_rentCost" class="form-control">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">총 수입</label>
							<input type = "text" name = "store_income" class="form-control">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">직원 급여</label>
							<input type = "text" name = "store_payment" class="form-control">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">정규직 인원</label>
							<input type = "text" name = "store_doctor" class="form-control">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">비정규직 인원</label>
							<input type = "text" name = "store_worker" class="form-control">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" id = "join_us_btn" type="submit" value="지점 등록">
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