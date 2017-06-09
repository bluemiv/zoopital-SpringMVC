<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="<c:url value="/resources/css/stylish-portfolio.css" />" rel="stylesheet" type="text/css"/>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	
	<script type="text/javascript">
		$(function() {
			$("#start_select").click(function() {
				$.ajax({
					url : "end_timeSearchAjax.pet",
					method : 'post',
					type : 'json',
					data : {
						reserve_start_time : $("#start_time").val()
					},
					success : function(test) {
						$('#end_time option').remove();
						for(var i=0; i< test.length; i++){
							var option = $("<option>"+test[i]+"</option>");
			                $('#end_time').append(option);
						}
					},
					error : function(result, status, er) {
						alert("error : " + result + "/" + status + "/" + er);
					}
				});
			});
		});
	</script>
	<script type="text/javascript">
		$(function(){
			$("#end_time").hide();		
			$("#start_reselect").hide();
			$("#start_time_result").hide();
			
			//시작시간 선택 버튼 클릭하면
			 $("#start_select").click(function(){
				var test = $("#start_select option:selected").val();

				//끝시간 셀렉트박스
				$("#end_time").show();
				$("#start_reselect").show();
				
				//시작시간 선택 버튼 없앰
				$("#start_select").hide();
				$("#start_time").hide();
				$("#start_time_result").show();
				$("#start_time_result").val($("#start_time").val());
			 });
			
			//시작 시간 다시선택 버튼 클릭하면
			$("#start_reselect").click(function(){
				
				// 시작시간 셀렉박스 활성화
				$("#start_select").show();
				$("#start_time").show();
				
				// 다시선택버튼, 끝시간 셀렉박스 없애기
				$("#end_time").hide();
				$("#start_reselect").hide();
				$("#start_time_result").hide();
			});		
		});
	</script>
</head>
<body>

	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
	<!-- 콘텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>동물 등록</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action="reserveInsertPro.pet" method="post">
					<input type="hidden" name="reserve_date" value="${reserve_date}">
					<input type="hidden" name="emp_name" value="${emp_name}">
					<input type="hidden" name="pet_code" value="${petInfo.pet_code}">
					<input type="hidden" name="pet_phone" value="${petInfo.pet_phone}">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 이름</label>
							<input class="form-control" type="text" readonly="readonly" value="${petInfo.pet_name}">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">보호자 연락처</label>
							<input class="form-control" type="text" readonly="readonly" value="${petInfo.pet_phone}">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-5 floating-label-form-group controls board-custom">
							<label for="name">시간 설정</label>
							<div class = "form-inline">
								<select id="start_time"  name="reserve_start_time" class = "form-control">
									<c:forEach items="${available_list}" var="list">
										<option value="${list}">${list}시</option>
									</c:forEach>
								</select>
								<input type="text" id="start_time_result" class="form-control" readonly="readonly"/>
								<input type="button" id="start_select" value="선택" onclick="click2()" class = "btn btn-custom btn-md">
							</div>
						</div>
						<div class="form-group col-xs-2 floating-label-form-group controls board-custom"> 
							<br>
							<label for="name">~</label>
						</div>
						<div class="form-group col-xs-5 floating-label-form-group controls board-custom form-inline">
							<br>
							<div class = "form-inline">
								<select id="end_time" name="reserve_end_time" class = "form-control">
								</select>
								<input type="button" id="start_reselect" value="시작시간 다시 선택" class = "btn btn-custom btn-md">
							</div>
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">예약 내용</label>
							<textarea class="form-control" name="reserve_contents"></textarea>
						</div>
					</div>
					
					<br>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="등록">
							<input class = "btn btn-custom btn-md" type="reset" value="다시쓰기">
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