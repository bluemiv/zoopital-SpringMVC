<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function test(params){
	var testArr = document.getElementsByName("hi");
	alert("hi 값 : " + testArr[params-1].value);
}
function arrtest(){
	var testArr2 = document.getElementsByName("hi");
	alert(testArr2[0].value);
	/* var testArr = testArr2.slice(); */
	var testArr = [];
	
	for(var i=0; i<=testArr2.length-1; i++){
		testArr.push(testArr2[i]);
	}
	
	alert(testArr[0].value);
	alert(testArr2[0].value);
	/* 굿 작동가능!!!!! */
	testArr.splice(1,1);
	alert(testArr[1].value);
	alert(testArr2[1].value);
	/* alert(testArr[0].value);
	alert(testArr2[1].value);
	testArr2[1].value = 10;
	alert(testArr2[1].vlaue);
	testArr.splice(0,1);
	alert(testArr[0].value); */
	
}
</script>
</head>
<body>
<c:forEach begin="0" end="3" varStatus="status">
<input type="text" value="${status.count }" name="hi"/>
<input type="button" value="클릭해보자" onclick="test(${status.count})"/>
</c:forEach>
<br>
<input type="button" value="배열삭제 테스트" onclick="arrtest()">
</body>
</html>