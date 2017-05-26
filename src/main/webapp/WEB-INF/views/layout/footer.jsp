<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
	<script>
		function printTime() {
			var clock = document.getElementById("clock"); // 출력할 장소 선택
			var now = new Date(); // 현재시간
			var nowTime = now.getFullYear() + "년" + (now.getMonth() + 1) + "월"
					+ now.getDate() + "일" + now.getHours() + "시" + now.getMinutes()
					+ "분" + now.getSeconds() + "초";
			clock.innerHTML = nowTime; // 현재시간을 출력
			setTimeout("printTime()", 1000); // setTimeout(“실행할함수”,시간) 시간은1초의 경우 1000
		}
		window.onload = function() { // 페이지가 로딩되면 실행
			printTime();
		}
	</script>
</head>
<body>
	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1 text-center">
					<h4>
						<strong>KOSTA</strong>
					</h4>
					<p>
						성남시 분당구 삼평동 판교 테크노밸리 <br>147th KOSTA
					</p>
					<ul class="list-unstyled">
						<li>
							<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
							(010) 3920-8518
						</li>
						<li>
							<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
							<a href="mailto:7538518@naver.com">753851@naver.com</a>
						</li>
					</ul>
					<hr class="small">
					<p class="text-muted">Copyright &copy; KOSTA 147th 2017</p>
					<p class="text-muted">
						<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
						현재시간 : <span id="clock"></span>
					</p>
				</div>
			</div>
		</div>
		<a id="to-top" href="#top" class="btn btn-dark btn-lg"><i
			class="fa fa-chevron-up fa-fw fa-1x"></i></a>
	</footer>
</body>
</html>