<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<title>中汇招标----首页</title>
	<link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
	<link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${skin}mobile/css/base.css">
	<link rel="stylesheet" href="${skin}mobile/css/index.css">
	<link rel="stylesheet" type="text/css" href="${skin}js/layui/css/layui.css" media="all">
	<style>
	[v-cloak] {
				display: none;
			 }
	</style>
</head>
<body>
	<div class="zh_layout">
		<!-- 头部搜索 -->
<!-- 		<header class="mui-bar mui-bar-nav" style="display: flex;">
			<div class="flex flex_content">
				中汇招标网
			</div>
		</header>
 -->		<div class="zh_container">
			<div class="mui-scroll-wrapper" id="mui-scroll-wrapper">
				<div class="mui-scroll">
					<!-- 轮播图部分 -->
					<div class="mui-content">
						<div class="mui-slider">
							<div class="mui-slider-group mui-slider-loop">
								<!--支持循环，需要重复图片节点-->
								<div class="mui-slider-item mui-slider-item-duplicate">
									<a href="#"><img src="${skin}mobile/img/banner1.png" /></a>
								</div>
								<div class="mui-slider-item">
									<a href="#"><img src="${skin}mobile/img/banner2.png" /></a>
								</div>
								<div class="mui-slider-item">
									<a href="#"><img src="${skin}mobile/img/banner1.png" /></a>
								</div>
								<div class="mui-slider-item mui-slider-item-duplicate">
									<a href="#"><img src="${skin}mobile/img/banner2.png" /></a>
								</div>
							</div>
						</div>
					</div>
					<!-- 服务分类 -->
					<div class="index_menu">
						<li>
							<a class='message' href="/m.biddInformation.do"><img src="${skin}mobile/img/zhaobiao.png" />
								<p>招标信息</p>
							</a>
						</li>
						<li>
							<a class='message' href="/m.biddInformation.do"><img src="${skin}mobile/img/caigou.png" />
								<p>采购信息</p>
							</a>
						</li>
						<li>
							<a  href="/m.biddProjectInformation.do"><img src="${skin}mobile/img/xiangmu.png" />
								<p>项目信息</p>
							</a>
						</li>
						<li>
							<a href="/m.serviceHall.do"><img src="${skin}mobile/img/fuwu.png" />
								<p>产品服务</p>
							</a>
						</li>
					</div>
					<!-- 热门推荐 -->
					<ul class="mui-table-view"  id="hotRecommended"  v-cloak>
						<div class="index_title">
							热门推荐 <a href="m.search.do" class="r">筛选</a>
						</div>
						<li class="mui-table-view-cell" v-for="hotRecommended in hotRecommendedList">
						 <div class="mui-media-body">
								<a :href="'bidsMobile.details.do?id=' +hotRecommended.id">
									{{hotRecommended.name}}
									<div class="item_flex">
										<div class="flex"><i><img src="${skin}mobile/img/icon6.png"></i>{{hotRecommended.province}}</div>
										<div class="flex"><i><img src="${skin}mobile/img/icon7.png"></i>{{hotRecommended.type}}</div>
										<div class="flex"><i><img src="${skin}mobile/img/icon8.png"></i>{{hotRecommended.time}}</div>
									</div>
								</a>
						  </div>
						</li>
					</ul>
			</div>
		</div>
		<!-- 底部工具栏 -->
		<footer class="zh_tabs">
			<a href="/m.index.do" class="tab_home fa fa-home now"><span class="now">首页</span></a>
			<a href="/m.trackerList.do" class="tab_bookmark fa fa-bookmark"><span>推送</span></a>
			<a href="/m.profile.do" class="tab_user fa fa-user"><span>我的</span></a>
		</footer>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
	<script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
	<script src="${skin}mobile/res/mui/js/mui.min.js"></script>
	<script src="${skin}js/layui/layui.js"></script>
	<script src="${skin}mobile/js/common.js"></script>
	<script type="text/javascript" charset="utf-8">
	
	
		function IsPC() 
		{
	        var userAgentInfo = navigator.userAgent;
	        var Agents = ["Android", "iPhone",
	            "SymbianOS", "Windows Phone",
	            "iPad", "iPod"];
	        var flag = true;
	        for (var v = 0; v < Agents.length; v++) {
	            if (userAgentInfo.indexOf(Agents[v]) > 0) {
	                flag = false;
	                break;
	            }
	        }
	        return flag;
        }
		 var ispc = IsPC();
	     if (ispc) 
	     {
	       location.href = "/main.index.do"
	     } 
		var pageIndex = 1;
		var pageSize = 10;
		var date=-5;
		var pageTotal=0;
		var gallery = mui('.mui-slider');
		gallery.slider({
			interval: 5000 //自动轮播周期，若为0则不自动播放，默认为0；
		});
		
		  //vue赋值
		  var hotRecommended=new Vue
		  ({
			el:'#hotRecommended',
			data : 
			{
				hotRecommendedList : []
			},
			created:function()
			{
				load();
			},
			methods:
			{
			
			}
		  });
		  
        //加载数据
        function load()
		{
        	var param={
        			page:pageIndex,
        			rows:pageSize,
        			date:date
        	}
        	$.ajax({
				type : 'POST',
				url : '/bidsMobile.list.do',
				dataType : 'json',
				data : param,
				async : true,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) 
				{
					for(var i=0;i<data.rows.length;i++)
					{
						hotRecommended.hotRecommendedList.push(data.rows[i]);
					}
					pageTotal = (data.total -1) / pageSize + 1;
					if(pageIndex == 1)
					{
						mui('#mui-scroll-wrapper').pullRefresh().endPulldownToRefresh();
					}else{
						mui('#mui-scroll-wrapper').pullRefresh().endPullupToRefresh();
					}
					// 
				}
			});
		    }
        
		  mui.init({
			    pullRefresh: {
			        container: "#mui-scroll-wrapper",//下拉刷新、上拉加载容器标识
			        // 下拉刷新
			        down: {
			            style: 'circle',
			            color: '#2bd009',
			            contentover: '释放立即刷新',
			            contentrefresh: '正在刷新...',
			            callback: function()
			            {
			            	pageIndex = 1;
			            	hotRecommended.hotRecommendedList=[];
			            	load();
			            	
			            }
			        },
			        // 上拉加载
			        up: {
			            contentrefresh: '正在加载...',
			            callback: function()
			            {
			            	if((pageIndex+1)>pageTotal)
			            	{
								mui('#mui-scroll-wrapper').pullRefresh().endPullupToRefresh();
			            		return;
			            	}
			            	pageIndex = pageIndex + 1;
			            	load();
			            }
			        }
			    }
			});
		  
		  $(".message").on("tap",function()
		  {
			  if("招标信息" == $(this).find("p").html())
			  {
				  localStorage.setItem("typeMessage","招标")
			  }
			  if("采购信息" == $(this).find("p").html())
			  {
				  localStorage.setItem("typeMessage","采购")
			  }
		  })
	</script>
</body>

</html>