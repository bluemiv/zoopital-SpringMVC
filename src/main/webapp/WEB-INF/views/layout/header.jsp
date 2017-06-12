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
					<a class="navbar-brand" href="/controller/webHome.pet">
			               <img alt="Home" width="150" src="<c:url value="/resources/images/logo.png"/>"/>
					</a>
				<se:authorize access="hasAnyRole('ROLE_SUPER_PART','ROLE_SUPER_FULL', 'ROLE_FULL', 'ROLE_PART')">
				<a class="navbar-brand" href="/controller/home.pet">
					 <img alt="Home" width="70" class="img-default" src="<c:url value="/resources/images/admin.png"/>"/>
				</a>
				</se:authorize>
			</div>
			<se:authorize access="isAuthenticated()">
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<se:authorize access="hasAnyRole('ROLE_SUPER_PART','ROLE_SUPER_FULL', 'ROLE_FULL', 'ROLE_PART')">
					<c:if test="${username != 'system'}">
					<c:url value="/notice/noticeListForm.pet" var = "noticeListForm"></c:url>
					<li><a href="${noticeListForm}">공지사항</a></li>
					<c:url value="/shot/shotList.pet" var = "shotList"></c:url>
					<li><a href="${shotList}">예방접종</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">접수 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:url value="/counter/list.pet" var = "counterList"></c:url>
							<li><a href="${counterList }">진료 접수</a></li>
							<c:url value="/counter/waitingList.pet" var = "counterWaiting"></c:url>
							<li><a href="${counterWaiting}">대기 명단</a></li>
							<c:url value="/counter/payingList.pet" var = "payingView"></c:url>
							<li><a href="${payingView}">수납</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">진료 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:url value="/history/treatList.pet" var = "treatList"></c:url>
							<li><a href="${treatList }">진료 보기</a></li>
							<c:url value="/history/selectallhistory.pet" var = "selectAll"></c:url>
							<li><a href="${selectAll}">처방전</a></li>
						</ul>
					</li>
					<c:url value="/medicament/medicamentListForm.pet" var = "medicamentListForm"></c:url>
					<li><a href="${medicamentListForm}">약품</a></li>
					<c:url value="/order/orderInfoForm.pet" var = "orderInfoForm"></c:url>
					<li><a href="${orderInfoForm}">발주</a></li>
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
					<c:url value="/emp/empListForm.pet" var = "empListForm"></c:url>
					<li><a href="${empListForm}">직원</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">동물 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:url value="/pet/list.pet" var = "petList"></c:url>
							<li><a href="${petList}">동물 리스트</a></li>
							<c:url value="/pet/writeForm.pet" var = "petWriteForm"></c:url>
							<li><a href="${petWriteForm}">동물 등록</a></li>
						</ul>
					</li>
					</c:if>
					<c:if test="${username == 'system'}">
					<c:url value="/emp/empInsertForm.pet" var = "empInsertForm"></c:url>
					<li><a href="${empInsertForm}">직원추가</a></li>
					</c:if>
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
					</se:authorize>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							<se:authorize access="isAuthenticated()">${username}</se:authorize>
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<c:if test="${username != 'system'}">
							<!-- 직원들만 볼 수 있음 -->
							<se:authorize access="hasAnyRole('ROLE_SUPER_PART','ROLE_SUPER_FULL', 'ROLE_FULL', 'ROLE_PART')">
								<c:url value="/message/messageListForm.pet" var = "messageListForm"></c:url>
								<li><a href="${messageListForm}">쪽지함</a></li>
								<hr>
								<c:url value="/saleslog/dailylog.pet" var = "dailylog"></c:url>
								<li><a href="${dailylog}">일일매출</a></li>
								<c:url value="/saleslog/dailyChart.pet" var = "dailyChart"></c:url>
								<li><a href="${dailyChart}">매출차트</a></li>
								<hr>
								<c:url value="/report/getReportList.pet" var = "reportGetReportList"></c:url>
								<li><a href="${reportGetReportList}">보고서 리스트</a></li>
								<c:url value="/report/reportInsert.pet" var = "reportInsert"></c:url>
								<li><a href="${reportInsert}">보고서 쓰기</a></li>
								<hr>
							</se:authorize>
							<!-- 고객만 볼 수 있음 -->
							<se:authorize access="hasRole('ROLE_CLIENT')">
								<c:url value="/client/clientMypageForm.pet" var = "clientMypageForm"></c:url>
								<li><a href="${clientMypageForm}">마이페이지</a></li>
								<hr>
								<c:url value="/client/buyList/buyListForm.pet" var = "buyListForm"></c:url>
								<li><a href="${buyListForm}">구매목록</a></li>
								<c:url value="/client/basket/baksetListForm.pet" var = "baksetListForm"></c:url>
								<li><a href="${baksetListForm}">장바구니</a></li>
							</se:authorize>
							</c:if>
							<c:url value="/j_spring_security_logout" var = "logout"></c:url>
							<li> <a href="${logout}">로그아웃</a></li>
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