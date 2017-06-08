<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<title>로그인</title>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<script type="text/javascript">
		function pupup(){
			var url = "find/pwSearchForm.pet";
			var name  = "popup";
			window.open(url, name, "width=1000, toolbar=no, status=no, location=no, scrollbars=yes, menubar=no, resizable=yes, left=50, right=50");		
		}
	</script>
	
</head>
<body>
	<div id="top" class="header">
		<!-- 헤더 파일 -->
		<jsp:include page="layout/header.jsp"/>
		
		<!-- 컨텐츠 -->
		<div class="text-vertical-center">
			<h1>동물병원</h1>
			<h3>회원이 아니신가요? 3분이면 <a href="client/clientJoinForm.pet">회원가입</a> 가능합니다.</h3>
			<br>
            <!-- 로그인 -->
            <div class="container-fluid">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="login-panel panel panel-default">
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
										<c:if test="${param.err != null}">
											<font color="red">아이디 또는 비밀번호를 확인해주세요!!</font>
										</c:if>
										<!-- Change this to a button or input when using this as a form -->
										<input type="submit" class="btn btn-lg btn-info btn-block" value = "로그인">
									</fieldset>
								</form>
								<hr>
								<button class="btn btn-lg btn-block btn-custom" onclick="location='client/clientJoinForm.pet'">회원가입</button>
								<button class="btn btn-lg btn-block btn-custom" onclick="pupup()">비밀번호 찾기</button>
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
			<!-- 로그인 END -->
        </div>
    </div>
    <!-- 푸터 파일 -->
	<jsp:include page="layout/footer.jsp"/>
</body>
</html>