<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
</head>
<body>
	<form action="empInsertpro.pet" method="post">
		이름: <input type="text" name="emp_name"><br/>
		코드: <input type="text" name="emp_code"><br/>
		나이: <input type="text"	name="emp_age"><br/>
		전화번호: <input type="text" name="emp_tel"><br/>
		급여: <input type="text" name="emp_pay"><br/>
		지점: <input type="text" name="store_code"><br/>
		
		<input type="submit" value="추가">
	</form>
</body>
</html>