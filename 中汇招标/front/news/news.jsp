<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>招标资讯_招标行业最新动态_中汇招标网</title>
<meta name="keywords" content="招标新闻,招标资讯,招标动态">
<meta name="description" content="中汇招标网招标提供最新最专业的招标信息,招标行业动态">
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="${skin}js/layui/layui.js"></script>
<link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="${skin}js/layui/css/layui.css" media="all">
<style type="text/css">
.head_nav .nav ul li:nth-child(6) a {
	background-color: #505050;
	color: #fff;
}

.news_content {
	width: 1200px;
	margin: 0 auto;
}

.news_l {
	width: 888px;
	border: 1px solid #e6e6e6;
}

.news_sidebar_r {
	width: 300px;
}

.news_l_l {
	padding: 0px;
}

.news_l_l li {
	height: 140px;
}

.news_l_l li a:hover {
	
}

.news_title {
	font-size: 18px;
	font-weight: 600;
	text-overflow: ellipsis;
}

.classify {
	padding: 0px 8px;
	color: #008FED;
	font-size: 16px;
}

.classify a {
	color: #008FED;
	font-size: 16px;
}

.news_title_abstract {
	line-height: 22px;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3;
	overflow: hidden;
	color: #9a9a9a;
	margin-top: 10px;
	height: 70px;
	overflow: hidden;
	display: block;
}

.news_l_r a:hover {
	color: #9a9a9a;
}

.news_l_border {
	display: flex;
	padding: 20px 30px;
	border-bottom: 1px dashed #e6e6e6;
}

.news_l_r {
	margin-left: 20px;
	flex: 1;
	display: flex;
	flex-direction: column;
}

.news_l_border:hover {
	background: #f5f5f5;
}

/*热门文章*/
.hot_news {
	border: 1px solid #e6e6e6;
}

.hot_news_title {
	font-size: 14px;
	height: 40px;
	background: #f4f4f4;
	text-align: left;
	padding-left: 10px;
	line-height: 40px;
	color: #646464;
}

.hot_news_l {
	overflow: hidden;
	padding: 10px;
}

.hot_news_l li {
	height: 34px;
	line-height: 34px;
	font-size: 14px;
}

.hot_news_l li a {
	color: #323232;
	font-size: 14px;
}

.hot_news_l li a:hover {
	color: #008FED;
}

.news_item {
	display: flex;
	align-items: center;
	margin-top: 10px;
	font-size: 13px;
	justify-content: space-between;
}

.news_item .abstract {
	padding: 2px 5px;
	border: 1px solid #008FED;
	border-radius: 3px;
	margin-right: 8px;
	color: #008FED;
}

.new_ad {
	width: 300px;
}

.new_ad img {
	margin-bottom: 10px;
	width: 300px;
	height: 180px;
}

.page {
	margin: 30px auto;
	width: 600px;
	height: 50px;
}

.page li {
	height: 30px;
	width: 30px;
	line-height: 30px;
	text-align: center;
	border: 1px solid #e6e6e6;
	float: left;
	margin-left: 5px;
}

.page li a {
	display: block;
	color: #505050;
}

.page .act {
	background: #008FED;
	border: none;
}

.page .act a {
	color: #ffffff;
}
#tdd {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
/* 分页部分 */
#demo1 {
	margin: 10px auto;
	width: 600px;
	height: 50px;
}

[v-cloak] {
    display: none;
}
</style>
</head>
<body>
	<!-- 公共头部 -->
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
	<div class="position_nav">
		当前位置：<a href="/main.index.do">首页</a>><a href="#">行业资讯</a>
	</div>
	<div class="news_content">
		<div class="news_l fl" id="newsList" v-cloak>

			<ul class="news_l_l">
				<li class="news_l_border" v-for="news in newsList" :key="news.id">

					<div class="news_l_r">
						<a :href="'news.details.do?id=' +news.id" class="news_title">{{news.title}}</a>
						<span class="news_title_abstract" id="news_content" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{showText(news.content)}}
						</span>
			
						<div class="news_item">
							<a class="abstract" target="_blank">{{news.category}}</a>
							<span>发布于：{{news.ctime}}</span>
						</div>
					</div>
				</li>
			</ul>

		</div>

		<div class="news_sidebar_r fl fl10">
			<div class="hot_news" id="hotNews" v-cloak style="height:402px;">
				<div class="hot_news_title">热门新闻</div>
				<ul class="hot_news_l" >
					<li id="tdd" v-for="news in hotNewsList" :key="news.id"><a :href="'news.details.do?id=' +news.id">{{news.title}}</a></li>
				</ul>
			</div>
			<div class="new_ad t10">
				<!-- 	<img src="../img/1111.jpg">
					<img src="../img/1500.jpg"> -->
			</div>
		</div>
	<div id="paging"></div>
	<!-- 公共底部 -->
	</div>

	<div class="cl"></div>		
			<!-- 分页容器 -->
	
	<%@ include file="../common/footer.jsp"%>
	<script>
		//定义全局变量
		var pageIndex = 1;
		var pageSize = 10;
		var totalCount = 0;
		var category = '';
		var title = '';
		//使用Vue渲染模板，初始化时是没有数据的，需要ajax请求拿到数据
		var vue = new Vue({
			el : "#newsList",
			methods:{
				showText:function(data)
					{
					data = data.replace(/<[^>]+>/g,"");
					data = data.replace(/&nbsp;/g,"");
						return data;
					}
			},
			data : {
				newsList : null
			}

		});
		var hotNews = new Vue({
			el : "#hotNews",
			data : {
				hotNewsList : null
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
		function findNewsBycategory(c) {
			if (c) {
				category = c;
			}
			loadList();//第二个参数不能用变量pageSize，因为当切换每页大小的时候会出问题
		};

		//加载完成
		$(function() {
			var c = localStorage.getItem('category');
			if (c) {
				category = c;
				localStorage.removeItem('category');
			}
			var lx = localStorage.getItem('lx');
			if (lx) {
				category = lx;
				localStorage.removeItem('lx');
			}
			var titles = localStorage.getItem('title');
			if (titles) {
				title = titles;
				localStorage.removeItem('title');
				$("#titles").val(titles);
			}
			findHotNews();
			loadList();//第二个参数不能用变量pageSize，因为当切换每页大小的时候会出问题
		
		});

		function loadList() {
			//查询条件
			var param = {
				page : pageIndex,
				rows : pageSize,
				category : category,
				title : title
			};
			$.ajax({
				type : 'POST',
				url : '/news.list.do',
				dataType : 'json',
				data : param,
				async : false,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) {
					vue.newsList = data.rows;
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
		};

		//跳转到采购信息页面
		function toPurchaseIndex() {
			localStorage.setItem("leixing", "采购公告");
		}
	</script>
</body>
</html>
