<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
	
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>이 달의 예방접종 리스트</h2>
				<hr>
			</div>
			<!-- 두번째 줄 -->
			<div class="col-lg-9 text-center">
			</div>
			<div class="col-lg-3 text-center">
				<div class="input-group">
				</div>
			</div>
		</div>
	
		<div class="row">
			<table width="100%" class="table table-stripedtable-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>주사</th>
						<th>주사 주기</th>
						<th>펫 코드</th>
						<th>펫 이름</th>
						<th>맞은 날짜</th>
						<th>맞아야 할 날짜</th>
						<th>보호자 연락처</th>
						<th>메일 보내기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ list }" var="list" >
					 	<c:if test="${  currentTime <= list.shot_must && list.shot_must <= lastDay }">
						<tr class = "board-custom">
						<td>${ list.shot_name }</td>
						<td>${ list.shot_cycle }</td>
						<td>${ list.pet_code }</td>
						<td>${ list.shot_petName }</td>
						<td>${ list.shot_date }</td>
						<td>${ list.shot_must }</td>
						<td>${ list.pet_phone }</td>
						<td>
							<form action="../sendMail.pet" method ="post">
								<input type = "hidden" name="state" value="shot"/>
								<label for="name">보내는 사람</label>
								<input type = "text" name="send_email" class="form-control">
								<select name = "email_host" class="form-control">
									<option value = "naver.com">네이버(naver.com)</option>
									<option value = "hanmail.net">다음(hanmail.net)</option>
								</select>
								<label for="name">이메일 비밀번호</label>
								<input type = "password" name="send_pwd" class="form-control">
							
								<label for="name">받는 사람</label>
								<input type = "hidden" value="${ list.pet_email }" class="form-control" name="receive_email">
							
								<label for="name">제목</label>
								<input type = "hidden" value="${list.shot_name} 주인님 예방접종 맞아야합니다!" name="title">
							
								<label for="name">내용</label>
								<input type ="hidden" value="
								안녕하세요. ${ list.shot_name }님! ^^
								${ list.shot_petName }(이)가 ${ list.shot_date }에 ${list.shot_name}을 맞았습니다.
								${ list.shot_cycle }개월마다 맞아야하기 때문에 다시 한번 찾아와 주세요!"
								name="contents" rows="13"/>
								<input class = "btn btn-custom btn-md" type="submit" value="보내기">
							</form>
						</td>
						
						</tr>
						</c:if> 
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>