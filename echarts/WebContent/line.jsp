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
       		        text: '未来一周气温变化',
       		        subtext: '纯属虚构'
       		    },
       		    tooltip: {
       		        trigger: 'axis'
       		    },
       		    legend: {
       		        data:['最高气温','最低气温']
       		    },
       		    toolbox: {
       		        show: true,
       		        feature: {
       		            dataZoom: {
       		                yAxisIndex: 'none'
       		            },
       		            dataView: {readOnly: false},
       		            magicType: {type: ['line', 'bar']},
       		            restore: {},
       		            saveAsImage: {}
       		        }
       		    },
       		    xAxis:  {
       		        type: 'category',
       		        boundaryGap: false,
       		        data: []
       		    },
       		    yAxis: {
       		        type: 'value',
       		        axisLabel: {
       		            formatter: '{value} °C'
       		        }
       		    },
       		    series: [
       		        {
       		            name:'最高气温',
       		            type:'line',
       		            data:[],
       		            markPoint: {
       		                data: [
       		                    {type: 'max', name: '最大值'},
       		                    {type: 'min', name: '最小值'}
       		                ]
       		            },
       		            markLine: {
       		                data: [
       		                    {type: 'average', name: '平均值'}
       		                ]
       		            }
       		        },
       		        {
       		            name:'最低气温',
       		            type:'line',
       		            data:[],
       		            markPoint: {
       		                data: [
       		                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
       		                ]
       		            },
       		            markLine: {
       		                data: [
       		                    {type: 'average', name: '平均值'},
       		                    [{
       		                        symbol: 'none',
       		                        x: '90%',
       		                        yAxis: 'max'
       		                    }, {
       		                        symbol: 'circle',
       		                        label: {
       		                            normal: {
       		                                position: 'start',
       		                                formatter: '最大值'
       		                            }
       		                        },
       		                        type: 'max',
       		                        name: '最高点'
       		                    }]
       		                ]
       		            }
       		        }
       		    ]
		});
		
		var time = [];
	    var high = [];
	    var low = [];
		$.post("./LineServlet", function(data){
			time.length=0;
			high.length=0;
			low.length=0;
			for(var i=0; i < data.length; i++){
				time.push(data[i].time);
				high.push(data[i].high);
				low.push( data[i].low );
			}
		    // 填入数据
		    myChart.setOption({
		    	xAxis:  {
		    		data:time
		    	},
		        series: [{
		            // 根据名字对应到相应的系列
		            data: high
		        },{
		        	data: low
		        }]
		    });
        // 使用刚指定的配置项和数据显示图表。
		}, 'json');
		
    </script>
</html>