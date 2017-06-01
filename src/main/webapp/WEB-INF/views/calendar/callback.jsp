<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("0xtkCt3a8lxEw7ICxuFa", "http://127.0.0.1:8080/controller/home.pet");
		
		// 접근 토큰 값 출력
		alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			alert(naver_id_login.getProfileData('email'));
			alert(naver_id_login.getProfileData('nickname'));
			alert(naver_id_login.getProfileData('age'));
		}
		
		$(function(){
			$.ajax({
				url : "naverCalendarForm.pet",
				method : 'POST',
				type : 'json',
				data : {access_token : naver_id_login.oauthParams.access_token},
				success : function(result) {
					alert(result);
				},
				error : function(result, status, er) {
					alert(result + status + er);
				}
			});
		});

	</script>
</body>
</html>