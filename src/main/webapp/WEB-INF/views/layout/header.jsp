<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	
	<!-- custom css -->
	<link href="<c:url value="/resources/css/stylish-portfolio.css" />" rel="stylesheet" type="text/css"/>
</head>
<body>
	<se:authentication property="name" var="username"/>
	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
				<a class="navbar-brand" href="/controller/home.pet">
					<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
					Zoopital
				</a>
			</div>
			<se:authorize access="isAuthenticated()">
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<c:url value="/notice/noticeListForm.pet" var = "noticeListForm"></c:url>
					<li><a href="${noticeListForm}">공지사항</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">접수 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:url value="/counter/list.pet" var = "counterList"></c:url>
							<li><a href="${counterList }">진료 접수</a></li>
							<c:url value="/counter/waitingList.pet" var = "counterWaiting"></c:url>
							<li><a href="${counterWaiting}">대기 명단</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">진료 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:url value="/history/treatList.pet" var = "treatList"></c:url>
							<li><a href="${treatList }">진료 보기</a></li>
							<c:url value="/counter/waitingList.pet" var = "counterWaiting"></c:url>
							<li><a href="${counterWaiting}">처방전</a></li>
						</ul>
					</li>
					<c:url value="/medicament/medicamentListForm.pet" var = "medicamentListForm"></c:url>
					<li><a href="${medicamentListForm}">약품</a></li>
					<c:url value="/order/orderInfoForm.pet" var = "orderInfoForm"></c:url>
					<li><a href="${orderInfoForm}">발주</a></li>
					<c:url value="/emp/empListForm.pet" var = "empListForm"></c:url>
					<li><a href="${empListForm}">직원</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">예약관리 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:url value="/reserve/reserveListForm.pet" var = "reserveListForm"></c:url>
							<li><a href="${reserveListForm}">예약 내역</a></li>
							<c:url value="/calendar/calendarForm.pet" var = "calendarForm"></c:url>
							<li><a href="${calendarForm}">달력</a></li>
							<c:url value="/reserve/passReservationList.pet" var = "passReservationList"></c:url>
							<li><a href="${passReservationList}">지난예약내역</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">동물 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:url value="/pet/list.pet" var = "petList"></c:url>
							<li><a href="${petList}">동물 리스트</a></li>
							<c:url value="/pet/writeForm.pet" var = "petWriteForm"></c:url>
							<li><a href="${petWriteForm}">동물 등록</a></li>
						</ul>
					</li>
					<se:authorize access="hasAnyRole('ROLE_SUPER_FULL', 'ROLE_SUPER_FULL')">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">지점 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:url value="/store/selectAll.pet" var = "storeSelectAll"></c:url>
							<li><a href="${storeSelectAll}">지점 목록</a></li>
							<c:url value="/store/inputForm.pet" var = "storeInputForm"></c:url>
							<li><a href="${storeInputForm}">지점 가입</a></li>
						</ul>
					</li>
					</se:authorize>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						보고서 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:url value="/report/getReportList.pet" var = "reportGetReportList"></c:url>
							<li><a href="${reportGetReportList}">보고서 리스트</a></li>
							<c:url value="/report/reportInsert.pet" var = "reportInsert"></c:url>
							<li><a href="${reportInsert}">보고서 쓰기</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							<se:authorize access="isAuthenticated()">${username}</se:authorize>
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<c:url value="/message/messageListForm.pet" var = "messageListForm"></c:url>
							<li><a href="${messageListForm}">쪽지함</a></li>
							<c:url value="/j_spring_security_logout" var = "logout"></c:url>
							<li>
							<a href="${logout}">로그아웃</a>
							</li>
						</ul>
					</li>
					
					
				</ul>
			</div>
			</se:authorize>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<br><br><br>

</body>
</html>