<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${medicamentDTO.medicament_name}</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<table width="100%" class="table table-striped table-bordered table-hover"
		id="dataTables-example">
		<thead>
			<tr class="info">
				<th>약품 코드</th>
				<th>약품 이름</th>
				<th>개수</th>
				<th>가격</th>
				<th>종류</th>
				<th>제조일자</th>
				<th>유통기한</th>
				<th>지점코드</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${medicamentDTO.medicament_code}</td>
				<td>${medicamentDTO.medicament_name}</td>
				<td>${medicamentDTO.medicament_amount}</td>
				<td class="center">${medicamentDTO.medicament_cost}원</td>
				<td class="center">${medicamentDTO.medicament_category}</td>
				<td class="center">${medicamentDTO.medicament_mandate}</td>
				<td class="center">${medicamentDTO.medicament_exdate}</td>
				<td class="center">${medicamentDTO.store_code}</td>
			</tr>
		</tbody>
	</table>
	<input type = "hidden" value = "${medicamentDTO.medicament_cost}" id = "cost">
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>