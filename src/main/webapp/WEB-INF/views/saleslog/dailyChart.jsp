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
	<script type="text/javascript">
	$(document).ready(function(){
        plot6 = $.jqplot('chart6', [[1,2,3,4]], {seriesDefaults:{renderer:$.jqplot.PieRenderer}});
    });
	</script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
    <div id="chart1" style="width:700px; height:300px"></div>
    <div id="chart6" style="width:700px; height:300px"></div>
    <script type="text/javascript">
  		$(function(){
  			var dateForm = {
  					year : '17'
  			};
  			$.ajax({
  				url : "dailyChartAjax.pet",
  				method : 'POST',
  				type : 'json',
  				data : JSON.stringify(dateForm),
  				contentType : "application/json",
  				success : function(data) {
  					alert("성공");
					$.jqplot.config.enablePlugins = true;
						var s1 = [2, 6, 7, 10];
						var ticks = ['a', 'b', 'c', 'd'];
  			           
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
    </script>
	
	
	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>