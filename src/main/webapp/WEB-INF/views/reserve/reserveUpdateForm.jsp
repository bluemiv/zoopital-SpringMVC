<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<link href="<c:url value="/resources/css/stylish-portfolio.css" />" rel="stylesheet" type="text/css"/>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#search_box").keyup(function() {
				$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
					url : "medicamentSearchAjax.pet",
					method : 'POST',
					type : 'json',
					data : {
						search : $(this).val()
					},
					success : function(result) {
						var contents = '';
						for (var i = 0; i < result.length; i++) {
							contents = contents + result[i] + "<br>";
						}
						$("#search_display").html(contents);
					},
					error : function(result, status, er) {
						$("#search_display").text(er);
					}
				}); // Ajax 응답을 정상적으로 받으면 실행됨.
			});
		});
	</script>
	
<body>

	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
	<!-- 콘텐츠 -->
	
	<div class="col-lg-3 text-center">
				<div class="input-group">
					<form action="medicamentListForm.pet" method="get">
						<span class="input-group-btn">
							<input type="text" name="search" id= "search_box" class="form-control" placeholder="이름 검색">
							<button class="btn btn-custom" type="button">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
						<div id="search_display"></div>
					</form>
				</div>
			</div>


</body>
</html>