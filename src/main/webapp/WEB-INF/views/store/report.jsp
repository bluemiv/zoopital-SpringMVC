<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
<title>보고서</title>
</head>
<body>
<h1>업무 보고서</h1>
<form action="reportPro.pet">
<div>
병원명:<input type="text" name="report_storeName">
직위:<input type="text" name="report_position">
</div><br><hr>
<div>
<input type="hidden"> 작성자:<input type="text" name="report_writer"> 
</div>
<hr>
<div>
보고내용: <textarea rows="5" cols="30" name="report_contents"></textarea><br><hr>
</div>
<div>
<input type="submit"  value="작성완료">
</div>
</form>
</body>
</html>