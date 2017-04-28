<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
  <title></title>
  
  <!-- 引入Jquery包 -->
  <script type="text/javascript" src="echarts/jquery-2.1.4.min.js"></script>
  <!-- 引入Echarts3包 -->
  <script type="text/javascript" src="echarts/echarts.min.js"></script>
  </head>
  <body>
	<div id="main" style="width: 90%;height:90%; "></div>
  </body>
  <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        myChart.setOption({
   		    title: {
   		        text: '基础雷达图'
   		    },
   		    tooltip: {},
   		    radar: {
   		        // shape: 'circle',
   		        indicator: [
   		           { name: '销售（sales）', max: 6500},
   		           { name: '管理（Administration）', max: 16000},
   		           { name: '信息技术（Information Techology）', max: 30000},
   		           { name: '客服（Customer Support）', max: 38000},
   		           { name: '研发（Development）', max: 52000},
   		           { name: '市场（Marketing）', max: 25000}
   		        ]
   		    },
   		    series: [{
   		        name: '预算 vs 开销（Budget vs spending）',
   		        type: 'radar',
   		        // areaStyle: {normal: {}},
   		        data : [
   		            {
   		                value : [],
   		                name : '预算分配（Allocated Budget）'
   		            },
   		             {
   		                value : [],
   		                name : '实际开销（Actual Spending）'
   		            }
   		        ]
   		    }]
		});
		
	    var budget = [];
	    var spending = [];
		$.post("./RadarServlet", function(data){
			budget.length=0;
			spending.length=0;
			for(var i=0; i < data.length; i++){
				budget.push(data[i].budget);
				spending.push( data[i].spending );
			}
		    // 填入数据
		    myChart.setOption({
		    	legend: {
	   		        data: ['预算分配', '实际开销']
	   		    },
		        series: [{
		            // 根据名字对应到相应的系列
		            data: [budget,spending]
		        }]
		    });
        // 使用刚指定的配置项和数据显示图表。
		}, 'json'); 
		
    </script>
</html>