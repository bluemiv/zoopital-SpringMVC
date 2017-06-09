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

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.checkid_wrap {
	width: 550px;
	height: 400px;
	float: left;
	text-align: center;
	background: #dbe9ef;
	overflow: visible;
}

.checkid_wrap_inn {
	width: 260px;
	height: 100px;
	float: left;
	text-align: center;
	padding: 50px 20px;
}

p {
	font-size: 14px;
}

.sp {
	font-weight: bold;
	font-size:15px;
}

.btn {
	line-height:0em;
	margin-top: 40px;
	width: 130px;
	height: 30px;
	border-radius: 30px;
	background: #336799;
	text-align: center;
	border:0px solid #fff;
	border-bottom: 3px solid rgba(255, 255, 255, 0.5);
	color:#fff;
}
</style>


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
					alert(result.client_id);
					
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
		<!-- 첫째 줄 -->
		<div class="checkid_wrap">
			<div>
				<h2>비밀번호 찾기</h2>
				<hr>
			</div>
	    <br>
				<div id="id">
					아이디 입력 : <input required="required" id="client_id" type="text" >
					<button class = "btn" id="input_id">다음</button> 	
				</div>
		
				<div id="pw">
					<form action="pw_searchPro.pet" method="post">
						
						<label for="name" >비밀번호 질문:</label>
							  <input type="text" id="question" name="client_pw_qst" readonly="readonly">
						<br><br><br>
						<label for="name" >답변: </label>
						<input type="text" name="client_pw_asw" id="aws" placeholder="비밀번호 답변을 입력하세요">
						<input type="hidden" id="sendId" name="client_id">
						<br>
						<input class = "btn" type="submit" value="찾기">
					</form>
				</div>
		</div>
	
		
	
</body>
</html>