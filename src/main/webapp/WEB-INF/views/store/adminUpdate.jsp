<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지정 정보 수정</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>지점 정보 수정</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action = "adminUpdatPro.pet" method = "post">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">지점 ID</label>
							<input type = "text" class="form-control" value = "${storeDTO.store_code }" id = "store_code" name = "store_code" required="required" placeholder="지점 코드를 입력해주세요">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">지점 명</label>
							<input type = "text" name = "store_name" value="${storeDTO.store_name }" class="form-control" required="required" placeholder="병원이름을 입력해주세요">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">권한</label>
							<select name = "store_role" class="form-control" required="required">
								<option value="ROLE_SUPER_FULL">본사</option>
								<option value="ROLE_FULL">지점</option>
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
							<input type = "text" name = "store_cost" value="${storeDTO.store_cost }" class="form-control">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="message">임대비</label>
							<input type = "text" name = "store_rentCost" value="${storeDTO.store_rentCost }" class="form-control">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="수정 완료">
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