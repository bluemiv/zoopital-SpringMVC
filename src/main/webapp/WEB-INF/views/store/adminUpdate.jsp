<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트 상세 페이지</title>
</head>
<body>
<c:forEach  items="${updatelist}" var="detail">
<form action="adminUpdatPro.pet"  method="post">
지점 코드: ${detail.store_code }<input type="hidden" name="store_code" value="${detail.store_code }"><br>
지점 아이디: <input type="text" name="store_id" value="${detail.store_id }"><br>
지점 패스워드:  <input type="text" name="store_password" value="${detail.store_password }"><br>
지점 이름: <input type="text" name="store_name" value="${detail.store_name }"><br>
지점별 관리비: <input type="text" name="store_cost" value="${detail.store_cost }"><br>
지점별 급여: <input type="text" name="store_payment" value="${detail.store_payment }"><br>
지점별 수입:<input type="text" name="store_income" value="${detail.store_income }"><br>
임대비: <input type="text" name="store_rentCost" value="${detail.store_rentCost }"><br>
지점 의사 이름: <input type="text" name="store_doctor" value="${detail.store_doctor }"><br>
지점 직원 이름:<input type="text" name="store_worker" value="${detail.store_worker }"><br>
<input type= "submit" value="수정완료"/><br>
</form>

</c:forEach>


</body>
</html>