<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
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
	
	$(function(){
		$("#modify_submit").hide();
		$("#modify_cancel").hide();
		$("#postcodify_search_button").hide();
		
		$("#modify").click(function(){
			$("#modify_submit").show();
			$("#modify_cancel").show();
			$("#postcodify_search_button").show();
			$("#modify").hide();
			
			$("[name='client_name']").attr("readonly",false);
			$("[name='client_tel']").attr("readonly",false);
			$("[name='client_email']").attr("readonly",false);
			$("[name='client_join_date']").attr("readonly",false);
			$("[name='client_add_detail']").attr("readonly",false);
		});
		
		$("#modify_cancel").click(function(){
			$("#modify_submit").hide();
			$("#modify_cancel").hide();
			$("#postcodify_search_button").hide();
			$("#modify").show();
			
			$("[name='client_name']").attr("readonly",true);
			$("[name='client_tel']").attr("readonly",true);
			$("[name='client_email']").attr("readonly",true);
			$("[name='client_join_date']").attr("readonly",true);
			$("[name='client_add_detail']").attr("readonly",true);
		});
	});
</script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>회원정보</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action = "clientUpdatePro.pet" method = "post">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">회원 ID</label>
							<input type = "text" name="client_id" readonly="readonly" class="form-control" value="${clientDTO.client_id}"/> 	
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">회원 이름</label>
							<input type = "text" class="form-control" name = "client_name" value = "${clientDTO.client_name}" readonly="readonly">
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
							<label for="name">전화번호</label>
							<input type = "text" class="form-control" name = "client_tel" value = "${clientDTO.client_tel}" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">이메일</label>
							<input type = "email" name ="client_email" value = "${clientDTO.client_email}" class="form-control" readonly="readonly">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">가입 일자</label>
							<input type = "date" name = "client_join_date" value = "${clientDTO.client_join_date}" class="form-control" readonly="readonly">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">우편번호</label>
							<input type = "text" class="form-control postcodify_postcode5" name="client_postcode" value = "${clientDTO.client_postcode}" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<br>
							<p id="postcodify_search_button" class="btn btn-custom btn-md">검색</p>
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">주소</label>
							<input type = "text" class="form-control postcodify_address" name = "client_add" value = "${clientDTO.client_add}" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">상세주소</label>
							<input type = "text" class="form-control postcodify_details" name="client_add_detail" value = "${clientDTO.client_add_detail}" readonly="readonly">
							<p class="help-block text-danger"></p>
						</div>
					</div>

					<br>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="button" value="수정하기" id="modify"/>
							<input class = "btn btn-custom btn-md" id="modify_submit" type="submit" value="수정">
							<input class = "btn btn-custom btn-md" id="modify_cancel" type="button" value="수정 취소">
							<button type="button" class = "btn btn-custom btn-md" data-toggle="modal" data-target="#delete">
								회원탈퇴
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 모달 -->
	<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">회원 탈퇴</h4>
				</div>
				<form action="clientDeletePro.pet" method = "post">
					<div class="modal-body">
						회원 탈퇴를 하시려면 비밀번호를 입력해주세요
						<input type="password" class="form-control" name = "client_pw"/>
					</div>
					<div class="modal-footer">
						<button type="button" class = "btn btn-custom btn-md" data-dismiss="modal">취소</button>
						<input type="hidden" name = "client_id" value="${client_id}"/>
						<input type = "submit" class = "btn btn-custom btn-md" value="삭제">
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