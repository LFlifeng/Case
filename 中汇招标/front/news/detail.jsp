<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>${detail.title}_招标资讯_招标行业最新动态_中汇招标网</title>
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
.position_nav {
	width: 1200px;
	height: 50px;
	line-height: 50px;
	margin: 0 auto;
}

.position_nav p {
	text-align: left;
	font-size: 14px;
	color: #505050;
}

.position_nav a {
	padding: 1px 8px;
}

.arc_content {
	width: 1200px;
	margin: 0 auto;
}

.arc {
	width: 886px;
	border: 1px solid #e6e6e6;
	overflow:auto;
}

.sidebar_right {
	width: 300px;
}

.arc_title {
	margin: 40px 0px 50px;
	font-size: 24px;
	color: #008FED;
	text-align: center;
	font-weight: bold;
}

.arc_info {
	background: #f4f4f4;
	height: 40px;
	line-height: 40px;
	text-align: center;
	font-size: 14px;
	margin: 0px 20px;
	color: #888888;
}

.arc_info a {
	float: right;
	padding-right: 40px;
	color: red;
}

.arc_arc {
	padding: 0px 30px;
}

.arc_arc p {
	line-height: 34px;
	color: #323232;
}

.t_table {
	padding: 20px;
}

.t_table table {
	width: 100%;
}

.t_table table {
	border-collapse: collapse;
}

.t_table tr {
	height: 34px;
	line-height: 34px;
}

.t_table tr td {
	text-align: center;
	border: 1px solid #e6e6e6;
}

.new_did {
	height: 460px;
	width: 300px;
	border: 1px solid #e6e6e6;
}

.new_did_title {
	font-size: 14px;
	height: 40px;
	background: #f4f4f4;
	text-align: left;
	padding-left: 10px;
	line-height: 40px;
	color: #646464;
}

.new_did_title_more {
	text-align: right;
	font-size: 14px;
	display: inline-block;
	float: right;
	padding-right: 8px;
}

.did_city {
	border: 1px solid #e6e6e6;
}

.new_did_l {
	padding: 10px;
}

.new_did_l li {
	height: 40px;
	line-height: 40px;
	color: #323232;
	border-bottom: 1px dashed #e6e6e6;
	overflow: hidden;
	text-overflow: ellipsis;
}

.new_did_l li:last-child {
	border-bottom: none;
}

.arc_vip {
	margin: 20px auto;
}

.blue {
	color: #008FED;
}

.blue a {
	color: #008FED;
}
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
		当前位置：<a href="/main.index.do">首页</a>><a href="/news.listIndex.do">行业资讯</a>><a
			href="#">${detail.title}</a>
	</div>

	<div class="arc_content" id="bidsdetails">

		<div class="arc fl">
			<div class="arc_title">${detail.title}</div>
			<div class="arc_info">
				<span>发布时间：${detail.ctime}</span><a href="#"></a>
			</div>
			<div class="t_table">
				<table>
					<tr>
						<td style="width: 20%;">发布时间:</td>
						<td>${detail.ctime}</td>
						<td>新闻类型:</td>
						<td>${detail.category}</td>
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
			<div class="new_did" id="hotNews"  v-cloak>
				<div class="new_did_title">
					热门新闻 <a class="new_did_title_more" href="news.listIndex.do">更多</a>
				</div>
				<ul class="new_did_l">
					<li  v-for="news in hotNewsList" :key="news.id"><a :href="'news.details.do?id=' +news.id">{{news.title}}</a></li>
				</ul>
			</div>
		</div>
		<div class="cl"></div>
	</div>
	<!-- 公共底部 -->
	<%@ include file="../common/footer.jsp"%>
	<script>

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
		$(function(){
			findHotNews();
			
		});
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
	</script>
</body>
</html>