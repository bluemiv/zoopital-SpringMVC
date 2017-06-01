<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<title>공지사항</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>공지사항</h2>
				<hr>
			</div>
			<!-- 두번째 줄 -->
			<div class="col-lg-7 text-center">
			</div>
			<div class="col-lg-3 text-center">
				<div class="input-group">
					<form action="noticeListForm.pet" method="get">
						<span class="input-group-btn">
							<input type="text" name="search" id= "search_box" class="form-control" placeholder="글 제목 검색">
							<button class="btn btn-custom" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
						<div id="search_display"></div>
					</form>
				</div>
			</div>
			<div class="col-lg-2 text-center">
				<button onclick = "location='noticeWriteForm.pet'" class="btn btn-md btn-custom">글 쓰기</button>
			</div>
		</div>
		
		<div class="row">
			<table width="100%" class="table table-striped table-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>작성 날짜</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>기타</th>
					</tr>
				</thead>
				<tbody>
				<se:authentication property="name" var = "username"/>
				<c:forEach items="${list}" var ="var">
					<tr class = "board-custom">
						<td>${var.notice_regDate}</td>
						<td>${var.notice_title} <font color = "blue"> [ ${var.notice_reply} ]</font></td>
						<td>${var.notice_writer}</td>
						<td>${var.notice_view}</td>
						<td class="form-inline">
						<c:if test = "${username == var.notice_writer}">
							<button class="btn btn-md btn-custom"
							onclick = "location='noticeUpdateForm.pet?notice_code=${var.notice_code}'">
							수정 <span class="glyphicon glyphicon-random"></span></button>
							<button class="btn btn-md btn-custom"
							onclick = "location='noticeDeletePro.pet?notice_code=${var.notice_code}'">
							<span class="glyphicon glyphicon-trash"></span></button>
						</c:if>
							<button class="btn btn-md btn-custom"
							onclick = "location='noticeDetailForm.pet?notice_code=${var.notice_code}&state=list'">
							상세보기<span class="glyphicon glyphicon-list-alt"></span></button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class = "row">
			<div class="col-lg-7">
			</div>
			<div class="form-inline col-lg-5">
				<ul class="pagination">
					<c:if test="${currentPageNum > '1'}">
					<li><a href="noticeListForm.pet?pageNum=${currentPageNum-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					</c:if>
					<c:forEach begin="1" end="${page.pageTotalNum}" var="pageNum">
						<li><a href="noticeListForm.pet?pageNum=${pageNum}">${pageNum}</a></li>
					</c:forEach>
					<c:if test="${page.pageTotalNum > currentPageNum}">
					<li><a href="noticeListForm.pet?pageNum=${currentPageNum+1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>