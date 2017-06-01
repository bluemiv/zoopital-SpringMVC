<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>네이버 로그인</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	
</head>
<body>
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naver_id_login"></div>
	//네이버아이디로로그인 버튼 노출 영역
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("0xtkCt3a8lxEw7ICxuFa", "http://127.0.0.1:8080/controller/calendar/callback.pet");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 2,40);
		naver_id_login.setDomain("http://127.0.0.1:8080/controller/calendar/callback.pet");
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login();
	</script>
</body>
</html>