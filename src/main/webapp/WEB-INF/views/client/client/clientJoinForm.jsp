<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE>
<html>
<head>
<title></title>
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
						client_id : $("#client_id").val()
				};
				$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
					url : "clientIdConfirmAjax.pet",
					method : 'POST',
					type : 'json',
					data : JSON.stringify(dataForm),
					contentType : "application/json",
					success : function(result) {
						if(result == true && $("#client_id").val() != ""){
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
	<jsp:include page="../../layout/header.jsp"/>
	
<!-- 콘텐츠 -->
	<div class="container">
		<!-- 첫째 줄 -->
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>회원 가입</h2>
					<hr>
				</div>
			</div>
		<!-- 둘째 줄 -->
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="joinPro.pet" method="post">
						<div class="row control-group">
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">ID</label>
								<input id = "client_id" class="form-control" type="text" name="client_id" placeholder="ID를 입력하세요">
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<br>
							<input type = "button" value="중복확인" id = "id_check" class = "btn btn-custom btn-md"/>
							<p id = "id_check_display"></p>
							</div>
						</div>
						<div class="row control-group">
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">비밀번호 확인 질문</label>
								<select class="form-control" name="client_pw_qst" id="client_pw_qst">
									<option value = "어릴 적 내 별명은?">어릴 적 내 별명은?</option>
									<option value = "애완동물 이름은?">애완동물 이름은?</option>
									<option value = "가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
									<option value = "가장 존경하는 인물은?">가장 존경하는 인물은?</option>
									<option value = "감명깊게 읽은 책?">감명깊게 읽은 책?</option>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">답변</label>
								<input type="text" class="form-control" id = "client_pw_asw" name="client_pw_asw" placeholder="비밀번호 확인 답변을 입력해주세요." />
							</div>
						</div>
						<div class="row control-group">
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">password</label>
								<input type="password" class="form-control" id = "pwd" name="client_pw" placeholder="비밀번호를 입력해주세요." />
								<p id = "pwd_check_display"></p>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">password 확인</label>
								<input type="password" class="form-control" id = "pwd_confirm" name="client_pw_confirm" placeholder="비밀번호를 재입력해주세요." />
							</div>
						</div>
						<div class="row control-group">
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">이름</label>
								<input type="text" name="client_name" class="form-control" placeholder="이름을 입력해주세요">
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">전화번호</label>
								<input type="text" name="client_tel" class="form-control" placeholder="'-'없이 입력해주세요">
							</div>
						</div>
						
						<div class="row control-group">
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">이메일</label>
								<input type="email" name="client_email" class="form-control" placeholder="이메일 입력" />
							</div>
						</div>
						
						<div class="row control-group">
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">우편번호</label>
								<input type="text" name="client_postcode" readonly="readonly" class="postcodify_postcode5 form-control" placeholder="검색버튼을 눌러주세요" />
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								검색해서 찾아주세요!<br>
								<p id="postcodify_search_button" class="btn btn-custom btn-md">검색</p>
							</div>
						</div>
						
						<div class="row control-group">
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">주소</label>
								<input type="text" name="client_add" readonly="readonly" class="postcodify_address form-control" placeholder="검색버튼을 눌러주세요" />						
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
								<label for="name">상세주소</label>
								<input type="text" name="client_add_detail" class="postcodify_details form-control" placeholder="상세주소를 입력해주세요"/>						
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<input id="join_us_btn" class = "btn btn-custom btn-md" type="submit" value="등록">
								<input class = "btn btn-custom btn-md" type="reset" value="다시쓰기">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		

<!-- 푸터 파일 -->
<jsp:include page="../../layout/footer.jsp"/>

	<!-- 주소 "검색"창  -->
	<script>
		$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
	</script>
	
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</body>
</html>