<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminList 페이지 입니다.</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
<form action="search.pet">
지점 이름을 검색하세요:<input type="text"  name="store_name" >
<input type="submit" value="검색" >    
<button onclick = "location='selectAll.pet">목록으로 돌아가기</button>
</form>
<c:forEach items="${searchList}" var="search">
지점 코드 및 ID: ${search.store_code}<br>
지점 이름: ${search.store_name}<br>
지점별 관리비: ${search.store_cost}<br>
지점별 급여: ${search.store_payment}<br>
지점별 수입: ${search.store_income}<br>
임대비: ${search.store_rentCost}<br>
지점 의사: ${search.store_doctor}<br>
지점 직원: ${search.store_worker}<br>
가입날짜: ${search.store_date }<br>
<button onclick = "location='adminUpdate.pet?store_code=${search.store_code}'">수정</button>
<button onclick = "location='deletePro.pet?store_code=${search.store_code}'">삭제</button>
<hr>
</c:forEach>

<c:forEach  items="${adminList}" var="list">
지점 코드 및 ID: ${list.store_code}<br>
지점 이름: ${list.store_name}<br>
지점별 관리비: ${list.store_cost}<br>
지점별 급여: ${list.store_payment}<br>
지점별 수입: ${list.store_income}<br>
임대비: ${list.store_rentCost}<br>
지점 의사: ${list.store_doctor}<br>
지점 직원: ${list.store_worker}<br>
가입날짜: ${list.store_date }<br>
<button onclick = "location='adminUpdate.pet?store_code=${list.store_code}'">수정</button>
<button onclick = "location='deletePro.pet?store_code=${list.store_code}'">삭제</button>
<hr>
</c:forEach>
<c:forEach var = "pageNum" begin= "1" end = "${totalPageNum}">
[<a href= "selectAll.pet?pageNum=${pageNum}">${pageNum}</a>]
</c:forEach>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>