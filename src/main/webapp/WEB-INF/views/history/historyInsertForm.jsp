<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>처방전 입력</title>

<script type="text/javascript">
/*	div생성을 통해서 해보려다가 실패.. 그래도 다음에 바꿀 수 있으면 바꿔봐야지
	
	function add_item(){
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('pre_set').innerHTML;
		document.getElementById('field').appendChild(div);
	}
	
	function remove_item(obj){
		
		document.getElementById('field').removeChild(obj.parentNode);
	} */
	function plus(prams){
		var am_amount = document.getElementsByName("am_amount");
		var am_cost = document.getElementsByName("am_cost");
		var am_count = document.getElementsByName("am_count");
		/* var amtotal_cost = document.getElementById("amtotal_cost").value; */
		
		if(Number(am_count[prams-1].value) >= Number(am_amount[prams-1].value)){
			alert("재고를 초과하였습니다.");
			return;
		}else{
			am_count[prams-1].value = Number(am_count[prams-1].value) + 1;
			document.getElementById("amtotal_cost").value = Number(document.getElementById("amtotal_cost").value) + Number(am_cost[prams-1].value);
			
		}
		
	}
	function minus(prams){
		var am_amount = document.getElementsByName("am_amount");
		var am_cost = document.getElementsByName("am_cost");
		var am_count = document.getElementsByName("am_count");
		
		if(0 >= Number(am_count[prams-1].value)){
			alert("0보다 작은 양은 추가할 수 없습니다.");
			return;
		}else{
			am_count[prams-1].value = Number(am_count[prams-1].value)-1;
			document.getElementById("amtotal_cost").value = Number(document.getElementById("amtotal_cost").value) - Number(am_cost[prams-1].value);
		}
	}
	function add_submit(){
		var listname = document.getElementsByName("test");
		if(listname[0].value != ""){
		var frm = document.getElementById("frm");
		frm.action="historyinsert.pet";
		document.frm.submit();
		}else{
			alert("약품을 선택하지 않았습니다.");
			return;
		}
	}
	function del_submit(prams){
		document.getElementById("del_num").value = prams;
		var frm = document.getElementById("frm");
		frm.action="dhistoryinsert.pet";
		document.frm.submit();
	}
	function ins_submit(){
		var frm = document.getElementById("frm");
		frm.action="inserthistoryend.pet";
		document.frm.submit();
	}
	
</script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
	<h3>처방전 입력구간!!!!!!!!!</h3>
	<!-- <form action="inserthistoryend.pet" id="mcheck" name="mcheck"> -->
	<form  id="frm" name="frm" method="post">
	담당 의사 --- <input type="text" name="emp_name" value="${cdto.emp_name }" readonly="readonly"><br>
	강아지 코드 --- <input type="text" name="pet_code" id="pet_code" value="${pdto.pet_code }" readonly="readonly"><br>
	강아지 이름 --- <input type="text" name="pet_name" id="pet_name" value="${pdto.pet_name }" readonly="readonly"><br>
	강아지 종류 --- <input type="text" name="pet_type" id="pet_type" value="${pdto.pet_type }" readonly="readonly"><br>
	강아지 성별 --- <input type="text" name="pet_sex" id="pet_sex" value="${pdto.pet_sex }" readonly="readonly"><br>
	강아지 나이 --- <input type="text" name="pet_age" id="pet_age" value="${pdto.pet_age }" readonly="readonly"><br>
	약품 선택  ---- <input type="text" list="mlist" name="test"/>
	<input type="hidden" name="petaccept_code" value="${cdto.petaccept_code }" />
	<datalist id="mlist">
		<c:forEach items="${mdto }" var="m">
			<option value="${m.medicament_name }">가격 : ${m.medicament_cost } || 재고 : ${m.medicament_amount }</option>
		</c:forEach>
	</datalist>
	<!-- test 이름 통해서 DB쿼리 돌려서 약품db끌어온 후 forEach돌리기! -->
	<input type="button" value="추가" onclick="add_submit()">
	<c:forEach items="${addmdto }" var="am" varStatus="i">
		<br>
		<input type="text" name="test" value="${am.medicament_name}" readonly="readonly">
		<input type="hidden" value="${am.medicament_cost }" name="am_cost">
		<input type="hidden" value="${am.medicament_amount }" name="am_amount">
		<input type="button" value="-" onclick="minus(${i.count})"/>
		<input type="text" name="am_count" value="${am.am_count }" size="5" readonly="readonly"/>
		<input type="button" value="+" onclick="plus(${i.count})"/>
		<input type="button" value="삭제" onclick="del_submit(${i.count})"/>
	</c:forEach>
		<input type="hidden" value="0" name="del_num" id="del_num"/>
	<br>
	약품 가격 - <input type="text" value="${cdto.m_total_cost }" id="amtotal_cost" name="m_total_cost" readonly="readonly"/><br>
	진료 가격 - <input type="text" value="${cdto.treat_cost }" name="treat_cost">
	<!-- forEach 돌린 후 name 을 넘겨주는데.. 아마 배열처럼 넘어가겠지?? 그럼 Controller에서 Token해주자......그럼 될 듯..? -->
	<!-- <input type="button" value=" 추가 " onclick="add_item()"/><br>
	<div id="field"></div> -->
	<textarea name="pethistory_coments" rows="10" style="width:100%;"></textarea>
	<input type="hidden" name="pethistory_petcode" value="${pdto.pet_code }"><br>
	<!-- <input type="submit" value="입력완료"/> -->
	<input type="button" value="입력완료" onclick="ins_submit()">
	</form>
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>