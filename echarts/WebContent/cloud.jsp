<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <base href="<%=basePath%>">
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <h1 align="center">字符云图</h1>
    <div id="main" style="height:600px ;"></div>
    <!-- ECharts单文件引入 -->
    <script src="echarts/echarts-all.js"></script>
    <!-- <script src="echarts/echarts.min.js"></script> -->
    <script src="echarts/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('main')); 
        

        function createRandomItemStyle() {
            return {
                normal: {
                    color: 'rgb(' + [
                        Math.round(Math.random() * 160),
                        Math.round(Math.random() * 160),
                        Math.round(Math.random() * 160)
                    ].join(',') + ')'
                }
            };
        }
        
	    var arr = [];
	    
	    $.post("./CloudServlet", function(data){
			arr.length=0;
			//alert(data[0].count);
			for(var i=0; i < data.length; i++){
				arr.push({"name":data[i].word,"value":data[i].count,"itemStyle": createRandomItemStyle()});
			}
			//alert(arr[8].value);
		    myChart.setOption({
		    	tooltip: {
	                show: true
	            },
	            series: [{
	                name: 'Google Trends',
	                type: 'wordCloud',
	                size: ['80%', '80%'],
	                textRotation : [0, 45, 90, -45],
	                textPadding: 0,
	                autoSize: {
	                    enable: true,
	                    minSize: 14
	                },
	                data: arr
	            }]
		    });
        // 使用刚指定的配置项和数据显示图表。
		}, 'json'); 

        // 为echarts对象加载数据 
         
    </script>
</body>
</html>