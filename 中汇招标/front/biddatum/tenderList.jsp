<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <title>中汇招标----标书列表</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front//js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front//js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${skin}front//css/base.css">
    <link rel="stylesheet" type="text/css" href="${skin}front//css/header.css">
    <link rel="stylesheet" type="text/css" href="${skin}front//css/footer.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/index.css"> -->
    <link rel="stylesheet" href="${skin}front/css/tenderList.css">
    
    <style type="text/css">
    	[v-cloak] {
    		display: none;
		}
    </style>
</head>

<body>
	<%@ include file="../common/header.jsp"%>
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
    <div class="position_nav">
        当前位置：<a href="/main.index.do">首页</a>><a href="/bidDatum.listIndex.do">标书列表</a>
    </div>
    <div class="news_content clearfix">
        <div class="news_l fl" id="bidDatumList" v-cloak>
            <ul class="news_l_l">
                <li class="news_l_border" v-for="bidDatum in bidDatumList" :key="bidDatum.id">
                    <div class="news_item">
                        <a class="news_title" :href="'bidDatum.details.do?id=' +bidDatum.id">{{bidDatum.tltle}}</a>
                        <span>发布于：{{bidDatum.ctime}}</span>
                        <span>来源：{{bidDatum.source}}</span>
                    </div>
                    <a class="news_title_abstract" href="#">{{bidDatum.tltle}}</a>
                    <div class="news_attachment">
                        <span>附件：</span>
                        <div><a :href='bidDatum.attaUrl'>{{bidDatum.accessory}}</a></div>
                    </div>
                </li>

            </ul>
           	<!-- 分页容器 -->
			<div id="paging"></div>
        </div>
        <div class="news_sidebar_r fl fl10">
			<div class="hot_news" id="hotNews" v-cloak>
				<div class="hot_news_title">热门新闻</div>
				<ul class="hot_news_l" >
					<li id="tdd" v-for="news in hotNewsList" :key="news.id"><a :href="'news.details.do?id=' +news.id">{{news.title}}</a></li>
				</ul>
			</div>
        </div>
    </div>

    </div>
    <!-- 公共底部 -->
    <%@ include file="../common/footer.jsp"%>

    </div>

    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script src="${skin}front/js/search.js"></script>
    <script>
  	//定义全局变量
		var pageIndex = 1;
		var pageSize = 8;
		var totalCount = 0;
		//使用Vue渲染模板，初始化时是没有数据的，需要ajax请求拿到数据
		var bidDatum = new Vue({
			el : "#bidDatumList",
			data : {
				bidDatumList: []
			},
			created: function (){
				loadList();
				
			}

		});
		//热门新闻
		var hotNews = new Vue({
			el : "#hotNews",
			data : {
				hotNewsList : []
			},
			created:function(){
				findHotNews();
			}

		});
		//查询热门新闻
		function findHotNews(){
			 $.ajax({
			        type: 'POST',
			        url: '/news.hotNews.do',
			        dataType: 'json',
			      
			        success: function (data)
			        {
			        	hotNews.hotNewsList = data;
			        }
	        			
			    });
		}
		function loadList(){
			//查询条件
			var param = {
				page : pageIndex,
				rows : pageSize,
			};
			$.ajax({
				type : 'POST',
				url : '/bidDatum.list.do',
				dataType : 'json',
				data : param,
				async : false,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) {
					bidDatum.bidDatumList = data.rows;
					totalCount = data.total;
					layui.use('laypage', function() {
						laypage = layui.laypage;
						laypage.render({
							elem : 'paging',
							count : totalCount,
							curr : pageIndex,
							theme : '#c8302e',
							limit : 10,
							layout : [ 'count', 'prev', 'page', 'next',
									'limit', 'refresh', 'skip' ],
							jump : function(obj, first) {
								//点击非第一页页码时的处理逻辑。比如这里调用了ajax方法，异步获取分页数据
								if (!first) {
									pageIndex = obj.curr;
									pageSize = obj.limit;
									loadList();
								}
							}
						});
					});
				}

			});
			
			
		}
		
		
    </script>
    <script type="text/javascript">
    
    $(function (){
    
    	loadList();
    	  
    });
    </script>
</body>

</html>