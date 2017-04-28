<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
  <title>企业预计未来大数据投入趋势（饼图）</title>
  
  <!-- 引入Jquery包 -->
  <script type="text/javascript" src="echarts/jquery-2.1.4.min.js"></script>
  <!-- 引入Echarts3包 -->
  <script type="text/javascript" src="echarts/echarts.min.js"></script>
  </head>
  <body>
  	<h1>饼状图演示</h1>
    <br/>
	<div id="main" style="width: 90%;height:90%; "></div>
  </body>
  <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        myChart.setOption({
		    title : {
		        text: '企业预计未来大数据投入趋势',//图片名称
		        
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:[]
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {
		                show: true, 
		                type: ['pie'],
		                option: {
		                    funnel: {
		                        x: '25%',
		                        width: '50%',
		                        funnelAlign: 'center',
		                        max: 1548
		                    }
		                }
		            },
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    series : [
		        {
		            name:'企业预计未来大数据投入趋势',
		            type:'pie',
		            radius : ['50%', '70%'],
		            itemStyle : {
		                normal : {
		                    label : {
		                        show : false
		                    },
		                    labelLine : {
		                        show : false
		                    }
		                },
		                emphasis : {
		                    label : {
		                        show : true,
		                        position : 'center',
		                        textStyle : {
		                            fontSize : '30',
		                            fontWeight : 'bold'
		                        }
		                    }
		                }
		            },
		            data:[]
		        }
		    ]
		    
		});
		
		// 异步加载数据
		var mapOnlyKey = [];
	    var mapKeyValue = [];
	    var mapOnlyValue = [];
		var info = {"opt": "pie"};
		$.post("./Pie1Servlet", info, function(data){
		    mapOnlyKey.length=0;
			mapKeyValue.length=0;
			mapOnlyValue.length=0;
			//alert(data.length);
			for(var i=0; i < data.length; i++){
				mapOnlyKey.push( data[i].range);
				mapKeyValue.push({"value":Math.round(data[i].num), "name": data[i].range });
				mapOnlyValue.push( data[i].num );
			}
		    // 填入数据
		    myChart.setOption({
		        legend: {
		            //类别
		            data: mapOnlyKey
		        },
		        series: [{
		            // 根据名字对应到相应的系列
		            data: mapKeyValue
		        }]
		    });
        // 使用刚指定的配置项和数据显示图表。
		}, 'json');
		
    </script>
</html>