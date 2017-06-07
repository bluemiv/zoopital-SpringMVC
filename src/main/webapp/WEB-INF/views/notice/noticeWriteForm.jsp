<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 쓰기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>공지사항 글쓰기</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form action = "noticeWritePro.pet" method = "post">
					<div class="row control-group">
						<div class="form-group col-xs-9 floating-label-form-group controls board-custom">
							<label for="name">글 제목</label>
							<input type = "text" class="form-control" name = "notice_title" placeholder="제목을 입력해주세요.">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">글내용</label>
							<textarea name = "notice_contents" class="form-control" placeholder="내용을 입력해주세요."></textarea>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="글 등록">
							<input class = "btn btn-custom btn-md" type="reset" value="다시쓰기">
							<input class = "btn btn-custom btn-md" type="button" onclick = "location='noticeListForm.pet'" value="공지사항 보기">
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