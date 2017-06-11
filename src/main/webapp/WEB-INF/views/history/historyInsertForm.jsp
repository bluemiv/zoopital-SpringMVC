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
	
	
	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>진단</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form  id="frm" name="frm" method="post">
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">담당 의사</label>
							<input type="text" class="form-control" name="emp_name" value="${cdto.emp_name }" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 코드</label>
							<input type="text" class="form-control" name="pet_code" id="pet_code" value="${pdto.pet_code }" readonly="readonly">
						</div>
					</div>
	
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 이름</label>
							<input type="text" class="form-control" name="pet_name" id="pet_name" value="${pdto.pet_name }" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 종류</label>
							<input type="text" class="form-control" name="pet_type" id="pet_type" value="${pdto.pet_type }" readonly="readonly">
						</div>
					</div>
	
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 성별</label>
							<input type="text" class="form-control" name="pet_sex" id="pet_sex" value="${pdto.pet_sex }" readonly="readonly">
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">동물 나이</label>
							<input type="text" class="form-control" name="pet_age" id="pet_age" value="${pdto.pet_age }" readonly="readonly">
						</div>
					</div>
	
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 선택</label>
							<input type="text" class="form-control" list="mlist" name="test"/>
							<input type="hidden" name="petaccept_code" value="${cdto.petaccept_code }" />
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<br>
							<input type="button" class="btn btn-md btn-custom" value="추가" onclick="add_submit()">
						</div>
					</div>
	
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 선택</label>
							<datalist id="mlist">
								<c:forEach items="${mdto }" var="m">
									<option value="${m.medicament_name }">가격 : ${m.medicament_cost } || 재고 : ${m.medicament_amount }</option>
								</c:forEach>
							</datalist>
						</div>
					</div>
	
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom form-inline">
							<br>
							<c:forEach items="${addmdto }" var="am" varStatus="i">
								<input type="text" class="form-control" name="test" value="${am.medicament_name}" readonly="readonly">
								<input type="hidden" value="${am.medicament_cost }" name="am_cost">
								<input type="hidden" value="${am.medicament_amount }" name="am_amount">
								<input type="button" class="btn btn-md btn-custom" value="-" onclick="minus(${i.count})"/>
								<input type="text" class="form-control" name="am_count" value="${am.am_count }" size="5" readonly="readonly"/>
								<input type="button" class="btn btn-md btn-custom" value="+" onclick="plus(${i.count})"/>
								<input type="button" class="btn btn-md btn-custom" value="삭제" onclick="del_submit(${i.count})"/>
								<br>
							</c:forEach>
							<input type="hidden" value="0" name="del_num" id="del_num"/>
						</div>
					</div>
	
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">약품 가격</label>
							<input type="text" class="form-control" value="${cdto.m_total_cost }" id="amtotal_cost" name="m_total_cost" readonly="readonly"/>
						</div>
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">진료 가격</label>
							<input type="text" class="form-control" value="${cdto.treat_cost }" name="treat_cost">
						</div>
					</div>
	
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">의사 소견</label>
							<textarea name="pethistory_coments" rows="10" class="form-control"></textarea>
							<input type="hidden" name="pethistory_petcode" value="${pdto.pet_code }">
						</div>
					</div>
	
					<div class="row">
						<div class="form-group col-xs-12">
							<input type="button" class="btn btn-md btn-custom" value="입력완료" onclick="ins_submit()">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>