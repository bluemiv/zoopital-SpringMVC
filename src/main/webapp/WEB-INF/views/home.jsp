<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<!-- 네이버 실시간 검색어 -->
	<script type="text/javascript">
		$(function(){
			setInterval(function(){
				$.ajax({
					url : "naverSearchKeyWord.pet",
					method : 'POST',
					type : 'json',
					success : function(result) {
						for(var i =0; i< result.length; i++){
							$("#naverSearch"+i).html("<a href='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="+result[i]+"' target='blank'>"+result[i]+"</a>");
						}
					},
					error : function(result, status, er) {
						$("#naverSearch").text(er);
					}
				});
			}, 1000);
		});
	</script>
	<!-- 계산기 -->
	<script>
		function makeInput(frm, buttonTxt) {
			frm.inputFld.value += buttonTxt;
		}
		function compute(frm) {
			frm.inputFld.value = eval(frm.inputFld.value);
		}
		function erase(frm) {
			frm.inputFld.value = '';
		}
	</script>
	<!-- 토글 -->
	<script type="text/javascript">
		$(function(){
			$("#cal-hide").hide();
			$("#naverSearch-hide").hide();
			$("#sendEmail-hide").hide();
			$("#notice-hide").hide();
			$("#calculator").click(function(){
				$("#cal-hide").fadeToggle("fast");
			});
			$("#naverSearchList").click(function(){
				$("#naverSearch-hide").fadeToggle("fast");
			});
			$("#sendEmail").click(function(){
				$("#sendEmail-hide").fadeToggle("fast");
			});
			$("#notice").click(function(){
				$("#notice-hide").fadeToggle("fast");
			});
		});
	</script>
	<!-- 공지사항 -->
	<script type="text/javascript">
		$(function(){
			setInterval(function(){
				$.ajax({
					url : "homeNoticeSelectAll.pet",
					method : 'POST',
					type : 'json',
					contentType : "application/json",
					success : function(result) {
						for(var i=0; i<result.length; i++){
							$("#notice_title"+i).text(result[i].notice_title);
							$("#notice_writer"+i).text(result[i].notice_writer);
							$("#notice_reply_view"+i).html("<font color='blue'>("+result[i].notice_reply+"/"+result[i].notice_view+")</font>");
						}
					},
					error : function(result, status, er) {
						$("#").text(er);
					}
				});
			}, 1000);
		});
	</script>
