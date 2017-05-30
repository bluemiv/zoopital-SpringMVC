<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>직원 등록</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action="empInsertpro.pet" method="post">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">ID</label>
							<input type="text" class="form-control" name="emp_code" placeholder="ID를 입력해주세요." />
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<br>
							<input type = "button" value="중복확인" id = "id_check" class = "btn btn-custom btn-md"/>
							<p id = "id_check_display"></p>
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">password</label>
							<input type="password" class="form-control" name="emp_pwd" placeholder="비밀번호를 입력해주세요." />
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">password 확인</label>
							<input type="password" class="form-control" name="emp_pwd_confirm" placeholder="비밀번호를 재입력해주세요." />
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">이름</label>
							<input type="text" class="form-control" name="emp_name" placeholder="이름을 입력해주세요.">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">나이</label>
							<input type="number" min = "1" class="form-control" name="emp_age" placeholder="나이를 입력해주세요.">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">전화번호</label>
							<input type="text" class="form-control" name="emp_tel" placeholder="전화번호를 입력해주세요. ('-' 없이 입력해주시길 바랍니다.)">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">급여</label>
							<input type="text" class="form-control" name="emp_pay" placeholder="급여를 입력해주세요.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
	
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">(비)활성화</label>
							<select name = "emp_enabled" class="form-control">
								<option value = "1">활성화</option>
								<option value = "0">비활성화</option>
							</select>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">직급</label>
							<select name = "emp_role" class="form-control">
							<se:authorize access="hasAnyRole('ROLE_FULL', 'ROLE_PART')">
								<option value = "ROLE_FULL">정규직</option>
								<option value = "ROLE_PART">비정규직</option>
							</se:authorize>
							<se:authorize access="hasAnyRole('ROLE_SUPER_FULL', 'ROLE_SUPER_PART')">
								<option value = "ROLE_SUPER_FULL">정규직</option>
								<option value = "ROLE_SUPER_PART">비정규직</option>
							</se:authorize>
							</select>
						</div>
					</div>
	
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="직원 등록">
							<input class = "btn btn-custom btn-md" type="reset" value="다시쓰기">
							<input class = "btn btn-custom btn-md" type="button" onclick = "location='empListForm.pet'" value="직원목록보기">
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