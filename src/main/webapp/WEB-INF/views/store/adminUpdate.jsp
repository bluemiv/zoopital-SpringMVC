<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트 상세 페이지</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<form class="form-horizontal" action = "adminUpdatPro.pet" method = "post">
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				지점 코드
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "store_code" readonly="readonly" value = "${storeDTO.store_code }" class="form-control">
				<span class="input-group-addon">한/A</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				지점 ID
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "store_id" required="required" value="${storeDTO.store_id }" class="form-control">
				<span class="input-group-addon">한/A</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				지점 Password
			</label>
			<div class="col-sm-3 input-group">
				<input type = "password" name = "store_password" required="required" value="${storeDTO.store_password }" class="form-control">
				<span class="input-group-addon">원</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				지점 명
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "store_name" value="${storeDTO.store_name }" class="form-control">
				<span class="input-group-addon">한/A</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				관리비
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "store_cost" value="${storeDTO.store_cost }" class="form-control">
				<span class="input-group-addon">만원</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				직원 급여
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "store_payment" value="${storeDTO.store_payment }" class="form-control">
				<span class="input-group-addon">만원</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				총 수입
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "store_income" value="${storeDTO.store_income }" class="form-control">
				<span class="input-group-addon">만원</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				임대비
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "store_rentCost" value="${storeDTO.store_rentCost }" class="form-control">
				<span class="input-group-addon">만원</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				정규직 인원
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "store_doctor" value="${storeDTO.store_doctor }" class="form-control">
				<span class="input-group-addon">명</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				비정규직 인원
			</label>
			<div class="col-sm-3 input-group">
				<input type = "text" name = "store_worker" value="${storeDTO.store_worker }" class="form-control">
				<span class="input-group-addon">명</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				권한
			</label>
			<div class="col-sm-3 input-group">
				<select name = "admin_role" class="form-control">
					<option value = "ROLE_SUPER_ADMIN">수퍼 관리자</option>
					<option value = "ROLE_ADMIN">일반 관리자</option>
				</select>
				<span class="input-group-addon">권한</span>
			</div>
		</div>
		<div class="form-group has-success has-feedback">
			<label class="control-label col-sm-2">
				(비)활성화
			</label>
			<div class="col-sm-3 input-group">
				<select name = "admin_enabled" class="form-control">
					<option value = "1">활성화</option>
					<option value = "0">비활성화</option>
				</select>
				<span class="input-group-addon">권한</span>
			</div>
		</div>
		<div>
			<div class="col-sm-5 blockquote-reverse">
				<input type = "submit" class="btn btn-md btn-info" value = "수정 완료">
			</div>
		</div>
	</form>

</body>
</html>