<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
		$(function() {
			$("#search_box").keyup(function() {
				$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
					url : "http://openapi.gangbuk.go.kr:8088/757952496574683034384e6b767274/json/GbAnimalPharmacy/1/1000",
					method : 'POST',
					type : 'json',
					success : function(result) {
						alert(result);
					},
					error : function(result, status, er) {
						alert(result + status + er);
					}
				}); // Ajax 응답을 정상적으로 받으면 실행됨.
			});
		});
	</script>
</head>
<body>

</body>
</html>