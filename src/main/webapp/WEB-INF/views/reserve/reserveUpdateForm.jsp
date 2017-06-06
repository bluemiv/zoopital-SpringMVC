<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
		<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>예약 정보 변경</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action="reserveUpdatePro.pet" method="post">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">예약 동물명</label>
							<input type="text" name="pet_name" readonly="readonly" class="form-control"value="${ reservation.pet_name }" >
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">보호자 연락처</label>
							<input type="text" value="${ reservation.pet_phone }" class="form-control" readonly="readonly">
						</div>
					</div>
					
					 <div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">담당 직원: ${reservation.emp_name }</label>
							<select class="form-control" name = "emp_name">
							<c:forEach items="${empList }" var="empList">
								<%-- <c:if test="'${reservation.emp_name}' != '${empList.emp_name }'">
					 --%>				<option value = ${empList.emp_name }>${empList.emp_name }</option>
						<%-- 		</c:if>
						 --%>	</c:forEach>
							</select>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">날짜</label>
							<input type="date" value="${reservation.reserve_date }" class="form-control" 
							name="reserve_date">
						</div>
						
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">시간</label>
							<select name="reserve_start_time">
								<option value=""></option>
							</select>
							<select name="reserve_end_time">
								<option value=""></option>
							</select>
							<p class="help-block text-danger"></p>
						</div>
					</div>
	
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="message">진료 예약 내용</label>
							<textarea rows="5" class="form-control" >${reservation.reserve_contents }</textarea>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input type="hidden" value="${reservation.reserve_code }" name="reserve_code">
							<input type="submit" class = "btn btn-custom btn-md" value="수정">
							<input class = "btn btn-custom btn-md" type="button" onclick = "location='reserveListForm.pet'" value="예약목록보기">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>