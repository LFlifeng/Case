<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>${detail.projectName}_招标信息采购项目拟在建项目公开招标成交公告_中汇招标网</title>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="${skin}js/layui/layui.js"></script>
<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
<script src="${skin}front/js/common.js"></script>
<script src="${skin}front/js/search.js"></script>
<link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/footer.css">
<link rel="stylesheet" type="text/css" href="${skin}front/css/detail.css">
<link rel="stylesheet" type="text/css"
	href="${skin}js/layui/css/layui.css" media="all">
<style type="text/css">
[v-cloak] {
    display: none;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<!-- 头部导航 -->
	<div class="head_nav">
		<div class="nav">
			<ul>
				<li><a href="main.index.do">首页</a></li>
				<li><a href="bids.listIndex.do">招标信息</a></li>
				<li><a href="bids.listIndex.do" onclick="toPurchaseIndex()">采购信息</a></li>
				<li><a href="biddinginfo.listIndex.do">项目中心</a></li>
				<li><a href="application.listIndex.do">供应商</a></li>
				<li><a href="news.listIndex.do">行业资讯</a></li>
				<li><a href="serviceHall.listIndex.do">服务大厅</a></li>
			</ul>

		</div>
	</div>
	<div class="main">
		<div class="main_content clearfix" id="columnData" v-cloak>
			<div class="main_box fl" v-for="columns in columnCategorys">
				<h3>{{columns.columnName}}</h3>
				<div class="main_list">
					<ul>
						<li v-for="item in columns.list"><a :href='item.url'
							@click='leixing(item.columnName)'  >{{item.columnName}}</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="position_nav">
		当前位置：<a href="/main.index.do">首页</a>><a
			href="/biddinginfo.listIndex.do">项目中心</a>><a href="#">${detail.projectName}</a>
	</div>

	<div class="arc_content">

		<div class="arc fl"  id="bidsdetails">
			<div class="arc_title">${detail.projectName}</div>
			<div class="arc_time">
			    <div class="t">中汇招标网受业主方委托推荐供应商，符合要求的供应商，我们将其资料提交给业主方供以选择，详情请咨询<i>${systemInfo.servicePhone }</i></div>
				<div class="time clearfix">
					<span>距截止时间还剩</span>
					<div>164</div>
					<span>天</span>
					<div>03</div>
					<span>时</span>
					<div>32</div>
					<span>分</span>
					<div>30</div>
					<span>秒</span>
				</div>
			</div>
			<div class="arc_info">
				<span>发布时间：${detail.ctime}</span>
				<a href="${detail.attaUrl}">附件下载</a>
				<a href="#"  onclick="designeds('${detail.id}','${detail.projectName}')">项目专盯</a>
				<a href="#"  onclick="collection('${detail.id}','${detail.projectName}')">收藏</a>
				
			</div>
			<div class="t_table">
				<table>
					<tr>
						<td style="width: 20%;">发布时间:</td>
						<td>${detail.ctime}</td>
						<td>公告类型:</td>
						<td>${detail.projectType}</td>
					</tr>
					<tr>
						<td>招标地区:</td>
						<td>${detail.province}</td>
						<td>联系方式:</td>
						<td class="blue" v-if="grade === '0'"><a onclick="tips()">会员可见</a></td>
						<td class="blue" v-else-if="grade === ''"><a onclick="tips()">会员可见</a></td>
						<td class="blue" v-else><a href="#">${detail.issuerPhone}</a></td>
					</tr>
				</table>
			</div>
			<div class="arc_arc">
				<p>${detail.content}
				<p>
				<div class="arc_vip">
					<img src="${skin}front/img/arc_vip.jpg" />
				</div>
			</div>
		</div>
		<div class="sidebar_right fl fl10">
			<div class="new_did" id="exclusiveBids"  v-cloak>
				<div class="new_did_title">
					独家招标信息 <a class="new_did_title_more" href="bids.listIndex.do">更多</a>
				</div>
				<ul class="new_did_l" >
					<li v-for="bids in exclusiveBidsList" :key="bids.id"><a :href="'bids.details.do?id=' +bids.id">{{bids.name}}</a></li>

				</ul>
			</div>
		</div>
		<div class="cl"></div>
	</div>
	<!-- 公共底部 -->
	<%@ include file="../common/footer.jsp"%>
	<script>
		var data = '${detail.deadline}'+' 0:0:0';
		data = data.replace("-","/");
		data = data.replace("-","/");
		//使用Vue渲染模板，初始化时是没有数据的，需要ajax请求拿到数据
		var exclusiveBids = new Vue({
			el : "#exclusiveBids",
			data : {
				exclusiveBidsList : null
			}
	
		});
	
		var userGrade = new Vue({
			el : "#bidsdetails",
			data : {
				grade : '${user.grade}'
			}
	
		});
		//查询独家招标
		function findExclusiveBids(){
			 $.ajax({
			        type: 'POST',
			        url: '/bids.exclusiveBids.do',
			        dataType: 'json',
			      
			        success: function (data)
			        {
			        	exclusiveBids.exclusiveBidsList = data;
			        }
	        			
			    });
		}
		$(function(){
			findExclusiveBids();
		});
		//收藏
		function collection(id,title) {
      			var param = {
      					biddingInfoId : id,
      					binddingInfoTitle : title
              	};
              	$.ajax({
  			        type: 'POST',
  			        url: '/userCollection.add.do',
  			        data: param,
  			        success: function (data)
  			        {
		        		layer.msg(data, {
                 		    icon: 1,
                 		   	time: 1000, //1s后自动关闭
                 		    shade: [0.8, '#393D49'] // 透明度  颜色
                 		});
  			        }
  			    });

		}
		//项目专盯
		function designeds(id,title) {
      			var param = {
      					biddingInfoId : id,
      					binddingInfoTitle : title
              	};
              	$.ajax({
  			        type: 'POST',
  			        url: '/projectDesigneds.add.do',
  			        data: param,
  			        success: function (data)
  			        {
		        		layer.msg(data, {
                 		    icon: 1,
                 		   	time: 1000, //1s后自动关闭
                 		    shade: [0.8, '#393D49'] // 透明度  颜色
                 		});
  			        }
  			    });
		}
		//附件下载
		function downLoad(fileName,fileUrl){
			var param = {
					fileName : fileName,
					fileUrl : fileUrl
          	};
          	$.ajax({
			        type: 'POST',
			        url: '/attach.download.do',
			        data: param,
			        success: function (data)
			        {
	        		layer.msg(data, {
             		    icon: 1,
             		   	time: 1000, //1s后自动关闭
             		    shade: [0.8, '#393D49'] // 透明度  颜色
             		});
			        }
			    });
		}
		
		//跳转到采购信息页面
		function toPurchaseIndex() {
			localStorage.setItem("leixing", "采购公告");
		}

		function leixing(leixing) {
			if (leixing) {
				localStorage.setItem("lx", leixing);
			}
		}

		function setCategory(category) {
			if (category) {
				localStorage.setItem("category", category);
			}
		}
		var columnData = new Vue({
			el: "#columnData",
			data: {
        	columnCategorys:[]
            },
            methods:{
            	leixing:function(leixing){
        				if(leixing){
        					localStorage.setItem("lx", leixing);
        				}
            	}
            	
            },
            created: function ()
            {
	            var self = this;
	            var res = localStorage.getItem("columnCategorysKey");
	            if(res)
	            {
	            	self.columnCategorys = JSON.parse(res);
	            }
	            else
	            {
	            	$.ajax({
	 	                url: '/columnCategory.listAll.do',
	 	                type: 'post'
	 	            }).then(function (res){
	 	                self.columnCategorys = JSON.parse(res);
	 	                localStorage.setItem("columnCategorysKey",res)
	 	                
	 	            }).fail(function () {});
	            }
		 	},
		});
		
		function tips(){
	        layui.use('layer', function () { //独立版的layer无需执行这一句
	            var $ = layui.jquery, layer = layui.layer;
	            layer.open({
	              type: 1,
	              title: false,
	              closeBtn: false,
	              area: '[460px,260px]',
	              id: 'LAY_layuipro',
	              btn: ['知道了'],
	              btnAlign: 'c',
	              content: $('.tishi'),
	              resize: false,//禁止拉伸
	              end: function () {
	                $(".tishi").hide();
	              },
	            })
	          });
		}
		  // 倒计时
	    function getTime(S, endTime) {
	        // 获取开始时间
	        var start = S;
	        // 获取结束时间
	        var end = E;
	        // 计算时间差（毫秒差）
	        var num = end - start;
	        if(num <= 0)
	        {
	        	return { day:"00", hour: "00", minute: "00", seconds: "00" };
	        }
	        
	        // 换算时间
	        // 天
	        var d = parseInt(num / 1000 / 60 / 60 / 24);
	        d = d < 10 ? '0' + d : d;
	        // 小时
	        var h = parseInt(num / 1000 / 60 / 60 ) - d * 24;
	        h = h < 10 ? '0' + h : h;
	        // 分钟
	        var m = parseInt(num / 1000 / 60 % 60);
	        m = m < 10 ? '0' + m : m;
	        // 秒
	        var s = parseInt(num / 1000 % 60);
	        s = s < 10 ? '0' + s : s;
	        return { day:d, hour: h, minute: m, seconds: s };
	    };
	    var S = new Date();
	    var E = new Date(data);
	    var o = getTime(S, E);
	    // 1.获取一组div元素
	    var divs = document.querySelectorAll('.arc_time .time div');
	    // 2.把计算好的时间差的时分秒分别赋值给每一个div的内容
	    divs[0].innerText = o.day;
	    divs[1].innerText = o.hour;
	    divs[2].innerText = o.minute;
	    divs[3].innerText = o.seconds;
	    // 3.产生一个定时器
	    var tmp = setInterval(function () {
	        // 3.1重新计算
	        var S = new Date();
	        var E = new Date(data);
	        var o = getTime(S, E);

	        // 3.2重新赋值
	        divs[0].innerText = o.day;
	        divs[1].innerText = o.hour;
	        divs[2].innerText = o.minute;
	        divs[3].innerText = o.seconds;
	        // 3.3到达时间后，停止定时器
	        if (o.day == '00'&&o.hour == '00' && o.minute == '00' && o.seconds == '00')
	        {
	            clearInterval(tmp);
	            
	        }
	    }, 1000);
	    
	</script>
</body>
</html>