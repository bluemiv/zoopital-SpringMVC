<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>접수하기</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function accept_sub(){
	alert("접수가 완료 되었습니다");
	document.getElementById("frm").submit();
	}
</script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	<form action="insertAccept.pet" method="post" id="frm">
		동물 코드 - <input type="text" value="${pdto.pet_code }" name="petaccept_petcode" readonly="readonly"/><br>
		동물 이름 - <input type="text" value="${pdto.pet_name }" name="pet_name" readonly="readonly"/><br>
		동물 종류 - <input type="text" value="${pdto.pet_type }" name="pet_type" readonly="readonly"/><br>
		동물 성별 - <input type="text" value="${pdto.pet_sex }" name="pet_sex" readonly="readonly"/><br>
		동물 나이 - <input type="text" value="${pdto.pet_age }" name="pet_age" readonly="readonly"/><br>
		접수 내용 <br>
		<textarea name="petaccept_coments" rows="10" style="width:50%;"></textarea><br>
		<input type="button" value="접수완료" onclick="accept_sub()">
	</form>
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>