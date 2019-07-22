<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>${detail.name}_招标信息采购项目拟在建项目公开招标成交公告_中汇招标网</title>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="${skin}js/layui/layui.js"></script>
<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
<link rel="shortcut icon" href="${skin}front/img/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/detail.css">
<link rel="stylesheet" type="text/css"
	href="${skin}js/layui/css/layui.css" media="all">
<style type="text/css">
[v-cloak] {
	display: none;
}

.arc_info a:nth-child(2)::after {
	background: url(${skin}front/img/icon_defail_sc.png) no-repeat center;
}

#lia {
	white-space: nowrap;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	overflow: hidden;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<!-- 头部导航 -->
	<div class="head_nav ">
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
							@click='leixing(item.columnName)'>{{item.columnName}}</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="position_nav">
		当前位置：<a href="/main.index.do">首页</a>><a href="/bids.listIndex.do"></a>><a
			href="#">${detail.name}</a>
	</div>

	<div class="arc_content" id="bidsdetails">

		<div class="arc fl">
			<div class="arc_title">${detail.name}</div>
			<div class="arc_info">
				<span>发布时间：${detail.time}</span><a href="#"
					onclick="collection('${detail.id}','${detail.name}')">收藏</a>
			</div>
			<div class="t_table">
				<table>
					<tr>
						<td style="width: 20%;">发布时间:</td>
						<td>${detail.time}</td>
						<td>公告类型:</td>
						<td>${detail.type}</td>
					</tr>
					<tr id="notice_id">
						<td>招标地区:</td>
						<td>${detail.province}</td>
						<td>联系方式:</td>
						<td class="blue" v-if="grade === '0'"><a onclick="tips()">会员可见</a></td>
						<td class="blue" v-else-if="grade === ''"><a onclick="tips()">会员可见</a></td>
						<td class="blue" v-else><a href="#"></a></td>
					</tr>
				</table>
			</div>
			<div class="arc_arc">
				<c:if test="${jw == '.swf'}">
				    <object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" id="obj1" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0">
									<param name="movie" value="${detail.contentHtml}">
									<embed src="${detail.contentHtml}" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="obj1" width="526" height="800" style="margin-left:150px">
				    </object>
				</c:if>
				<c:if test="${jw != '.swf'}">
				       ${detail.contentHtml}
				</c:if>
				<div class="arc_vip">
					<img src="${skin}front/img/arc_vip.jpg" />
				</div>
			</div>
		</div>
		<div class="sidebar_right fl fl10">
			<div class="new_did" id="exclusiveBids" v-cloak>
				<div class="new_did_title">
					独家招标信息 <a class="new_did_title_more" href="bids.listIndex.do">更多</a>
				</div>
				<ul class="new_did_l">
					<li id="lia" v-for="bids in exclusiveBidsList" :key="bids.id"><a
						:href="'bids.details.do?id=' +bids.id">{{bids.name}}</a></li>
				</ul>
			</div>
		</div>
		<div class="cl"></div>
	</div>

	<!-- 提示层 -->
	<div class="tishi" style="display: none;">
		<div style="text-align: center; margin-top: 36px">
			<img src="${skin}front/img/tishi.png">
		</div>
		<div
			style="color: #505050; font-size: 20px; font-weight: 700; width: 460px; text-align: center; margin-top: 20px;">提示
		</div>
		<p
			style="text-align: center; margin-top: 20px; color: #969696; font-size: 16px;">
			查看功能详情<span
				style="color: #969696; font-size: 16px; margin-left: 20px;">请咨询<i
				style="color: #ff2c36; font-size: 18px; font-weight: 700; margin-bottom: 36px;">400-486-1234</i></span>
		</p>
	</div>
	<!-- 公共底部 -->
	<%@ include file="../common/footer.jsp"%>
	<script >
		//使用Vue渲染模板，初始化时是没有数据的，需要ajax请求拿到数据
		var exclusiveBids = new Vue({
			el : "#exclusiveBids",
			data : {
				exclusiveBidsList : null
			}
		});

		var userGrade = new Vue({
			el : "#notice_id",
			data : {
				grade : '${user.grade}'
			}

		});
		//查询独家招标
		function findExclusiveBids() {
			$.ajax({
				type : 'POST',
				url : '/bids.exclusiveBids.do',
				dataType : 'json',

				success : function(data) {
					exclusiveBids.exclusiveBidsList = data;
				}

			});
		}

		$(function() {
			findExclusiveBids();

		});
		//收藏
		function collection(id, title) {
			var param = {
				biddingInfoId : id,
				binddingInfoTitle : title
			};
			$.ajax({
				type : 'POST',
				url : '/userCollection.add.do',
				data : param,
				success : function(data) {
					layer.msg(data, {
						icon : 1,
						time : 1000, //1s后自动关闭
						shade : [ 0.8, '#393D49' ]
					// 透明度  颜色
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
			el : "#columnData",
			data : {
				columnCategorys : []
			},
			methods : {
				leixing : function(leixing) {
					if (leixing) {
						localStorage.setItem("lx", leixing);
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

		function tips() {
			layui.use('layer', function() { //独立版的layer无需执行这一句
				var $ = layui.jquery, layer = layui.layer;
				layer.open({
					type : 1,
					title : false,
					closeBtn : false,
					area : '[460px,260px]',
					id : 'LAY_layuipro',
					btn : [ '知道了' ],
					btnAlign : 'c',
					content : $('.tishi'),
					resize : false,//禁止拉伸
					end : function() {
						$(".tishi").hide();
					},
				})
			});
		}
		$(function(){
			/*详情页类型*/
			$(".position_nav a:nth-child(2)").text(localStorage.getItem("zhaobiaotype"));
		})
	</script>
</body>
</html>
