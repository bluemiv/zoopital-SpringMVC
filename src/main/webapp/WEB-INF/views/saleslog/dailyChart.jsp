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
	<script type="text/javascript" src="<c:url value="/resources/js/chart//plugins/jqplot.highlighter.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/chart//plugins/jqplot.cursor.js" />"></script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>
	
	
	<!-- 컨텐츠 -->
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>매출 차트</h2>
				<hr>
			</div>
			<!-- 두번째 줄 -->
			<div class="col-lg-9 text-center">
			</div>
			<div class="col-lg-2 text-center">
				<select id="year" class="form-control">
					<option value="15">2015년</option>
					<option value="16">2016년</option>
					<option value="17" selected="selected">2017년</option>
					<option value="18">2018년</option>
				</select>
			</div>
			<div class="col-lg-1 text-center">
				<button class = "btn btn-mg btn-custom" id="chart_btn">차트 보기</button>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 text-center">
				<label class = "init-label">수익</label>
				<div class="centered" id="chart1"></div>
				<div id="info1"></div>
			</div>
			<div class="col-lg-12 text-center">
				<label class = "init-label">방문한 손님 수</label>
				<div class="centered" id="chart2"></div>
				<div id="info2"></div>
			</div>
		</div>
	</div>
	
    <script type="text/javascript">
  		$(function(){
  			$(".init-label").hide();
  			$("#chart_btn").click(function(){
  	  			$(".init-label").show();
  				var dataForm = {
	  				saleslog_year : $("#year").val()
  	  			};
  	  			$.ajax({
  	  				url : "dailyChartAjax.pet",
  	  				method : 'POST',
  	  				type : 'json',
  	  				data : JSON.stringify(dataForm),
  	  				contentType : "application/json",
  	  				success : function(data) {
  	  					var s1 = new Array;
  	  					var s2 = new Array;
  	  					var s3 = new Array;
  	  					var ticks = new Array;
  	  					for(var i=0; i< data.length; i++){
  	  	  					s1[i] = data[i].saleslog_t_income;
  	  	  					s2[i] = data[i].saleslog_m_income;
  	  	  					s3[i] = data[i].saleslog_income;
  	  	  					ticks[i] = data[i].saleslog_month+"월";
  	  					}
  						$.jqplot.config.enablePlugins = true;
						
  						/* total bar grapgh */
  						 plot3 = $.jqplot('chart1', [s1, s2, s3], {
  				            stackSeries: true,
  				            captureRightClick: true,
  				          	seriesColors:['#00749F', '#17BDB8','#73C774'],
  				            seriesDefaults:{
  				                renderer:$.jqplot.BarRenderer,
  				                rendererOptions: {
  				                    highlightMouseDown: true   
  				                },
  				                pointLabels: {show: true}
  				            },
	  				        series: [
	  				            {
	  				                fill: true,
	  				                label: '진료비'
	  				            },
	  				            {
	  				                label: '약품비'
	  				            },
	  				            {
	  				                label: '총수익'
	  				            }
	  				        ],
	  				        axes: {
				        		xaxis: {
				                   	renderer: $.jqplot.CategoryAxisRenderer,
				                   	ticks: ticks
			                	},
		  				        yaxis: {
		  			                tickOptions: {
		  			                    formatString: "%'d(원)"
		  			                },
		  			                rendererOptions: {
		  			                    forceTickAt0: true
		  			                }
		  			            }
				            },	
  				            legend: {
  				                show: true,
  				                location: 'e',
  				                placement: 'outside'
  				            }      
  				        });
  				     
  				        $('#chart1').bind('jqplotDataRightClick', 
  				            function (ev, seriesIndex, pointIndex, data) {
  				                $('#info1').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
  				            }
  				        ); 
  					},
  					error : function(data, status, er) {
  						alert("실패 / "+ data + "/" + status + "/" + er);
  					}
  				});
	  	  		$.ajax({
		  				url : "../history/petHistoryDailyChartAjax.pet",
		  				method : 'POST',
		  				type : 'json',
		  				data : JSON.stringify(dataForm),
		  				contentType : "application/json",
		  				success : function(data) {
		  					var h1 = new Array;
	  	  					var ticks1 = new Array;
	  	  					for(var i=0; i< data.length; i++){
	  	  	  					h1[i] = data[i].pethistory_count;
	  	  	  					ticks1[i] = data[i].pethistory_month+"월";
	  	  					}
		  	  				
		  	  		        $.jqplot.config.enablePlugins = true;
		  	  		        
		  	  		        plot1 = $.jqplot('chart2', [h1], {
		  	  		            // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
		  	  		            animate: !$.jqplot.use_excanvas,
								stackSeries: true,
		  	  		            seriesDefaults:{
		  	  		                renderer:$.jqplot.BarRenderer,
		  	  		                pointLabels: { show: true },
					                rendererOptions: {
					                    highlightMouseDown: true   
					                }
		  	  		            },
			  	  		        seriesColors:['#b3daff'],
	  				           
		  				        series: [
		  				            {
		  				                fill: true,
		  				                label: '방문한 손님 수'
		  				            },
		  				        ],
		  	  		            axes: {
		  	  		                xaxis: {
		  	  		                    renderer: $.jqplot.CategoryAxisRenderer,
		  	  		                    ticks: ticks1
		  	  		                },
			  	  		            yaxis: {
			  			                tickOptions: {
			  			                    formatString: "%'d(명)"
			  			                },
			  			                rendererOptions: {
			  			                    forceTickAt0: true
			  			                }
			  			            }
		  	  		            },
			  	  		        legend: {
	  				                show: true,
	  				                location: 'e',
	  				                placement: 'outside'
	  				            }
		  	  		        });
		  	  		     
		  	  		        $('#chart2').bind('jqplotDataClick', 
		  	  		            function (ev, seriesIndex, pointIndex, data) {
		  	  		                $('#info2').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
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