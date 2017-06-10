<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<link href="<c:url value="/resources/css/stylish-portfolio.css" />" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	
	<!-- custom css -->
	<link href="<c:url value="/resources/css/stylish-portfolio.css" />" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
	/* 초기 비번영역 숨기기*/
	$(function(){
		$("#pw").hide();
	

	/* 아이디입력 Ajax */

	$("#input_id").click(function() {
		if($("#client_id").val()==null || $("#client_id").val()==''){
			alert("ID를 입력해주세요");
		}else if($("#client_id").val()!=null || $("#client_id").val()!=''){
			
			document.getElementById("sendId").value = $("#client_id").val();
			
			var dataForm = {
					client_id : $("#client_id").val()
			};
		
		$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
			url : "pwSearchAjax.pet",
			method : 'POST',
			type : 'json',
			data : JSON.stringify(dataForm),
			contentType : "application/json",
			success : function(result) {
				if(result.client_id == null){
					
					alert("해당 ID가 존재하지 않아요");
				}
				if(result.client_id =! null){
					$("#pw").show();
					$("#id").hide();
					document.getElementById("question").value = result.client_pw_qst;
				} 
			},
			error : function(result, status, er) {
					alert("error");
					
			}
		});//ajax
	}//else if
	});//clickFunction
	
});//jQuery
</script>
</head>
<body>
	<div class="container">
		<div class = "row">
			<div class = "col-xs-12">
				<h2>비밀번호 찾기</h2>
				<hr>
			</div>
		</div>
		<div id="id">
		   	<div class = "row">
		   		<div class = "col-xs-12">
					아이디 입력 : <input required="required" id="client_id" class = "form-control" type="text" >
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="row">
				<div class="col-xs-12">
					<button class = "btn btn-md btn-custom" id="input_id">다음</button>
				</div>
			</div>
		</div>
		<div class = "row">
	   		<div class = "col-xs-12">
				<div id="pw">
					<form action="pw_searchPro.pet" method="post">
						<label for="name" >비밀번호 질문:</label>
						<input type="text" id="question" class ="form-control" name="client_pw_qst" readonly="readonly">
						<br>
						<label for="name" >답변: </label>
						<input type="text" name="client_pw_asw" class="form-control" id="aws" placeholder="비밀번호 답변을 입력하세요">
						<input type="hidden" id="sendId" name="client_id">
						<br>
						<input class = "btn btn-md btn-custom" type="submit" value="찾기">
					</form>
				</div>
			</div>
	   	</div>
	</div>
</body>
</html>