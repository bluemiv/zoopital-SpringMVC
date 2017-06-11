<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>접수하기</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		function accept_sub(){
		alert("접수가 완료 되었습니다");
		document.getElementById("frm").submit();
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
				<h2>약품 정보</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action="insertAccept.pet" method="post" id="frm">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">담당 선생님</label>
							<select name="emp_name" class="form-control">
								<c:forEach items="${clist }" var="c">
									<option value="${c.emp_name }">${c.emp_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 코드</label>
							<input type="text" value="${pdto.pet_code }" class="form-control" name="petaccept_petcode" readonly="readonly"/>
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 이름</label>
							<input type="text" value="${pdto.pet_name }" class="form-control" name="pet_name" readonly="readonly"/>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 종류</label>
							<input type="text" value="${pdto.pet_type }" class="form-control" name="pet_type" readonly="readonly"/>
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 성별</label>
							<input type="text" value="${pdto.pet_sex }" class="form-control" name="pet_sex" readonly="readonly"/>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 나이</label>
							<input type="text" value="${pdto.pet_age }" class="form-control" name="pet_age" readonly="readonly"/>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="message">접수 내용</label>
							<textarea name="petaccept_coments" class="form-control" rows="10"></textarea>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md"  type="button" value="접수완료" onclick="accept_sub()">
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