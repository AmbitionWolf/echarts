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
  <script type="text/javascript" src="echarts/dark.js"></script>
  </head>
  <body>
  	<h1>地图演示</h1>
    <br/>
	<div id="main" style="width: 90%;height:90%; "></div>
  </body>
  <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'),'dark');
        // 指定图表的配置项和数据
        /* function randomData() {
		    return Math.round(Math.random()*1000);
		} */
        option = {
        		title: {
        	        text: 'iphone销量',
        	        subtext: '纯属虚构',
        	        left: 'center'
        	    },
        	    tooltip: {
        	        trigger: 'item'
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data:['iphone3','iphone4','iphone5']
        	    },
        	    visualMap: {
        	        min: 0,
        	        max: 2500,
        	        left: 'left',
        	        top: 'bottom',
        	        text: ['高','低'],           // 文本，默认为数值文本
        	        calculable: true
        	    },
        	    toolbox: {
        	        show: true,
        	        orient: 'vertical',
        	        left: 'right',
        	        top: 'center',
        	        feature: {
        	            dataView: {readOnly: false},
        	            restore: {},
        	            saveAsImage: {}
        	        }
        	    },
        	    series: [
        	        {
        	            name: 'iphone3',
        	            type: 'map',
        	            mapType: 'china',
        	            roam: false,
        	            label: {
        	                normal: {
        	                    show: true
        	                },
        	                emphasis: {
        	                    show: true
        	                }
        	            },
        	            data:[/* 
        	                {name: '北京',value: randomData() },
        	                {name: '天津',value: randomData() },
        	                {name: '上海',value: randomData() },
        	                {name: '重庆',value: randomData() },
        	                {name: '河北',value: randomData() },
        	                {name: '河南',value: randomData() },
        	                {name: '云南',value: randomData() },
        	                {name: '辽宁',value: randomData() },
        	                {name: '黑龙江',value: randomData() },
        	                {name: '湖南',value: randomData() },
        	                {name: '安徽',value: randomData() },
        	                {name: '山东',value: randomData() },
        	                {name: '新疆',value: randomData() },
        	                {name: '江苏',value: randomData() },
        	                {name: '浙江',value: randomData() },
        	                {name: '江西',value: randomData() },
        	                {name: '湖北',value: randomData() },
        	                {name: '广西',value: randomData() },
        	                {name: '甘肃',value: randomData() },
        	                {name: '山西',value: randomData() },
        	                {name: '内蒙古',value: randomData() },
        	                {name: '陕西',value: randomData() },
        	                {name: '吉林',value: randomData() },
        	                {name: '福建',value: randomData() },
        	                {name: '贵州',value: randomData() },
        	                {name: '广东',value: randomData() },
        	                {name: '青海',value: randomData() },
        	                {name: '西藏',value: randomData() },
        	                {name: '四川',value: randomData() },
        	                {name: '宁夏',value: randomData() },
        	                {name: '海南',value: randomData() },
        	                {name: '台湾',value: randomData() },
        	                {name: '香港',value: randomData() },
        	                {name: '澳门',value: randomData() }
        	             */]
        	        },
        	        {
        	            name: 'iphone4',
        	            type: 'map',
        	            mapType: 'china',
        	            label: {
        	                normal: {
        	                    show: true
        	                },
        	                emphasis: {
        	                    show: true
        	                }
        	            },
        	            data:[/* 
        	                {name: '北京',value: randomData() },
        	                {name: '天津',value: randomData() },
        	                {name: '上海',value: randomData() },
        	                {name: '重庆',value: randomData() },
        	                {name: '河北',value: randomData() },
        	                {name: '安徽',value: randomData() },
        	                {name: '新疆',value: randomData() },
        	                {name: '浙江',value: randomData() },
        	                {name: '江西',value: randomData() },
        	                {name: '山西',value: randomData() },
        	                {name: '内蒙古',value: randomData() },
        	                {name: '吉林',value: randomData() },
        	                {name: '福建',value: randomData() },
        	                {name: '广东',value: randomData() },
        	                {name: '西藏',value: randomData() },
        	                {name: '四川',value: randomData() },
        	                {name: '宁夏',value: randomData() },
        	                {name: '香港',value: randomData() },
        	                {name: '澳门',value: randomData() }
        	             */]
        	        },
        	        {
        	            name: 'iphone5',
        	            type: 'map',
        	            mapType: 'china',
        	            label: {
        	                normal: {
        	                    show: true
        	                },
        	                emphasis: {
        	                    show: true
        	                }
        	            },
        	            data:[/* 
        	                {name: '北京',value: randomData() },
        	                {name: '天津',value: randomData() },
        	                {name: '上海',value: randomData() },
        	                {name: '广东',value: randomData() },
        	                {name: '台湾',value: randomData() },
        	                {name: '香港',value: randomData() },
        	                {name: '澳门',value: randomData() }
        	             */]
        	        }
        	    ]
		};
		myChart.setOption(option);
		
		
		$.post("./MapServlet", function(datas) {
			//alert(datas);
			var arr = datas.split(" ");
			//alert(arr[0]);
			var e = JSON.parse(arr[0]);
			var e1 = JSON.parse(arr[1]);
			var e2 = JSON.parse(arr[2]);
			myChart.setOption({
				series : [ {
					data : e
				},{
					data : e1	
				},{
					data : e2
				}]
			})
		}); 
		
    </script>
</html>