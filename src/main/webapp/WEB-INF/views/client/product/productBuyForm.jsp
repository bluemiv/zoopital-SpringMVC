<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>결제</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">
		$(function(){
			var IMP = window.IMP; // 생략가능
			IMP.init('imp71428651'); // 부여받은 "가맹점 식별코드"를 사용
			
			$("#select_pg").click(function(){
				// 결제 요청
				IMP.request_pay({
				    pg : $("#pg").val(), // version 1.1.0부터 지원.
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : $("#product_name").val(),
				    amount :  $("#product_cost").val(),
				    buyer_email : $("#client_email").val(),
				    buyer_name : $("#client_name").val(),
				    buyer_tel : $("#client_tel").val(),
				    buyer_addr : $("#client_add").val(),
				    buyer_postcode : $("#client_postcode").val(),
				    m_redirect_url : 'productListForm.pet' // redirect 도메인 주소
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        location.replace('productBuyPro.pet?result=success&product_code='+$("#product_code").val()+'&product_amount='+$("#product_amount").val()+'&basket_code='+$("#basket_code").val());
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        location.replace('productBuyPro.pet?result=fail');
				    }
				    alert(msg);
				});
			});
		});
	</script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../../layout/header.jsp"/>
	
	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>결제선택</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<div class="row control-group">
					<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
						<select class="form-control" id="pg">
							<option value="kakao">카카오페이</option>
							<option value="html5_inicis">이니시스</option>
							<option value="uplus">LG유플러스</option>
						</select>
					</div>
					<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
						<input type = "button" id="select_pg" class="btn btn-lg btn-custom" value="결제 수단 선택">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<input type = "hidden" value="${basket_code}" id="basket_code"/>
	<input type = "hidden" value="${clientDTO.product_code}" id="product_code"/>
	<input type = "hidden" value="${clientDTO.product_name}" id="product_name"/>
	<input type = "hidden" value="${clientDTO.product_amount}" id="product_amount"/>
	<input type = "hidden" value="${clientDTO.product_amount * clientDTO.product_cost}" id="product_cost"/>
	<input type = "hidden" value="${clientDTO.client_email}" id="client_email"/>
	<input type = "hidden" value="${clientDTO.client_name}" id="client_name"/>
	<input type = "hidden" value="${clientDTO.client_tel}" id="client_tel"/>
	<input type = "hidden" value="${clientDTO.client_add} ${clientDTO.client_add_detail}" id="client_add"/>
	<input type = "hidden" value="${clientDTO.client_postcode}" id="client_postcode"/>
	
	<!-- 푸터 파일 -->
	<jsp:include page="../../layout/footer.jsp"/>
</body>
</html>