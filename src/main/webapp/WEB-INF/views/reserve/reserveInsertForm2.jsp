<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function submitFunc(){
		
	}
</script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

	$(function(){
		$("#end_time").hide();		
		$("#start_reselect").hide();
		
		//시작시간 선택 버튼 클릭하면
		 $("#start_select").click(function(){
			
			var test = $("#start_select option:selected").val();
			alert(test);
			//시작시간 선택 버튼 없애고
			$("#start_select").hide();
			
			//끝시간 셀렉트박스&시작시간 다시선택 버튼 나타내고 시작시간 셀렉박스 비활성화
			$("#end_time").show();
		});
		
		//시작 시간 다시선택 버튼 클릭하면
		$("#start_reselect").click(function(){
			//시작시간 셀렉박스 활성화&선택버튼 나타내고 다시선택버튼/끝시간 셀렉박스 또 없애기
			
			$("#start_select").show();
			$("#end_time").hide();
		});		
	});
	
</script>

</head>
<body>

	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
	<!-- 콘텐츠 -->

<form action="reserveInsertPro.pet" method="post">

<fieldset>
	<legend>동물 정보</legend>
	
	<!-- 두번째 줄 -->
			<div class="col-lg-9 text-center">
			</div>
			<div class="col-lg-3 text-center">
				<div class="input-group">
					<form action="search.pet" method="get">
						<span class="input-group-btn">
							<input class = "form-control" type="text" size="30" name="search" placeholder="이름으로 검색">
							<button class="btn btn-custom" type="button">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</form>
				</div>
			</div>
			
			<div class="row">
			<table width="100%" class="table table-stripedtable-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>동물 이름</th>
						<th>동물 종류</th>
						<th>동물 성별</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${ serchlist }" var="list">
					<tr class = "board-custom">
						<td>${ list.pet_name }</td>
						<td>${ list.pet_type }</td>
						<td>${ list.pet_sex }</td>
						<td>${ list.pet_phone }</td>
					</tr>
				</c:forEach>
	 
	<textarea name="reserve_contents"></textarea>

</fieldset>

<fieldset>
	<legend>시간 선택</legend>
	
	<select id="start_time"  name="reserve_start_time">
		<c:forEach items="${available_list}" var="list">
			<option value="${list}">${list}시</option>
		</c:forEach>
		
	</select>
	<input type="button" id="start_select" value="선택" onclick="click2()"> 
	~
	<select id="end_time" name="reserve_end_time" onchange="" >
	
		<c:forEach var="num" begin="10" end="19" step="1">
			<option value="${num}">${num}시</option>
		</c:forEach>
	</select>
	<input type="button" id="start_reselect" value="시작시간 다시 선택"> 
</fieldset>

<fieldset>
	<legend>예약 내용</legend>
	 
	<textarea name="reserve_contents"></textarea>

</fieldset>
	
	<input type="hidden" name="reserve_date" value="${reserve_date}">
	<input type="hidden" name="emp_name" value="${emp_name}">
	<input type="submit" value="예약 추가">
	
</form>

</body>
</html>