<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>中汇招标----订阅</title>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
    <link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}mobile/css/base.css">
    <link rel="stylesheet" href="${skin}mobile/css/trackerList.css">
</head>

<body>
    <div class="zh_layout">
        <header class="zh_topBar clearfix">
            <span>跟踪器</span>
            <a href="/m.tracker.do" class=" r"><i class="fa fa-plus-square-o"></i></a>
        </header>
        <div class="zh_container">
            <div class="mui-scroll-wrapper"  id="mui-scroll-wrapper">
                <div class="mui-scroll"   id="trackerList">
                    <ul class="mui-table-view"  >
                        <li class="mui-table-view-cell" v-for="trackerList in trackerList"  :key="trackerList.id">
                            <a :href="'m.subscribe.do?trackerId=' +trackerList.id" class="mui-navigate-right">
                                <div class="trackerTitle">{{trackerList.trackerName}}</div>
                                <div class="trackerContent">
                                    <span>{{trackerList.keywords.replace(/,/g,' ')}}</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 底部工具栏 -->
        <footer class="zh_tabs">
			<a href="/m.index.do" class="tab_home fa fa-home"><span>首页</span></a>
			<a href="/m.trackerList.do" class="tab_bookmark fa fa-bookmark  now"><span class="now">推送</span></a>
			<a href="/m.profile.do" class="tab_user fa fa-user"><span>我的</span></a>
        </footer>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}mobile/res/mui/js/mui.min.js"></script>
    <script src="${skin}mobile/js/common.js"></script>
    <script type="text/javascript">

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
		            	trackerList.trackerList=[];
		            	load();
		            	mui('#mui-scroll-wrapper').pullRefresh().endPulldownToRefresh();
		            	
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
        mui.init()

        var pageIndex = 1;
		var pageSize = 20;
		var pageTotal = 0;
        
        var trackerList = new Vue({
        	el:"#trackerList",
        	data:{
        		trackerList:[]
        	},
            created: function (){
            	load();
            }
        });
        
        function load(){
        	var param={
        			page:pageIndex,
        			rows:pageSize,

        	}
        	$.ajax({
				type : 'POST',
				url : '/trackerMobile.list.do',
				dataType : 'json',
				data : param,
				async : true,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) 
				{
					for(var i=0;i<data.rows.length;i++)
					{
						trackerList.trackerList.push(data.rows[i]);
					}
					mui('#mui-scroll-wrapper').pullRefresh().endPullupToRefresh();
					pageTotal = (data.total -1)/pageSize + 1;
			
				}
			});
        }
    </script>
</body>

</html>