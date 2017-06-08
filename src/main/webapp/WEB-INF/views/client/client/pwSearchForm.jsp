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


<script type="text/javascript">
	/* 초기 비번영역 숨기기*/
	$(function(){
		$("#pw").hide();
	

	/* 아이디입력 Ajax */
	$("#input_id").click(function() {
		alert($("#client_id").val());
		document.getElementById("sendId").value =
			$("#client_id").val();
		
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
				if(result != null){
					$("#pw").show();
					$("#id").hide();
					document.getElementById("question").value =
						result.client_pw_qst;
					
					/* $("#question").html(result.client_pw_qst); */
				} else{
					alert("해당 ID가 존재하지 않아요");
				}
			},
			error : function(result, status, er) {
					alert("error");
			}
		});//ajax
	});
	});
</script>

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
</head>
<body>
<h5>비밀번호 찾기는 일반회원만 가능합니다.<br> 관리자는 본사로 문의하세요.</h5>

	<div id="id">
		아이디 입력 : <input class="form-control" id="client_id" type="text">
		<button class = "btn btn-custom btn-md" id="input_id">다음</button> 
		<br><br>
		<br><br>
	</div>
<form action="pw_searchPro.pet" method="post">
	<div id="pw">
			<fieldset>
				<legend>비밀번호 질문</legend>
				  <input class="form-control" type="text" id="question" name="client_pw_qst" readonly="readonly">
			</fieldset><br>
			답변: <input class="form-control" type="text" name="client_pw_asw" id="aws" placeholder="비밀번호 답변을 입력하세요">
			<input type="hidden" id="sendId" name="client_id">
			<input class = "btn btn-custom btn-md" type="submit" value="찾기">
	</div>
</form>
	
</body>
</html>