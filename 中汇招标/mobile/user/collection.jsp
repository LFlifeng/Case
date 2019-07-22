<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>中汇招标----我的收藏</title>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}mobile/css/base.css">
    <link rel="stylesheet" href="${skin}mobile/css/collection.css">
</head>

<body>
    <div class="zh_layout">
        <header class="zh_topBar clearfix">
            <a href="/m.profile.do" class="icon_back fa fa-chevron-left l"></a>
            <span>我的收藏</span>
        </header>
        <div class="zh_container">
            <div class="mui-scroll-wrapper" id="isGrade">
                <div class="mui-scroll"  id="userCollectionList">
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell mui-media" v-for="userCollection in userCollectionList" :key="userCollection.id">
                            <a :href="'bidsMobile.details.do?id=' +userCollection.biddinginfoId">
                                <div class="mui-media-body">
                                    {{userCollection.biddinginfoTitle}}
                                    <div class="item_flex">
<%--                                         <div class="flex"><i><img src="${skin}mobile/img/icon6.png"></i>北京</div>
                                        <div class="flex"><i><img src="${skin}mobile/img/icon7.png"></i>招标信息</div> --%>
                                        <div class="flex"><i><img src="${skin}mobile/img/icon8.png"></i>   {{userCollection.ctime}}</div>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}mobile/res/mui/js/mui.min.js"></script>
    <script src="${skin}mobile/js/common.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <script type="text/javascript">
    mui.init({
		pullRefresh : {
			container : "#isGrade",//下拉刷新、上拉加载容器标识
			// 下拉刷新
			down : {
				style : 'circle',
				color : '#2bd009',
				contentover : '释放立即刷新',
				contentrefresh : '正在刷新...',
				callback : function() {
					pageIndex = 1;
					userCollection.userCollectionList = [];
					load();
					
				}
			},
			// 上拉加载
			up : {
				contentrefresh : '正在加载...',
				callback : function() {
					if ((pageIndex + 1) > pageTotal) {
						mui('#isGrade').pullRefresh().endPullupToRefresh();
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
       var userCollection = new Vue({
		el : "#userCollectionList",
		data : {
			userCollectionList : []
		},
		created:function(){
			load();
		}
  	});
       
       //加载数据
       function load()
		{
       	var param={
       			page:pageIndex,
       			rows:pageSize,
       	}
       	$.ajax({
				type : 'POST',
				url : '/userCollectionMobile.Userlist.do',
				dataType : 'json',
				data : param,
				async : true,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) 
				{
					for(var i=0;i<data.rows.length;i++)
					{
						userCollection.userCollectionList.push(data.rows[i]);
					}
				
					pageTotal = (data.total - 1) / pageSize + 1;
					if (pageIndex == 1) {
						mui('#isGrade').pullRefresh().endPulldownToRefresh();
					} else {
						mui('#isGrade').pullRefresh()
								.endPullupToRefresh();
					}
				}
			});
	    }
        
    </script>
</body>

</html>