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
     		    title : {
     		        text: '某地区蒸发量和降水量',
     		        subtext: '纯属虚构'
     		    },
     		    tooltip : {
     		        trigger: 'axis'
     		    },
     		    legend: {
     		        data:['蒸发量','降水量']
     		    },
     		    toolbox: {
     		        show : true,
     		        feature : {
     		            dataView : {show: true, readOnly: false},
     		            magicType : {show: true, type: ['line', 'bar']},
     		            restore : {show: true},
     		            saveAsImage : {show: true}
     		        }
     		    },
     		    calculable : true,
     		    xAxis : [
     		        {
     		            type : 'category',
     		            data : []
     		        }
     		    ],
     		    yAxis : [
     		        {
     		            type : 'value'
     		        }
     		    ],
     		    series : [
     		        {
     		            name:'蒸发量',
     		            type:'bar',
     		            data:[],
     		            markPoint : {
     		                data : [
     		                    {type : 'max', name: '最大值'},
     		                    {type : 'min', name: '最小值'}
     		                ]
     		            },
     		            markLine : {
     		                data : [
     		                    {type : 'average', name: '平均值'}
     		                ]
     		            }
     		        },
     		        {
     		            name:'降水量',
     		            type:'bar',
     		            data:[],
     		            markPoint : {
     		                data : [
     		                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
     		                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
     		                ]
     		            },
     		            markLine : {
     		                data : [
     		                    {type : 'average', name : '平均值'}
     		                ]
     		            }
     		        }
     		    ]
		});
		
		var time = [];
	    var waterin = [];
	    var waterout = [];
		$.post("./BarServlet", function(data){
			time.length=0;
			waterin.length=0;
			waterout.length=0;
			for(var i=0; i < data.length; i++){
				time.push(data[i].time);
				waterin.push(data[i].waterin);
				waterout.push( data[i].waterout );
			}
		    // 填入数据
		    myChart.setOption({
		    	xAxis:  {
		    		data:time
		    	},
		        series: [{
		            // 根据名字对应到相应的系列
		            data: waterin
		        },{
		        	data: waterout
		        }]
		    });
        // 使用刚指定的配置项和数据显示图表。
		}, 'json');
		
    </script>
</html>