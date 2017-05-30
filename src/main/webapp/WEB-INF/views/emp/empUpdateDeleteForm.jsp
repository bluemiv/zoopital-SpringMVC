<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>직원정보</title>
<script type="text/javascript">
	function test(action){
		if(action == 1){
			document.getElementById("command").value = "update";
		} 
		if(action == 2){
			document.getElementById("command").value = "delete";
		}
		document.getElementById("form1").submit();
	}
</script>

</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>직원 정보 상세 보기</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form id="form1" action="empUpdateDeletePro.pet" method="post">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">직원 ID</label>
							<input type="text" name="emp_code" readonly="readonly" class="form-control"value="${ selectEmp.emp_code }" >
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">(비)정규직</label>
							<select class="form-control" name = "emp_role">
							<c:if test="${selectEmp.emp_role == 'ROLE_FULL' || selectEmp.emp_role == 'ROLE_PART'}">
								<option value = "ROLE_FULL">정규직</option>
								<option value = "ROLE_PART">비정규직</option>
							</c:if>
							<c:if test="${selectEmp.emp_role == 'ROLE_SUPER_FULL' || selectEmp.emp_role == 'ROLE_SUPER_PART'}">
								<option value = "ROLE_SUPER_FULL">정규직</option>
								<option value = "ROLE_SUPER_PART">비정규직</option>
							</c:if>
							</select>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">고용일</label>
							<input type="text" value="${ selectEmp.emp_hiredate }" class="form-control" readonly="readonly">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">지점 Password</label>
							<input type = "password" id = "pwd" name = "emp_pwd" required="required" class="form-control" placeholder="비밀번호를 입력해주세요">
							<p id = "pwd_check_display"></p>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">Password 확인</label>
							<input type = "password" id = "pwd_confirm" name = "emp_pwd_confirm" required="required" class="form-control" placeholder="다시한번 비밀번호를 입력해주세요">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">이름</label>
							<input type="text" value="${ selectEmp.emp_name }" class="form-control" 
							name="emp_name" placeholder="이름을 입력해주세요.">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">나이</label>
							<input type="number" min = "1" class="form-control" value="${ selectEmp.emp_age }"
							name="emp_age" placeholder="나이를 입력해주세요.">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">전화번호</label>
							<input type="text" class="form-control" value="${ selectEmp.emp_tel }" 
							name="emp_tel" placeholder="전화번호를 입력해주세요. ('-' 없이 입력해주시길 바랍니다.)">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">급여</label>
							<input type="text" class="form-control" value="${ selectEmp.emp_pay }"
							name="emp_pay" placeholder="급여를 입력해주세요.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
	
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="message">기타사항</label>
							<textarea rows="5" class="form-control"></textarea>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input type="hidden" name = "command" id="command"/>
							<button class = "btn btn-custom btn-md" onclick="test(1)">수정</button>
							<button class = "btn btn-custom btn-md" onclick="test(2)">삭제</button>
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