<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<title>中汇招标----每日推送</title>
	<meta name="viewport"
		content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${skin}mobile/css/base.css">
	<link rel="stylesheet" href="${skin}mobile/css/arc_detail.css">
</head>

<body>
	<div class="zh_layout">
		<header class="zh_topBar clearfix">
			<a href="/m.index.do" class="icon_back fa fa-chevron-left l"></a>
			<span id='title_name'>每日推送</span>
		</header>
		<div class="zh_container">

			<div class="mui-scroll-wrapper" id="mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view" id="dailyPushBids">
						<li class="mui-table-view-cell" v-for="dailyPushBids in dailyPushBidsList">
						 <div class="mui-media-body">
								<a :href="'bidsMobile.details.do?id=' +dailyPushBids.id">
									{{dailyPushBids.name}}
									<div class="item_flex">
										<div class="flex"><i><img src="${skin}mobile/img/icon6.png"></i>{{dailyPushBids.province}}</div>
										<div class="flex"><i><img src="${skin}mobile/img/icon7.png"></i>{{dailyPushBids.type}}</div>
										<div class="flex"><i><img src="${skin}mobile/img/icon8.png"></i>{{dailyPushBids.time}}</div>
									</div>
								</a>
						  </div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
	<script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
	<script src="${skin}mobile/res/mui/js/mui.min.js"></script>
	<script src="${skin}mobile/js/common.js"></script>
	<script type="text/javascript">
		mui.init()
		
		var pageIndex = 1;
		var pageSize = 20;
		var pageTotal = 0;
		//vue赋值
		  var dailyPushBids=new Vue({
			el:'#dailyPushBids',
			data : 
			{
				dailyPushBidsList : []
			},
			created:function()
			{
					load();
			},
		  });
		
      //加载招标信息，采购信息数据
      function load()
		{
      	var param={
      			page:pageIndex,
      			rows:pageSize,
      			openId:'${openId}'
      	}
      	$.ajax({
				type : 'POST',
				url : '/biddingMobile.dailyPush.do',
				dataType : 'json',
				data : param,
				async : true,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) {
					
					pageTotal =parseInt( (data.total - 1) / pageSize) + 1;
					
					for(var i=0;i<data.rows.length;i++)
					{
						dailyPushBids.dailyPushBidsList.push(data.rows[i]);
					}
					if(pageIndex == 1){
						mui('#mui-scroll-wrapper').pullRefresh().endPulldownToRefresh();
						
					}
					else{
						 mui('#mui-scroll-wrapper').pullRefresh().endPullupToRefresh();
					}
					
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
			            	dailyPushBids.dailyPushBidsList=[];
			            	load();
			            	mui('#mui-scroll-wrapper').pullRefresh().endPulldownToRefresh();
			            }
			        },
			        // 上拉加载
			        up: {
			            contentrefresh: '正在加载...',
			            callback: function()
			            {
			            	
			            	if((pageIndex + 1) > pageTotal)
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
		
	</script>
</body>

</html>