</head>
<body>	
	<!-- 헤더 파일 -->
	<jsp:include page="layout/header.jsp"/>
	
	<!-- 컨텐츠 -->
	<div class="container">
		<div class = "row">
			<div class = "col-md-4">
				<div class = "row" >
					<div class="col-lg-12 text-center">
						<h3 id="calculator" class = "mouse-pointer board-custom">계산기</h3>
						<hr>
					</div>
				</div>
				<form id = "cal-hide">
					<input type='text' name = 'inputFld' size='22' readonly="readonly" class = "form-control">
					<br><br>
					<input type='button' value=' 7 ' onClick='makeInput(this.form, "7")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' 8 ' onClick='makeInput(this.form, "8")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' 9 ' onClick='makeInput(this.form, "9")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' + ' onClick='makeInput(this.form, "+")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' C ' onClick='erase(this.form)' class = "btn btn-calculator btn-custom">
					<br>
					<input type='button' value=' 4 ' onClick='makeInput(this.form, "4")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' 5 ' onClick='makeInput(this.form, "5")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' 6 ' onClick='makeInput(this.form, "6")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' - ' onClick='makeInput(this.form, "-")' class = "btn btn-calculator btn-custom">
					<br>
					<input type='button' value=' 1 ' onClick='makeInput(this.form, "1")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' 2 ' onClick='makeInput(this.form, "2")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' 3 ' onClick='makeInput(this.form, "3")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' * ' onClick='makeInput(this.form, "*")' class = "btn btn-calculator btn-custom">
					<br>
					<input type='button' value=' . ' onClick='makeInput(this.form, ".")' class = "btn btn-calculator btn-custom">
					<input type='button' value=' 0 ' onClick='makeInput(this.form, "0")' class = "btn btn-calculator btn-custom">
					<input type='button' value='  =  ' onClick='compute(this.form)' class = "btn btn-calculator btn-custom">
					<input type='button' value=' / ' onClick='makeInput(this.form, "/")' class = "btn btn-calculator btn-custom">
					<br>
				</form>
			</div>
			<div class = "col-md-4">
				<div class = "row" >
					<div class="col-lg-12 text-center">
						<h3 id = "naverSearchList" class = "mouse-pointer board-custom">실시간 검색어</h3>
						<hr>
					</div>
				</div>
				<div id = "naverSearch-hide">
					<p id = "naverSearch0"></p>
					<p id = "naverSearch1"></p>
					<p id = "naverSearch2"></p>
					<p id = "naverSearch3"></p>
					<p id = "naverSearch4"></p>
					<p id = "naverSearch5"></p>
					<p id = "naverSearch6"></p>
					<p id = "naverSearch7"></p>
					<p id = "naverSearch8"></p>
					<p id = "naverSearch9"></p>
					<p id = "naverSearch10"></p>
				</div>
			</div>
			<div class = "col-md-4">
				<div class = "row" >
					<div class="col-lg-12 text-center">
						<h3 id = "notice" class = "mouse-pointer board-custom">공지사항</h3>
						<hr>
					</div>
					<div id = "notice-hide">
					<table width="100%" class="table table-hover" id="dataTables-example">
						<thead>
							<tr>
								<th>제목(댓글/조회수)</th>
								<th></th>
								<th>
								작성자
								<c:url value="/notice/noticeListForm.pet" var = "noticeListForm"></c:url>
								<a href="${noticeListForm}">>></a>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr class = "board-custom">
								<td colspan="2"><span id = "notice_title0"></span><span id="notice_reply_view0"></span></td>
								<td id = "notice_writer0"></td>
							</tr>
							<tr class = "board-custom">
								<td colspan="2"><span id = "notice_title1"></span><span id="notice_reply_view1"></span></td>
								<td id = "notice_writer1"></td>
							</tr>
							<tr class = "board-custom">
								<td colspan="2"><span id = "notice_title2"></span><span id="notice_reply_view2"></span></td>
								<td id = "notice_writer2"></td>
							</tr>
							<tr class = "board-custom">
								<td colspan="2"><span id = "notice_title3"></span><span id="notice_reply_view3"></span></td>
								<td id = "notice_writer3"></td>
							</tr>
							<tr class = "board-custom">
								<td colspan="2"><span id = "notice_title4"></span><span id="notice_reply_view4"></span></td>
								<td id = "notice_writer4"></td>
							</tr>
						</tbody>
					</table>
					</div>
				</div>
			</div>
			<div class = "col-md-4">
				<div class = "row" >
					<div class="col-lg-12 text-center">
						<h3 id = "sendEmail" class = "mouse-pointer board-custom">이메일 보내기</h3>
						<hr>
					</div>
				</div>
			</div>
			<div class = "col-md-4">
			
			</div>
			
			<div class = "col-md-4">
			
			</div>
		</div>
		<div class="row" id = "sendEmail-hide">
			<div class="col-lg-8 col-lg-offset-2">
				<form action = "sendMail.pet" method = "post">
					<div class="row control-group">
						<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
							<label for="name">보내는 사람</label>
							<input type = "text" name="send_email" class="form-control">
						</div>
						<div class="form-group col-xs-1 floating-label-form-group controls">
							<br><label for="name">@</label>
						</div>
						<div class="form-group col-xs-5 floating-label-form-group controls board-custom">
							<br>
							<select name = "email_host" class="form-control">
								<option value = "naver.com">네이버(naver.com)</option>
								<option value = "hanmail.net">다음(hanmail.net)</option>
							</select>
						</div>
						<div class="form-group col-xs-3 floating-label-form-group controls board-custom">
							<label for="name">이메일 비밀번호</label>
							<input type = "password" name="send_pwd" class="form-control">
						</div>
					</div>
				
					<div class="row control-group">
						<div class="form-group col-xs-6 floating-label-form-group controls board-custom">
							<label for="name">받는 사람</label>
							<input type = "email" class="form-control" name="receive_email">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">제목</label>
							<input type = "text" name="title" class="form-control">
						</div>
					</div>
					
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls board-custom">
							<label for="name">내용</label>
							<textarea name="contents" rows="13" class="form-control"></textarea>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<input class = "btn btn-custom btn-md" type="submit" value="보내기">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<!-- 푸터 파일 -->
	<jsp:include page="layout/footer.jsp"/>
	
	<button onclick="location='history/selectallhistory.pet'">히스토리 보기</button>
	<br>
	<button onclick="location='history/serarchview.pet'">히스토리 작성</button>
	
</body>
</html>
