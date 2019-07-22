<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>拟在建项目_独家项目_2019年最新的拟在建项目尽在中汇招标网</title>
	<meta name="keywords" content="拟在建项目,拟建项目,精选项目信息">
	<meta name="description" content="中汇招标网为您提供拟在建项目,独家项目，提供拟在建项目信息跟踪，以及专盯项目等服务是国内专业的拟在建工程项目信息跟踪服务提供商。">
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
<script src="${skin}js/layui/layui.js"></script>
<link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="${skin}js/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css"
	href="${skin}front/css/list.css">
<style>
.head_nav .nav ul li:nth-child(4) a {
	background-color: #505050;
	color: #fff;
}

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

/* 主体部分 */
.list_content {
	width: 1200px;
	margin: 0 auto;
}

.list_search {
	padding: 20px;
	border: 1px solid #e6e6e6;
	align-items: center;
	text-align: left;
	background: #f9f9f9;
}

.pr {
	margin-top: 8px;
	height: 34px;
	line-height: 34px;
	float: left;
	width: 100px;
	text-align: center;
}

.category {
	margin-top: 8px;
	width: 1040px;
	float: left;
}

.category li {
	padding: 3px 8px;
	height: 24px;
	line-height: 24px;
	display: inline-block;
	margin-top: 6px;
}

.category_city_select {
	background: #ba3f44;
	border-radius: 3px;
}

.category_city_select a {
	color: #fff;
}

.category_leixing_select {
	background: #ba3f44;
	border-radius: 3px;
}

.category_leixing_select a {
	color: #fff;
}

.category_date_select {
	background: #ba3f44;
	border-radius: 3px;
}

.category_date_select a {
	color: #fff;
}

.category li a {
	display: inline-block;
}

.category li:hover {
	background-color: #ba3f44;
	border-radius: 3px;
}

.category li:hover a {
	color: #fff;
}

.title_search {
	margin-top: 8px;
	width: 280px;
	height: 36px;
	line-height: 36px;
	padding-left: 5px;
	color: #323232;
	border: 1px solid #e6e6e6;
	border-radius: 3px;
}

.list_btn {
	margin: 8px 0px 0px 20px;
	width: 120px;
	height: 38px;
	line-height: 38px;
	background: #ba3f44;
	color: #ffffff;
	text-align: center;
	border-radius: 3px;
	border: none;
}

.list_list_content {
	width: 1200px;
	margin: 20px auto;
}

.list_l {
	width: 886px;
	border: 1px solid #e6e6e6;
}

.sidebar_right {
	width: 300px;
}

.t_top {
	width: 100%;
	height: 40px;
	line-height: 40px;
	background: #f8f8f8;
}

.list_l table {
	width: 100%;
}

.t_top tr th {
	text-align: center;
}

.t_t {
	text-align: center;
	height: 34px;
	line-height: 14px;
	color: #505050;
	border-bottom: 1px dashed #e6e6e6;
}

.list_ad {
	width: 300px;
	height: 240px;
}

