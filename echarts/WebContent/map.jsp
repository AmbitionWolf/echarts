<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
  <title>iphone销量</title>
  
  <!-- 引入Jquery包 -->
  <script type="text/javascript" src="echarts/jquery-2.1.4.min.js"></script>
  <!-- 引入Echarts3包 -->
  <script type="text/javascript" src="echarts/echarts.min.js"></script>
  <script type="text/javascript" src="echarts/china.js"></script>
  </head>
  <body>
  	<h1>地图演示</h1>
    <br/>
	<div id="main" style="width: 90%;height:90%; "></div>
  </body>
  <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        option = {
			title : {
				text : 'Research and development funds investment intensity test',
				left : 'center',
			},
			tooltip : {
				trigger : 'item'
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : [ '2012' ]
			},
			visualMap : {
				min : 0,
				max : 1000,
				left : 'left',
				top : 'bottom',
				text : [ 'high', 'low' ], 
				calculable : true
			},
			toolbox : {
				show : true,
				orient : 'vertical',
				left : 'right',
				top : 'center',
				feature : {
					dataView : {
						readOnly : false
					},
					restore : {},
					saveAsImage : {}
				}
			},
			series : [ {
				name : '2012',
				type : 'map',
				mapType : 'china',
				roam : false,
				label : {
					normal : {
						show : true
					},
					emphasis : {
						show : true
					}
				},
				data : []
			} ]
		};
		myChart.setOption(option);
		$.post("./MapServlet", function(datas) {
			alert(typeof(datas));
			var e = eval(datas);
			alert(typeof(e));
			myChart.setOption({
				series : [ {
					data : e
				} ]
			})
		});
		
    </script>
</html>