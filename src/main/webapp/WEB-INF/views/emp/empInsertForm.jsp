<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<label for="name">(비)정규직</label>
							<select class="form-control" name = "emp_job">
								<option value = "full" selected="selected">정규직</option>
								<option value = "part">비정규직</option>
							</select>
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
							<input class = "btn btn-custom btn-md" type="submit" value="추가">
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