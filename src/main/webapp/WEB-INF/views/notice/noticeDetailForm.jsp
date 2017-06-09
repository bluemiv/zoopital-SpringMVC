<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<title>${noticeDTO.notice_title}</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<!-- 토글 -->
	<script type="text/javascript">
		$(function(){
			$("#reply_update_btn_hide").hide();
			$("#reply_contents_hide").hide();
			$("#reply_update_btn_default").click(function(){
				$("#reply_update_btn_hide").show("fast");
				$("#reply_contents_default").hide("fast");
			});
		});
	</script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>공지사항</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<input type = "hidden" value = "${noticeDTO.notice_code}" name = "notice_code">
				<div class="row control-group">
					<div class="form-group col-xs-9 floating-label-form-group controls board-custom">
						<label for="name">글 제목</label>
						<input type = "text" disabled="disabled" value = "${noticeDTO.notice_title}" class="form-control" name = "notice_title" placeholder="제목을 입력해주세요.">
					</div>
					<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
						<label for="name">작성자</label>
						<input type = "text" disabled="disabled" value = "${noticeDTO.notice_writer}" class="form-control" name = "notice_title" placeholder="제목을 입력해주세요.">
					</div>
				</div>
				<div class="row control-group">
					<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
						<label for="name">작성시간</label>
						<input type = "text" disabled="disabled" value = "${noticeDTO.notice_regDate}" class="form-control" name = "notice_title" placeholder="제목을 입력해주세요.">
					</div>
					<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
						<label for="name">조회수</label>
						<input type = "text" disabled="disabled" value = "${noticeDTO.notice_view}" class="form-control" name = "notice_title" placeholder="제목을 입력해주세요.">
					</div>
				</div>
				<div class="row control-group">
					<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
						<label for="name">글내용</label>
						<textarea name = "notice_contents" disabled="disabled" class="form-control" placeholder="내용을 입력해주세요.">${noticeDTO.notice_contents}</textarea>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="form-group col-xs-12">
						<input class = "btn btn-custom btn-md" type="button" onclick = "location='noticeListForm.pet'" value="공지사항 보기">
					</div>
				</div>
				
				<!-- 댓글 쓰기 -->
				<div class="row">
					<div class="form-group col-xs-12">
						<h3>댓글쓰기</h3>
						<hr>
					</div>
				</div>
				<form action="insertReply.pet" method="post">
				<div class="row control-group">
					<input type = "hidden" name="notice_code" value="${noticeDTO.notice_code}"/>
					<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
						<label for="name">댓글 제목</label>
						<input type = "text" class="form-control" name = "reply_title" placeholder="댓글 제목">
					</div>
					<div class="form-group col-xs-3 floating-label-form-group controls">
					</div>
					<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
						<br>
						<input class = "btn btn-custom btn-md" type="submit" value="댓글 등록">
					</div>
				</div>
				<div class="row control-group">
					<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
						<label for="name">댓글 내용</label>
						<textarea name = "reply_contents" class="form-control" placeholder="댓글 내용"></textarea>
					</div>
				</div>
				</form>
				<!-- 댓글 내용 -->
				<div class="row">
					<div class="form-group col-xs-12">
						<h3>댓글</h3>
						<hr>
					</div>
				</div>
				<div class="row">
					<se:authentication property="name" var="username"/>
					<c:forEach items="${replyList}" var = "list">
					<div class="form-group col-xs-12">
						<div class = "col-md-4">
							<h4>작성자 : ${list.reply_writer}</h4>
						</div>
						<div class = "col-md-5">
							<h4>작성날짜 : ${list.reply_regDate}</h4>
						</div>
						<div class = "col-md-3">
						<c:if test="${username == list.reply_writer}">
							<form action="deleteReply.pet" method="post">
							<button data-toggle="collapse" data-parent="#accordion" aria-expanded="false" aria-controls="collapseTwo" class = "btn btn-custom btn-md collapsed" href="#collapseOne${list.reply_code}">수정</button>
								<input type="hidden" value="${noticeDTO.notice_code}" name="notice_code"/>
								<input type="hidden" value="${list.reply_code}" name="reply_code"/>
								<input class = "btn btn-custom btn-md" name="reply_update_btn_hide" type="submit" value="삭제">
							</form>
						</c:if>
						</div>
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<h4>제목 : ${list.reply_title}</h4>
							<h4>내용 : ${list.reply_contents}</h4>
						</div>
						<form action = "updateReply.pet" method="post">
							<div id="collapseOne${list.reply_code}" class="col-md-12 panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<input type="hidden" value="${noticeDTO.notice_code}" name="notice_code"/>
									<input type="hidden" value="${list.reply_code}" name="reply_code"/>
									<textarea name = "reply_contents" class="form-control" placeholder="댓글 내용">${list.reply_contents}</textarea><br>
									<input class = "btn btn-custom btn-md" name="reply_update_btn_hide" type="submit" value="등록">
								</div>
							</div>
						</form>
					</div>
					<hr>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>