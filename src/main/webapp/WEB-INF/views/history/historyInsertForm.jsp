<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	function sub(){
		var listname = document.getElementsByName("test");
		/* 약품을 선택했을때만 제대로 동작하기 위해(500에러 방지) */
		/* for(var i=0; i<listname.length; i++){
		alert(i + "요소 : " + listname[i].value);
		} */
		if(listname[0].value != ""){
		/* listname으로 받아온 배열을 ,기호를 붙여 controller로 전송한뒤 Tokenizer를 통해 분리하기 위해
		스트링을 생성해주는 과정 */
		var sendData = "";
		for(var i=listname.length-1; i>=0; i--){
			sendData += listname[i].value;
			if(i==0){
			}else{
				sendData += ",";
			}
		}
		/* location으로 보낼 값들을 한번에 스트링으로 저장해서 보내기위해서 */
		var route = "historyinsert.pet?test=" + sendData + "&code=" + document.getElementById("pet_code").value;
		location.href = route;
		}else{
			alert("약품을 선택하지 않았습니다.");
			return;
		}
	}
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
	function del(prams){
		/* 배열이 계속 뒤로 밀리기 때문에 총 length에서 params 값을 빼줘서 요서에 맞는 배열을 삭제한다. */
		alert("매개변수 값 : " + prams);
		var listname = document.getElementsByName("test");
		var temp_listname = [];
		for(var j=0; j<=listname.length-1; j++){
			temp_listname.push(listname[j]);
		}
		
		temp_listname.splice(prams,1);
		
		var sendData = "";
		if(listname.length == 2){
			alert("여기들어오니?");
			sendData = "없음";
		}else{
		for(var i=temp_listname.length-1; i>=0; i--){
			sendData += temp_listname[i].value;
			if(i==0){
			}else{
				sendData += ",";
			}
		}
		}
		alert("넘기는 값 : " + sendData);
		var route = "historyinsert.pet?test=" + sendData + "&code=" + document.getElementById("pet_code").value;
		location.href = route;
	}
	function add_submit(){
		alert("test동작");
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
	
</script>
</head>
<body>
	<h3>처방전 입력구간!!!!!!!!!</h3>
	<!-- <form action="inserthistoryend.pet" id="mcheck" name="mcheck"> -->
	<form  id="frm" name="frm" method="post">
	강아지 코드 --- ${pdto.pet_code }<br>
	강아지 이름 --- ${pdto.pet_name }<br>
	강아지 종류 --- ${pdto.pet_type }<br>
	강아지 성별 --- ${pdto.pet_sex }<br>
	강아지 나이 --- ${pdto.pet_age }<br>
	<input type="hidden" name="pet_code" id="pet_code" value="${pdto.pet_code }">
	<input type="text" name="pethistory_medicine"><br>
	<input type="text" list="mlist" name="test"/>
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
		<input type="text" name="am_count" value="0" size="5" readonly="readonly"/>
		<input type="button" value="+" onclick="plus(${i.count})"/>
		<input type="button" value="삭제" onclick="del_submit(${i.count})"/>
	</c:forEach>
		<input type="hidden" value="0" name="del_num" id="del_num"/>
	<br>
	<input type="text" value="0" id="amtotal_cost" name="m_total_cost" readonly="readonly"/>
	<!-- forEach 돌린 후 name 을 넘겨주는데.. 아마 배열처럼 넘어가겠지?? 그럼 Controller에서 Token해주자......그럼 될 듯..? -->
	<!-- <input type="button" value=" 추가 " onclick="add_item()"/><br>
	<div id="field"></div> -->
	<textarea name="pethistory_coments" rows="10" style="width:100%;"></textarea>
	<input type="hidden" name="pethistory_petcode" value="${pdto.pet_code }"><br>
	<!-- <input type="submit" value="입력완료"/> -->
	<input type="button" value="눌러봐" onclick="add_submit()">
	</form>
</body>
</html>