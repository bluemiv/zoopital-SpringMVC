<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	function test(action){
		/* var input = document.getElementById("command"); */
		if(action == 1){
			document.getElementById("command").value = "update";
		} 
		if(action == 2){
			document.getElementById("command").value = "delete";
		}
		/* alert(input.value); */
		document.getElementById("form1").submit();
	}
</script>

</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
<fieldset>
<legend>직원 목록</legend>

<hr>
	<form id="form1" action="empUpdateDeletePro.pet" method="post">
		<c:forEach items="${selectEmpList}" var="emp">

			이름: <input type="text" name="emp_name" value="${ emp.emp_name }">
					<br />
			코드: <input type="text" name="emp_code" value="${ emp.emp_code }" readonly="readonly">
					<br />
			나이: <input type="text" name="emp_age" value="${ emp.emp_age }">
					<br />
			전화번호: <input type="text" name="emp_tel" value="${ emp.emp_tel }">
					<br />
			급여: <input type="text" name="emp_pay" value="${ emp.emp_pay }">
					<br />
			지점: <input type="text" name="store_code" value="${ emp.store_code }">
					<br />
			
			<input type="hidden" name = "command" id="command"/>
			<button onclick="test(1)">update</button>
			<button onclick="test(2)">delete</button>
			<!-- <input type="button" value="수정" onclick="submit(1)"/>
			<input type="button" value="삭제" onclick="submit(2)"/> -->
			<hr>
		</c:forEach>
	</form>
		<!-- <button onclick="location='empUpdateDeletePro.pet?command=update'">수정</button>
		<button onclick="location='empUpdateDeletePro.pet?command=delete'">삭제</button> -->
	</fieldset>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>