<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>

<script type="text/javascript">

	function test(){
		var frm = document.getElementById("frm");
		frm.action = "empInsertpro.pet";
		document.frm.submit();
	}
	
</script>
	
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<form name="frm" id="frm" method="post">
		이름: <input type="text" name="emp_name"><br/>
		코드: <input type="text" name="emp_code"><br/>
		나이: <input type="text"	name="emp_age"><br/>
		전화번호: <input type="text" name="emp_tel"><br/>
		급여: <input type="text" name="emp_pay"><br/>
		
		<input type="button" value="추가" onclick="test()">
		
	</form>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>