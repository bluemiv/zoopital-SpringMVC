<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function test(){
	
/* 	var test1 = document.getElementById("mmm");
	
	alert(test1); 
	var test1 = "가나다";
	document.getElementById("mmm").value = test1;
 여기까지는 인풋타입 입력받아서 총합 계산 스크립트
	var test2 = document.getElementsByName("mmm");
	alert(test2.length);
	if(document.getElementById("nnn").value == ""){
		var total = 0;
	}else{
	var total = parseInt(document.getElementById("nnn").value);
	}
	for(var i=0; i < test2.length; i++){
		total += parseInt(test2[i].value);
	}
	document.getElementById("nnn").value = total; */
	
}
function plus(){
	var count = parseInt(document.getElementById("count").value);
	
	count += 1;
	
	document.getElementById("count").value = count;
	var price = parseInt(document.getElementById("price").value);
	var t_price = parseInt(document.getElementById("t_price").value);
	t_price += price;
	document.getElementById("t_price").value = t_price;
}
function minus(){
	var count = parseInt(document.getElementById("count").value);
	if(count == 0){
		alert("-값은 올 수 없습니다.");
		return;
	}else{
		count -= 1;
		document.getElementById("count").value = count;
		var price = parseInt(document.getElementById("price").value);
		var t_price = parseInt(document.getElementById("t_price").value);
		t_price -= price;
		document.getElementById("t_price").value = t_price;
	}
}
</script>
</head>
<body>
<!-- 여기까지는 인풋타입 입력받아서 총합 계산 스크립트
<input name="mmm" />
<input name="mmm" />
<input name="mmm" />
<input type="button" value="클릭" onclick="test()"><br>
<input id="nnn" />
 -->
<input type="hidden" id="price" value="3000"/>
<input type="button" value="-" onclick="minus()">
<input type="text" id="count" value="0" readonly="readonly"/>
<input type="button" value="+" onclick="plus()">
<br>
총합 : <input type="text" id="t_price" value="0" readonly="readonly">


</body>
</html>