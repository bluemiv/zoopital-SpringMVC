<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>이메일 보내기</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action = "sendMail.pet" method = "post">
					<div class="row control-group">
						<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
							<label for="name">보내는 사람</label>
							<input type = "text" name="send_email" class="form-control">
						</div>
						<div class="form-group col-xs-1 floating-label-form-group controls">
							<br><label for="name">@</label>
						</div>
						<div class="form-group col-xs-5 floating-label-form-group controls board-custom">
							<br>
							<select name = "email_host" class="form-control">
								<option value = "naver.com">네이버(naver.com)</option>
								<option value = "hanmail.net">다음(hanmail.net)</option>
							</select>
						</div>
						<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
							<label for="name">이메일 비밀번호</label>
							<input type = "password" name="send_pwd" class="form-control">
						</div>
					</div>
				
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">받는 사람</label>
							<input type = "email" class="form-control" name="receive_email">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">제목</label>
							<input type = "text" name="title" class="form-control">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">내용</label>
							<textarea name="contents" class="form-control"></textarea>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="보내기">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="layout/footer.jsp"/>
</body>
</html>
