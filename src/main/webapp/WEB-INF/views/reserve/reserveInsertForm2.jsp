<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
	$(function(){
		$(".datepicker").datepicker({
			closeText: '닫기',
            prevText: '이전달',
            nextText: '다음달',
            currentText: '오늘',
			inline: true,
		    showOtherMonths: true,
		    showMonthAfterYear: true,
			dateFormat: 'yy/mm/dd'});
	});
	
</script>

</head>
<body>

<form action="reserveInsertPro.pet" method="post">

<fieldset>
	<legend>날짜/시간 선택</legend>
	<div id = "datepicker">날짜 입력
	<input type="text" id="test" name="reserve_date" class="datepicker"/>
	</div>
	
	<br>
	<select name="reserve_start_time">
		<c:forEach var="num" begin="9" end="18" step="1">
			<option value="${num}">${num}시</option>
		</c:forEach>
	</select>
	~
	<select name="reserve_end_time" >
		<c:forEach var="num" begin="10" end="19" step="1">
			<option value="${num}">${num}시</option>
		</c:forEach>
	</select>
	
</fieldset>

<fieldset>
	<legend>예약 내용</legend>
	<input type="text" name="reserve_contents">

</fieldset>
	
	<input type="hidden" name="emp_name" value="${emp_name}">
	<input type="submit" value="예약 추가">
	
</form>

</body>
</html>