.list_city {
	margin-top: 10px;
	width: 300px;
	border: 1px solid #e6e6e6;
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

.page {
	font-weight: 900;
	height: 40px;
	text-align: center;
	color: #888;
	margin: 20px auto 0;
	background: #f2f2f2;
}

.pagelist {
	font-size: 0;
	background: #fff;
	height: 50px;
	line-height: 50px;
}

.pagelist span {
	font-size: 14px;
}

.pagelist .jump {
	border: 1px solid #ccc;
	padding: 5px 8px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 5px;
}

.pagelist .bgprimary {
	cursor: default;
	color: #fff;
	background: #337ab7;
	border-color: #337ab7;
}

.jumpinp input {
	width: 55px;
	height: 26px;
	font-size: 13px;
	border: 1px solid #ccc;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	text-align: center;
}

.ellipsis {
	padding: 0px 8px;
}

.jumppoint {
	margin-left: 30px;
}

.pagelist .gobtn {
	
}

.bgprimary {
	cursor: default;
	color: #fff;
	background: #337ab7;
	border-color: #337ab7;
}

table {
	table-layout: fixed;
}

#tdd {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
[v-cloak] {
    display: none;
}
/* VIP */
.vip_list {
    border: 1px solid #e6e6e6;
}
.vip_list table {
    width: 100%;
}
.vip_list .t_t td a {
    display: inline-block;
    width: 365px;
    height: 14px;
	overflow: hidden;
	text-overflow:ellipsis;
	white-space: nowrap;
    text-align: left;
    font-size: 15px;
    text-indent: 10px;
}
.vip_list .t_t td i,
.list_l .t_t td i {
    background-color: #ea9961;
    padding: 0 5px;
    color: #fff;
    border-radius: 2px;
}
.vip_list .t_t td:nth-child(2) div {
    display: inline-block;
    color: #ba3f44
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
		当前位置：<a href="/main.index.do">首页</a>><a id="topTitle"
			href="/biddinginfo.listIndex.do">项目中心</a>
	</div>
	<div class="list_content">
		<div class="list_search">
			<div class="pr">地区选择：</div>
			<ul class="category">
				<li id="li_0" class="category_city_select"><a
					onclick="queryByRegion('','0')">全部</a></li>
				<li id="li_1"><a onclick="queryByRegion('北京','1')">北京</a></li>
				<li id="li_2"><a onclick="queryByRegion('天津','2')">天津</a></li>
				<li id="li_3"><a onclick="queryByRegion('河北','3')">河北</a></li>
				<li id="li_4"><a onclick="queryByRegion('山西','4')">山西</a></li>
				<li id="li_5"><a onclick="queryByRegion('内蒙古','5')">内蒙古</a></li>
				<li id="li_6"><a onclick="queryByRegion('上海','6')">上海</a></li>
				<li id="li_7"><a onclick="queryByRegion('江苏','7')">江苏</a></li>
				<li id="li_8"><a onclick="queryByRegion('浙江','8')">浙江</a></li>
				<li id="li_9"><a onclick="queryByRegion('安徽','9')">安徽</a></li>
				<li id="li_10"><a onclick="queryByRegion('江西','10')">江西</a></li>
				<li id="li_11"><a onclick="queryByRegion('山东','11')">山东</a></li>
				<li id="li_12"><a onclick="queryByRegion('福建','12')">福建</a></li>
				<li id="li_13"><a onclick="queryByRegion('广东','13')">广东</a></li>
				<li id="li_14"><a onclick="queryByRegion('广西','14')">广西</a></li>
				<li id="li_15"><a onclick="queryByRegion('海南','15')">海南</a></li>
				<li id="li_16"><a onclick="queryByRegion('湖南','16')">湖南</a></li>
				<li id="li_17"><a onclick="queryByRegion('湖北','17')">湖北</a></li>
				<li id="li_18"><a onclick="queryByRegion('河南','18')">河南</a></li>
				<li id="li_19"><a onclick="queryByRegion('辽宁','19')">辽宁</a></li>
				<li id="li_20"><a onclick="queryByRegion('吉林','20')">吉林</a></li>
				<li id="li_21"><a onclick="queryByRegion('黑龙江','21')">黑龙江</a></li>
				<li id="li_22"><a onclick="queryByRegion('陕西','22')">陕西</a></li>
				<li id="li_23"><a onclick="queryByRegion('甘肃','23')">甘肃</a></li>
				<li id="li_24"><a onclick="queryByRegion('青海','24')">青海</a></li>
				<li id="li_25"><a onclick="queryByRegion('宁夏','25')">宁夏</a></li>
				<li id="li_26"><a onclick="queryByRegion('新疆','26')">新疆</a></li>
				<li id="li_27"><a onclick="queryByRegion('重庆','27')">重庆</a></li>
				<li id="li_28"><a onclick="queryByRegion('四川','28')">四川</a></li>
				<li id="li_29"><a onclick="queryByRegion('贵州','29')">贵州</a></li>
				<li id="li_30"><a onclick="queryByRegion('云南','30')">云南</a></li>
				<li id="li_31"><a onclick="queryByRegion('西藏','31')">西藏</a></li>
			</ul>
			<div class="pr">项目类型：</div>
			<ul class="category">
				<li id="li_32" class="category_leixing_select"><a
					onclick="queryByLeixing('','32')">全部</a></li>
				<li id="li_33"><a id="project_vip" onclick="queryByLeixing('VIP精选','33')">VIP精选</a></li>
				<li id="li_34"><a id="project_nj" onclick="queryByLeixing('拟建项目','34')">拟建项目</a></li>
				<li id="li_35"><a id="project_yg" onclick="queryByLeixing('审批项目','35')">审批项目</a></li>
				<li id="li_36"><a id="project_gg" onclick="queryByLeixing('政府项目','36')">政府项目</a></li>
				<li id="li_37"><a id="project_bg" onclick="queryByLeixing('商业项目','37')">商业项目</a></li>
				<li id="li_43"><a id="project_zb" onclick="queryByLeixing('业主项目','43')">业主项目</a></li>
				<li id="li_43"><a id="project_zb" onclick="queryByLeixing('企业项目','44')">企业项目</a></li>

			</ul>
			<div class="pr">时间范围：</div>
			<ul class="category">
				<li id="li_64"  class="category_date_select"><a
					onclick="queryByDate(0,'64')">全部</a></li>
				<li id="li_39" ><a
					href="javascript:void(0)" onclick="queryByDate(1,'39')">一周</a></li>
				<li id="li_40"><a href="javascript:void(0)"
					onclick="queryByDate(2,'40')">一个月</a></li>
				<li id="li_41"><a href="javascript:void(0)"
					onclick="queryByDate(3,'41')">三个月</a></li>
				<li id="li_42"><a href="javascript:void(0)"
					onclick="queryByDate(4,'42')">半年</a></li>
			</ul>
			<div class="pr">标题搜索：</div>
			<div>
				<input type="text" class="title_search" placeholder="输入关键词"
					id="title" />
				<input type="button" value="搜索" class="list_btn"  onclick="queryByTitle()"/>
			</div>
			</ul>
			<div class="cl"></div>
		</div>
		<div class="list_list_content clearfix" id="biddingInfolist" >
			<!-- <div class="list_l fl" v-cloak>
				<table>
					<tbody>
						<tr class="t_top">
							<th style="width: 15%;">项目类别</th>
							<th style="width: 57%;">项目名称</th>
							<th style="width: 13%;">所在地区</th>
							<th style="width: 15%;">发布时期</th>
						</tr>
						<tr class="t_t" v-for="biddingInfo in biddingInfolist"
							:key="biddingInfo.id">
							<td>{{biddingInfo.projectType}}</td>
							<td align="left" id="tdd"><a
								:href="'biddinginfo.details.do?id=' +biddingInfo.id"
								target="blank">{{biddingInfo.projectName}}</a></td>
							<td>{{biddingInfo.province}}</td>
							<td>{{biddingInfo.ctime.substring(0,10)}}</td>
						</tr>

					</tbody>
				</table>

			</div> -->

			<%-- <div class="sidebar_right fl10 fl">
				<div class="list_ad">
					<a><img src="${skin}front/img/ad.jpg"></a>
				</div>
				<div class="list_city t10">
					<div class="did_reg_title">地区选择</div>
					<div class="reg">
						<h3>华北地区</h3>
						<span><a onclick="queryByRegion('北京','1')">北京</a></span><span><a
							onclick="queryByRegion('天津','2')">天津</a></span><span><a
							onclick="queryByRegion('河北','3')">河北</a></span><span><a
							onclick="queryByRegion('山西','4')">山西</a></span><span><a
							onclick="queryByRegion('内蒙古','5')">内蒙古</a></span>
					</div>
					<div class="reg">
						<h3>华东地区</h3>
						<span><a onclick="queryByRegion('上海','6')">上海</a></span><span><a
							onclick="queryByRegion('江苏','7')">江苏</a></span><span><a
							onclick="queryByRegion('浙江','8')">浙江</a></span><span><a
							onclick="queryByRegion('安徽','9')">安徽</a></span><span><a
							onclick="queryByRegion('江西','10')">江西</a></span><span><a
							onclick="queryByRegion('山东','11')">山东</a></span><span><a
							onclick="queryByRegion('福建','12')">福建</a></span>
					</div>
					<div class="reg">
						<h3>华南地区</h3>
						<span><a onclick="queryByRegion('广东','13')">广东</a></span><span><a
							onclick="queryByRegion('广西','14')">广西</a></span><span><a
							onclick="queryByRegion('海南','15')">海南</a></span>
					</div>
					<div class="reg">
						<h3>华中地区</h3>
						<span><a onclick="queryByRegion('湖南','16')">湖南</a></span><span><a
							onclick="queryByRegion('湖北','17')">湖北</a></span><span><a
							onclick="queryByRegion('河南','18')">河南</a></span>
					</div>
					<div class="reg">
						<h3>东北地区</h3>
						<span><a onclick="queryByRegion('辽宁','19')">辽宁</a></span><span><a
							onclick="queryByRegion('吉林','20')">吉林</a></span><span><a
							onclick="queryByRegion('黑龙江','21')">黑龙江</a></span>
					</div>
					<div class="reg">
						<h3>西北地区</h3>
						<span><a onclick="queryByRegion('陕西','22')">陕西</a></span><span><a
							onclick="queryByRegion('甘肃','23')">甘肃</a></span><span><a
							onclick="queryByRegion('青海','24')">青海</a></span><span><a
							onclick="queryByRegion('内蒙古','25')">宁夏</a></span><span><a
							onclick="queryByRegion('新疆','26')">新疆</a></span>
					</div>
					<div class="border_bottom_none reg">
						<h3>西南地区</h3>
						<span><a onclick="queryByRegion('重庆','27')">重庆</a></span><span><a
							onclick="queryByRegion('四川','28')">四川</a></span><span><a
							onclick="queryByRegion('贵州','29')">贵州</a></span><span><a
							onclick="queryByRegion('云南','30')">云南</a></span><span><a
							onclick="queryByRegion('西藏','31')">西藏</a></span>
					</div>
				</div>
			</div> --%>
			<div class="vip_list">
				<table>
					<tbody>
						<tr class="t_top">
							<th style="width:35%">项目名称</th>
							<th style="width:18%">剩余时间</th>
							<th style="width:10%">项目类型</th>
							<th style="width:5%">项目状态</th>
							<th style="width:10%">所在地区</th>
							<th style="width:15%">项目类别</th>
							<th style="width:10%">日期</th>
						</tr>
						<tr class="t_t" v-for="biddingInfo in biddingInfolist"
							:key="biddingInfo.id">
							<td align="left" id="tdd"><a href="javascript:;" :href="'biddinginfo.details.do?id=' +biddingInfo.id"
								target="blank">{{biddingInfo.projectName}} </a></td>
							<td>
								<span>剩余</span>
								<div></div>
								<span>天</span>
								<div></div>
								<span>小时</span>
								<div></div>
								<span>分</span>
								<div></div>
								<span>秒</span>
							</td>
							<td>{{biddingInfo.projectType}}</td>
							<td>履行中</td>
							<td>{{biddingInfo.province}}</td>
							<td>{{biddingInfo.industryThree}}</td>
							<td>{{biddingInfo.ctime.substring(0,10)}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
			<!-- 分页容器 -->
			<div id="paging"></div>
	</div>
	<div class="cl"></div>
	<%@ include file="../common/footer.jsp"%>
	<script>
		//定义全局变量
		var pageIndex = 1;
		var pageSize = 20;
		var totalCount = 0;
		var leixing = '';
		var date = '';
		var region = '';
		var title = '';
		var type = '';

		//使用Vue渲染模板，初始化时是没有数据的，需要ajax请求拿到数据
		var vue = new Vue({
			el : "#biddingInfolist",
			data : {
				biddingInfolist : null
			},
			watch: {     
				    biddingInfolist: function () {
					var _this = this;

		            _this.$nextTick(function () {
						var datetime;
						var i=2;
					    $.each(this.biddingInfolist,function(index,item)
					    {
					    	var data=item.deadline+' 23:59:59';
							data = data.replace("-","/");
							data = data.replace("-","/");
					    	loadTime(i++,data,item.ctime); 
					    }) 
		            });
					
				 }
			}
		});
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
		
		//加载完成
		$(function() {
			/* 			var leixings = localStorage.getItem("leixing");
			 if (leixings) {
			 leixing = leixings;
			 localStorage.removeItem('leixing');
			 document.getElementById('topTitle').innerHTML = "采购信息";
			 cha
			 ngeClassByLexing(leixings);
			 }*/
			 
			 /*首页精选项目入口*/
			 if(localStorage.getItem("jxsmtype") != null){
				 $("#"+localStorage.getItem("jxsmtype")).click();
				 localStorage.removeItem("jxsmtype")
			 }
			 
			 
			var types = localStorage.getItem("type");
			if (types) {
				type = types;
				localStorage.removeItem('type');
				$("#title").val(types);
				$("#titles").val(types);
			}

			var titles = localStorage.getItem("title");
			if (titles) {
				title = titles;
				localStorage.removeItem('title');
			}
			/*
			var regions = localStorage.getItem("region");
			if (regions) {
			region = regions;
			localStorage.removeItem('region');
			changeClassByRegions(regions);
			}
			 */
			var lx = localStorage.getItem("lx");
			if (lx) {
				leixing = lx;
				localStorage.removeItem('lx');
				changeClassByLexing(lx);
			}
			loadList();//第二个参数不能用变量pageSize，因为当切换每页大小的时候会出问题
		});
		//根据类型查询
		function queryByLeixing(data, index) {
			var id = "#li_" + index;
			/* if(index  == "33"){ */
				/* $(".sidebar_right ").hide();
				$(".list_l").hide();
				$(".vip_list").show() */;
		/* 	}else{
				$(".sidebar_right ").show();
				$(".list_l").show();
				$(".vip_list").hide();
			} */
			$(".category_leixing_select")
					.removeClass("category_leixing_select");
			$(id).addClass("category_leixing_select");
			leixing = data;
			pageIndex = 1;
			loadList();
		}
		//根据时间段查询
		function queryByDate(data, index) {
			var nowdate = new Date();
			if(data == 0){
				date = '';
			} else if (data == 1) {
				//获得一周前时间
				nowdate = new Date(nowdate - 7 * 24 * 3600 * 1000);
				getDateFormat(nowdate);
			} else if (data == 2) {
				//获得一个月前时间
				nowdate.setMonth(nowdate.getMonth() - 1);
				getDateFormat(nowdate);
			} else if (data == 3) {
				//获得三个月前时间
				nowdate.setMonth(nowdate.getMonth() - 3);
				getDateFormat(nowdate);
			} else if (data == 4) {
				//获得半年前时间
				nowdate.setMonth(nowdate.getMonth() - 6)
				getDateFormat(nowdate);
			}

			var id = "#li_" + index;
			$(".category_date_select").removeClass("category_date_select");
			$(id).addClass("category_date_select");

			pageIndex = 1;
			loadList();
		}
		//根据地区查询
		function queryByRegion(data, index) {

			var id = "#li_" + index;
			$(".category_city_select").removeClass("category_city_select");
			$(id).addClass("category_city_select");

			region = data;
			pageIndex = 1;
			loadList();
		}
		//根据标题查询
		function queryByTitle() {
			
			title = document.getElementById("title").value;
			pageIndex = 1;
			loadList();
		}
		function loadList() {
			//查询条件
			var param = {
				page : pageIndex,
				rows : pageSize,
				type : leixing,
				name : title,
				ctime : date,
				province : region,
				industry : type
			};
			$.ajax({
				type : 'POST',
				url : '/biddinginfo.list.do',
				dataType : 'json',
				data : param,
				async : true,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) {
					vue.biddingInfolist = data.rows;
					totalCount = data.total;
					layui.use('laypage', function() {
						laypage = layui.laypage;
						laypage.render({
							elem : 'paging',
							count : totalCount,
							curr : pageIndex,
							theme : '#c8302e',
							limit : pageSize,
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
		//自己封装的时间格式化方法
		function getDateFormat(nowdate) {
			var y = nowdate.getFullYear();
			var m = nowdate.getMonth() + 1;
			var d = nowdate.getDate();
			String(m).length < 2 ? (m = "0" + m) : m;
			String(d).length < 2 ? (d = "0" + d) : d;
			date = y + '-' + m + '-' + d;
		}
		//根据首页的地区改变样式
		function changeClassByRegions(regions) {
			switch (regions) {
			case "北京":
				queryByRegion('北京', '1');
				break;
			case "天津":
				queryByRegion('天津', '2');
				break;
			case "河北":
				queryByRegion('河北', '3');
				break;
			case "山西":
				queryByRegion('山西', '4');
				break;
			case "内蒙古":
				queryByRegion('内蒙古', '5');
				break;
			case "上海":
				queryByRegion('上海', '6');
				break;
			case "江苏":
				queryByRegion('江苏', '7');
				break;
			case "浙江":
				queryByRegion('浙江', '8');
				break;
			case "安徽":
				queryByRegion('安徽', '9');
				break;
			case "江西":
				queryByRegion('江西', '10');
				break;
			case "山东":
				queryByRegion('山东', '11');
				break;
			case "福建":
				queryByRegion('福建', '12');
				break;
			case "广东":
				queryByRegion('广东', '13');
				break;
			case "广西":
				queryByRegion('广西', '14');
				break;
			case "海南":
				queryByRegion('海南', '15');
				break;
			case "湖南":
				queryByRegion('湖南', '16');
				break;
			case "湖北":
				queryByRegion('湖北', '17');
				break;
			case "河南":
				queryByRegion('河南', '18');
				break;
			case "辽宁":
				queryByRegion('辽宁', '19');
				break;
			case "吉林":
				queryByRegion('吉林', '20');
				break;
			case "黑龙江":
				queryByRegion('黑龙江', '21');
				break;
			case "陕西":
				queryByRegion('陕西', '22');
				break;
			case "甘肃":
				queryByRegion('甘肃', '23');
				break;
			case "青海":
				queryByRegion('青海', '24');
				break;
			case "宁夏":
				queryByRegion('宁夏', '25');
				break;
			case "新疆":
				queryByRegion('新疆', '26');
				break;
			case "重庆":
				queryByRegion('重庆', '27');
				break;
			case "四川":
				queryByRegion('四川', '28');
				break;
			case "贵州":
				queryByRegion('贵州', '29');
				break;
			case "云南":
				queryByRegion('云南', '30');
				break;
			case "西藏":
				queryByRegion('西藏', '31');
				break;
			}
		}
		//根据首页的公告类型改变样式
		function changeClassByLexing(leixings) {

			switch (leixings) {
			case "VIP精选":
				queryByLeixing('VIP精选', '33');
				break;
			case "拟建项目":
				queryByLeixing('拟建项目', '34');
				break;
			case "审批项目":
				queryByLeixing('审批项目', '35');
				break;
			case "政府项目":
				queryByLeixing('政府项目', '36');
				break;
			case "商业项目":
				queryByLeixing('商业项目', '37');
				break;
			case "业主项目":
				queryByLeixing('业主项目', '43');
				break;
			case "企业项目":
				queryByLeixing('企业项目', '44');
				break;
			}
			
		}

		function setCategory(category) {
			if (category) {
				localStorage.setItem("category", category);
			}
		}

		function setZbLeixing(leixing) {
			if (leixing) {
				localStorage.setItem("lx", leixing);
			}
		}
		
		// 倒计时
	    function getTime(S, E) {
	        // 获取开始时间
	        var start = S;
	        // 获取结束时间
	        var end = E;
	        // 计算时间差（毫秒差）
	        var num = end - start;
	        // console.log(num)
	        if (num <= 0) {
	            return { day: '00',hour: '00', minute: '00', seconds: '00' };
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
	        return { day: d,hour: h, minute: m, seconds: s };
	    };
	   
	    //VIP显示时间倒计时
	    function loadTime(index,endtime,time){
	    	var S = new Date();   
	 	    var E = new Date(endtime);//结束时间
	 	    var F = new Date(time);   //创建时间
	 	    var o = getTime(S,E);
	 	    $('.vip_list .t_t:nth-child('+index+') td:nth-child(1) i').remove();
	 	    //判断是否是24小时以内的信息
	 	    if((S - F) <= 86400000 ){
		 	    	$('.vip_list .t_t:nth-child('+index+') td:nth-child(1)').append("<i>最新</i>");
	 	    }
	 	    // 1.获取一组div元素
	 	    var divs = document.querySelectorAll('.vip_list .t_t:nth-child('+index+') td:nth-child(2) div');
	 	    // 2.把计算好的时间差的时分秒分别赋值给每一个div的内容
	 	    divs[0].innerText = o.day;
	 	    divs[1].innerText = o.hour;
	 	    divs[2].innerText = o.minute;
	 	    divs[3].innerText = o.seconds;
	 	    // 3.产生一个定时器
	 	    var tmp = setInterval(function () {
	 	        // 3.1重新计算
	 	        var S = new Date();
	 	        var E = new Date(endtime);
	 	        var o = getTime(S,E);

	 	        // 3.2重新赋值
	 	        divs[0].innerText = o.day;
	 	        divs[1].innerText = o.hour;
	 	        divs[2].innerText = o.minute;
	 	        divs[3].innerText = o.seconds;
	 	        // 3.3到达时间后，停止定时器
	 	        if (o.day == "00" && o.hour == '00' && o.minute == '00' && o.seconds == '00') {
	 	        	$('.vip_list .t_t:nth-child('+index+') td:nth-child(4)').text("已结束")
	 	            clearInterval(tmp);
	 	        }
	 	    }, 1000);
	    	
	    }
	    
	</script>
</body>
</html>
