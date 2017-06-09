<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>차트</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link class="include" rel="stylesheet" type="text/css" href="<c:url value="/resources/css/chart/jquery.jqplot.css" />" />
	<script type="text/javascript" src="<c:url value="/resources/js/chart/jquery.jqplot.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/chart/excanvas.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/chart/plugins/jqplot.barRenderer.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/chart/plugins/jqplot.categoryAxisRenderer.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/chart/plugins/jqplot.pieRenderer.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/chart/plugins/jqplot.pointLabels.js" />"></script>

</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	<select id="year">
		<option value="15">2015</option>
		<option value="16">2016</option>
		<option value="17" selected="selected">2017</option>
		<option value="18">2018</option>
	</select>
	<select id="month" >
		<c:forEach begin="1" end="12" var="i">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>
	<button id="chart_btn">년도 차트 보기</button>
    <div class="centered" id="chart1" style="width:700px; height:300px;"  ></div>
    <script type="text/javascript">
  		$(function(){
  			$("#chart_btn").click(function(){
  				alert($("#year").val() + "/" +$("#month").val())
  				var dataForm = {
	  				saleslog_year : $("#year").val() , 
	  				saleslog_month : $("#month").val()
  	  			};
  	  			$.ajax({
  	  				url : "dailyChartAjax.pet",
  	  				method : 'POST',
  	  				type : 'json',
  	  				data : JSON.stringify(dataForm),
  	  				contentType : "application/json",
  	  				success : function(data) {
  	  					var s1 = new Array;
  	  					var ticks = new Array;
  	  					for(var i=0; i< data.length; i++){
  	  	  					alert(data[i].saleslog_month + "월:" + data[i].saleslog_income);
  	  	  					s1[i] = data[i].saleslog_income;
  	  	  					ticks[i] = data[i].saleslog_month+"월";
  	  					}
  						$.jqplot.config.enablePlugins = true;
  							/* s1 = [2000000, 2000000, 2000000, 2000000,12000000,10,10,10,10,10,10,10];
  							ticks = ['1월', '2월', '3월', '4월','5월','6월','7월','8월','9월','10월','11월','12월']; */
  							plot1 = $.jqplot('chart1', [s1], {
  								animate: !$.jqplot.use_excanvas,
  								seriesDefaults:{
  								    renderer:$.jqplot.BarRenderer,
  								    pointLabels: { show: true }
  								},
  								axes: {
  								    xaxis: {
  								        renderer: $.jqplot.CategoryAxisRenderer,
  								        ticks: ticks
  								    }
  								},
  							    highlighter: { show: false }
  							});
  	  			       
  							$('#chart1').bind('jqplotDataClick', 
  							    function (ev, seriesIndex, pointIndex, data) {
  							        $('#info1').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
  							    }
  							);
  					},
  					error : function(data, status, er) {
  						alert("실패 / "+ data + "/" + status + "/" + er);
  					}
  				});
  			});
  		});
    </script>
	
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>