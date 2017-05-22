<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="search.pet">
검색기능<input type="text"  name="store_name"  >
<input type="submit" >
</form>
<c:forEach items="${searchList}" var="list">
${list.store_code }<br>
${list.store_id}<br>
</c:forEach>
<hr><hr>
</body>
</html>