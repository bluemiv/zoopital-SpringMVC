<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 홈페이지 입니다</title>
</head>
<body>
<form action="input.pet"  method="post">
지점 코드: <input type="text" name="store_code"><br>
지점 아이디: <input type="text" name="store_id"><br>
지점 패스워드:  <input type="text" name="store_password"><br>
지점 이름: <input type="text" name="store_name"><br>
지점별 관리비: <input type="text" name="store_cost"><br>
지점별 급여: <input type="text" name="store_payment"><br>
지점별 수입:<input type="text" name="store_income"><br>
임대비: <input type="text" name="store_rentCost"><br>
지점 의사 이름: <input type="text" name="store_doctor"><br>
지점 직원 이름:<input type="text" name="store_worker"><br>
<input type= "submit" value="회원가입"/>
</form>

</body>
</html>