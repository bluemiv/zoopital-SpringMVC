<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<title>로그인</title>
</head>
<body>
<!-- 헤더 파일 -->
<jsp:include page="layout/header.jsp"/>

<!-- 컨텐츠 -->
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">동물병원 관리 프로그램</h3>
				</div>
				<div class="panel-body">
				<se:authorize access="isAnonymous()">
					<c:url value="/j_spring_security_check" var = "loginURL"/>
					<form role="form" action="${loginURL}" method="post">
						<fieldset>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Input your ID"
									name="username" autofocus>
							</div>
							<div class="form-group">
								<input type="password" name="password" class="form-control"
									placeholder="Input your Password">
							</div>
							<div class="checkbox">
								<label> <input name="remember" type="checkbox" value="Remember Me">Remember Me
								</label>
							</div>
							<c:if test="${param.err != null}">
								<p>아이디 또는 비밀번호를 확인해주세요!</p>
							</c:if>
							<!-- Change this to a button or input when using this as a form -->
							<input type="submit" class="btn btn-lg btn-success btn-block" value = "로그인">
						</fieldset>
					</form>
				</se:authorize>
				<se:authorize access = "isAuthenticated()">
					<button onclick= "location='j_spring_security_logout'"
					class="btn btn-lg btn-success btn-block">로그아웃</button>
					<meta http-equiv="Refresh" content="0; url='home.pet'"/>
				</se:authorize>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>