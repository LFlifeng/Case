<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>招标公告_提供2019年最新招标信息_中汇招标网</title>
<meta name="keywords" content="招标,招标公告,招标预告,免费发布,最新招标,2019最新招标信息">
<meta name="description"
	content="中汇招标网招标信息栏目,提供全国精准海量招标公告,招标预告全面覆盖建筑工程、水利工程、道路施工、医药等各个行业领域,信息准确及时,有效提高企业中标几率。">
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="${skin}js/layui/layui.js"></script>
<link rel="shortcut icon" href="${skin}front/img/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="${skin}js/layui/css/layui.css" media="all">
<style>
.selectA {
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
	line-height: 34px;
	color: #505050;
	border-bottom: 1px dashed #e6e6e6;
}

.t_t:last-child {
	border: none;
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
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="head_nav">
		<div class="nav">
			<ul>
				<li><a href="main.index.do">首页</a></li>
				<li><a href="bids.listIndex.do" id="zb_01">招标信息</a></li>
				<li><a href="bids.listIndex.do" id="zb_02"
					onclick="toPurchaseIndex()">采购信息</a></li>
				<li><a href="biddinginfo.listIndex.do">项目中心</a></li>
				<li><a href="application.listIndex.do">供应商</a></li>
				<li><a href="news.listIndex.do">行业资讯</a></li>
				<li><a href="serviceHall.listIndex.do">服务大厅</a></li>
			</ul>

		</div>
	</div>
	</div>
	<div class="main">
		<div class="main_content clearfix" id="columnData" v-cloak>
			<div class="main_box fl" v-for="columns in columnCategorys">
				<h3>{{columns.columnName}}</h3>
				<div class="main_list">
					<ul>
						<li v-for="item in columns.list"><a :href='item.url'
							@click='leixing(item.columnName)'>{{item.columnName}}</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="position_nav">
		当前位置：<a href="/main.index.do">首页</a>><a id="topTitle"
			href="/bids.listIndex.do">招标信息</a>
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
				<li id="li_33"><a onclick="queryByLeixing('招标公告','33')">招标公告</a></li>
				<li id="li_34"><a onclick="queryByLeixing('预审公告','34')">预审公告</a></li>
				<li id="li_35"><a onclick="queryByLeixing('变更公告','35')">变更公告</a></li>
				<li id="li_36"><a onclick="queryByLeixing('中标公告','36')">中标公告</a></li>
				<li id="li_44"><a onclick="queryByLeixing('政府招标','44')">政府招标</a></li>
				<li id="li_45"><a onclick="queryByLeixing('企业招标','45')">企业招标</a></li>
				<li id="li_37"><a onclick="queryByLeixing('采购公告','37')">采购公告</a></li>
				<li id="li_46"><a onclick="queryByLeixing('中标采购','46')">中标采购</a></li>
				<li id="li_47"><a onclick="queryByLeixing('企业采购','47')">企业采购</a></li>
				<li id="li_48"><a onclick="queryByLeixing('合同采购','48')">合同采购</a></li>
				<li id="li_49"><a onclick="queryByLeixing('政府采购','49')">政府采购</a></li>
				<li id="li_38"><a onclick="queryByLeixing('废标/流标公告','38')">废标/流标公告</a></li>
				<li id="li_39"><a onclick="queryByLeixing('结果公告','39')">结果公告</a></li>
				<li id="li_40"><a onclick="queryByLeixing('合同公告','40')">合同公告</a></li>
				<li id="li_41"><a onclick="queryByLeixing('延期公告','41')">延期公告</a></li>
				<li id="li_42"><a onclick="queryByLeixing('终止公告','42')">终止公告</a></li>
				<li id="li_43"><a onclick="queryByLeixing('其他公告','43')">其他公告</a></li>

			</ul>
			<div class="pr">时间范围：</div>
			<ul class="category">

				<li id="li_63" class="category_date_select"><a
					onclick="queryByDate(1,'63')">一周</a></li>
				<li id="li_60"><a href="javascript:void(0)"
					onclick="queryByDate(2,'60')">一个月</a></li>
				<li id="li_61"><a href="javascript:void(0)"
					onclick="queryByDate(3,'61')">三个月</a></li>
				<li id="li_62"><a href="javascript:void(0)"
					onclick="queryByDate(4,'62')">半年</a></li>
			</ul>
			<div class="pr">标题搜索：</div>
			<div>
				<input type="text" class="title_search" placeholder="输入关键词"
					id="title" /> <input type="button" value="搜索" class="list_btn"
					onclick="queryByTitle()" />
			</div>
			</ul>
			<div class="cl"></div>
		</div>
		<div class="list_list_content">
			<div class="list_l fl" id="bidslist" v-cloak>
				<table>
					<tbody>
						<tr class="t_top">
							<th style="width: 15%;">项目类别</th>
							<th style="width: 57%;">项目名称</th>
							<th style="width: 13%;">所在地区</th>
							<th style="width: 15%;">发布时期</th>
						</tr>
						<tr class="t_t" v-for="bids in bidslist" :key="bids.id">
							<td>{{bids.type}}</td>
							<td align="left" id="tdd"><a
								:href="'bids.details.do?id=' +bids.id" target="blank">{{bids.name}}</a>
							</td>
							<td>{{bids.province}}</td>
							<td>{{bids.time}}</td>
						</tr>

					</tbody>
				</table>

			</div>

			<div class="sidebar_right fl10 fl">
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
			</div>
			<div class="cl"></div>
			<!-- 分页容器 -->
			<div id="paging"></div>
		</div>
	</div>
	<div class="cl"></div>
	<%@ include file="../common/footer.jsp"%>
	<script>
		//定义全局变量
		var pageIndex = 1;
		var pageSize = 20;
		var totalCount = 0;
		var type = '';
		var date = '';
		var province = '';
		var title = '';
		var industry = '';
        var indexdate='';
		//使用Vue渲染模板，初始化时是没有数据的，需要ajax请求拿到数据
		var vue = new Vue({
			el : "#bidslist",
			data : {
				bidslist : null
			}

		});

		var columnData = new Vue({
			el : "#columnData",
			data : {
				columnCategorys : []
			},
			methods : {
				leixing : function(leixing) {
					if (leixing) {
						localStorage.setItem("lx", leixing);
						if (leixing == "采购公告") {
							toPurchaseIndex();
						}
					}
				}

			},
			created : function() {
				var self = this;
				var res = localStorage.getItem("columnCategorysKey");
				if (res) {
					self.columnCategorys = JSON.parse(res);
				} else {
					$.ajax({
						url : '/columnCategory.listAll.do',
						type : 'post'
					}).then(function(res) {
						self.columnCategorys = JSON.parse(res);
						localStorage.setItem("columnCategorysKey", res)

					}).fail(function() {
					});
				}
			},
		});
		//加载完成
		$(function() {
			if (!$(".li_32").hasClass("category_leixing_select")) {
				localStorage.setItem("zhaobiaotype", "招标信息")
			}
			var leixings = localStorage.getItem("leixing");
			if (leixings) {
				type = leixings;
				localStorage.removeItem('leixing');

				changeClassByLexing(leixings);

				$("#zb_02").addClass("selectA");
			} else {
				$("#zb_01").addClass("selectA");
			}
			var types = localStorage.getItem("type");
			if (types) {
				industry = types;
				localStorage.removeItem('type');
				/* 				$("#title").val(types);
				 $("#titles").val(types); */
			}
			var titles = localStorage.getItem("title");
			if (titles) {
				title = titles;
				localStorage.removeItem('title');
				$('#title').val(titles);
			}
			var regions = localStorage.getItem("region");
			if (regions) {
				province = regions;
				localStorage.removeItem('region');
				changeClassByRegions(regions);
			}
			var lx = localStorage.getItem("lx");
			if (lx) {
				type = lx;
				localStorage.removeItem('lx');
				changeClassByLexing(lx);
			}

			/*判断时候是通过首页招标时间进入*/
			if (localStorage.getItem("dateList") == null) {
				loadList();//第二个参数不能用变量pageSize，因为当切换每页大小的时候会出问题
			} else {
				indexdate = localStorage.getItem("dateList");
				localStorage.removeItem("dateList");
				loadDatelist(indexdate);
			}
		});
		//根据类型查询
		function queryByLeixing(data, index) {
			var id = "#li_" + index;
			$(".category_leixing_select")
					.removeClass("category_leixing_select");
			$(id).addClass("category_leixing_select");
			type = data;
			pageIndex = 1;
			/* 判断选择是是否是采购信息详情页面进行更改	*/
			$(".nav li a").removeClass("selectA");
			if (index == "37") {
				$("#zb_02").addClass("selectA");
				$("#topTitle").html("采购信息");
				localStorage.setItem("zhaobiaotype", "采购信息")
				$("head title").text("采购信息平台_全国各地企业采购公告信息_中汇招标网");
			} else {
				$("#topTitle").html("招标信息");
				$("#zb_01").addClass("selectA");
				$("head title").text("招标公告_提供2019年最新招标信息_中汇招标网");
				localStorage.setItem("zhaobiaotype", "招标信息")
			}

			selectload();
		}
		//根据时间段查询
		function queryByDate(data, index) {
			var nowdate = new Date()
			if (data == 1) {
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
			selectload();
		}
		//根据地区查询
		function queryByRegion(data, index) {
			var id = "#li_" + index;
			$(".category_city_select").removeClass("category_city_select");
			$(id).addClass("category_city_select");
			province = data;
			pageIndex = 1;
			selectload();
		}
		//根据标题查询
		function queryByTitle() {
			title = document.getElementById("title").value;
			pageIndex = 1;
			selectload();
		}
		function loadList() {
			title = $('#title').val();

			//查询条件
			var param = {
				page : pageIndex,
				rows : pageSize,
				type : type,
				title : title,
				date : date,
				province : province,
				industry : industry
			};
			$.ajax({
				type : 'POST',
				url : '/bids.list.do',
				dataType : 'json',
				data : param,
				async : true,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) {
					vue.bidslist = data.rows;
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
			case "招标公告":
				queryByLeixing('招标公告', '33');
				break;
			case "预审公告":
				queryByLeixing('预审公告', '34');
				break;
			case "变更公告":
				queryByLeixing('变更公告', '35');
				break;
			case "中标公告":
				queryByLeixing('中标公告', '36');
				break;
			case "企业招标":
				queryByLeixing('企业招标', '45');
				break;
			case "政府招标":
				queryByLeixing('政府招标', '44');
				break;
			case "采购公告":
				queryByLeixing('采购公告', '37');
				document.getElementById('topTitle').innerHTML = "采购信息";
				break;
			case "其他公告":
				queryByLeixing('其他公告', '43');
				break;
			case "中标采购":
				queryByLeixing('中标采购', '46');
				/* document.getElementById('topTitle').innerHTML = "采购信息"; */
				break;
			case "政府采购":
				queryByLeixing('政府采购', '49');
				/* document.getElementById('topTitle').innerHTML = "采购信息"; */
				break;
			case "企业采购":
				queryByLeixing('企业采购', '47');
				/* document.getElementById('topTitle').innerHTML = "采购信息"; */
				break;
			case "合同采购":
				queryByLeixing('合同采购', '48');
				/* document.getElementById('topTitle').innerHTML = "采购信息"; */
				break;

			}

		}
		//把项目类型放在缓存
		function findByleixing(type) {
			if (type) {
				localStorage.setItem("lx", s);
			}
		}
		//把新闻分类放在页面缓存
		function setCategory(category) {
			if (category) {
				localStorage.setItem("category", category);
			}
		}
		//通过首页招标日期进入的时候调用该方法渲染页面查询某一天的数据
		function loadDatelist(date) {
			/*目前为某一天的招标所以清除时间范围的选中状态*/
			$(".category li").removeClass("category_date_select");
			/*获取主页存入的招标日期*/
			$.post("bids.daylist.do", {
			    type:type, 
				date:date,
				title:title, 
				province:province,
				page : pageIndex,
				row : pageSize,
			}, function(res) {
				res = JSON.parse(res);
				vue.bidslist = res.rows;
				totalCount = res.total;
				layui.use('laypage', function() {
					laypage = layui.laypage;
					laypage.render({
						elem : 'paging',
						count : totalCount,
						curr : pageIndex,
						theme : '#c8302e',
						limit : pageSize,
						layout : [ 'count', 'prev', 'page', 'next', 'limit',
								'refresh', 'skip' ],
						jump : function(obj, first) {
							//点击非第一页页码时的处理逻辑。比如这里调用了ajax方法，异步获取分页数据
							if (!first) {
								pageIndex = obj.curr;
								pageSize = obj.limit;
								loadDatelist(date);
							}
						}
					});
				});
			})
		}
		//根据时间范围是否被选中如果选中则调用根据时间段查询
		function selectload(){
			if($(".category li").hasClass("category_date_select")){
				 loadList();
			}else{
				loadDatelist(indexdate)
			}
		}
	</script>
</body>
</html>
