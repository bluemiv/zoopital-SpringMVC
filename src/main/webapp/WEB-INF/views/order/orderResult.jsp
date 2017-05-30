<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<c:if test="${check == true }">
		<script type="text/javascript">
			alert("완료");
		</script>
	</c:if>
	<c:if test="${check == false }">
		<script type="text/javascript">
			alert("에러");
		</script>
	</c:if>
	<meta http-equiv="Refresh" content="0; url='orderInfoForm.pet'"/>
</body>
</html>