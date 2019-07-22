<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>中汇招标----推送</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
<link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet"
	href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${skin}mobile/css/base.css">
<link rel="stylesheet" href="${skin}mobile/css/subscribe.css">
</head>

<body>
	<div class="zh_layout">
		<header class="zh_topBar">
		   <a href="m.trackerList.do" class="l"><img src="${skin}mobile/img/back.png" alt=""></a>
			<div>我的推送</div>
		</header>
		<div class="zh_container">
		<input id="trackerId"  type="hidden"  value="${trackerId}">
			<!-- 未订阅 -->

			<div class="mui-scroll-wrapper" id="isGrade" >
				<div class="mui-scroll" id="bidsList"   v-cloak>
					<ul class="mui-table-view">
						<li class="mui-table-view-cell mui-media"
							v-for="userSubscribe in bidsList" :key="userSubscribe.id"><a
							:href="'bidsMobile.details.do?id=' +userSubscribe.id">
								<div class="mui-media-body">
									{{userSubscribe.name}}
									<div class="item_flex">
										<%-- 										<div class="flex">
											<i><img src="${skin}mobile/img/icon6.png"></i>北京
										</div>
										<div class="flex">
											<i><img src="${skin}mobile/img/icon7.png"></i>招标信息
										</div> --%>
										<%-- 	<div class="flex">
											<i><img src="${skin}mobile/img/icon8.png"></i>
											{{userSubscribe.ctime}} --%>
									
									</div>
						
								</div>
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
		<a href="/m.trackerList.do" class="tab_bookmark fa fa-bookmark  now"><span
			class="now">推送</span></a> <a href="/m.profile.do"
			class="tab_user fa fa-user"><span>我的</span></a>
	</footer>
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
	/* 			down : {
					style : 'circle',
					color : '#2bd009',
					contentover : '释放立即刷新',
					contentrefresh : '正在刷新...',
					callback : function() {
						pageIndex = 1;
						subscribe.bidsList = [];
						findSubscribe();
						
					}
				}, */
				// 上拉加载
				up : {
					contentrefresh : '正在加载...',
					callback : function() {
						if ((pageIndex + 1) > pageTotal) {
							mui('#isGrade').pullRefresh().endPullupToRefresh();
							return;
						}
						pageIndex = pageIndex + 1;
						findSubscribe();

					}
				}
			}
		});

		mui.init()
		var pageIndex = 1;
		var pageSize = 20;
		var pageTotal = 0;
		var trackerId;
		$(function() {
			trackerId = $("#trackerId").val();
			findSubscribe();
		});

		var subscribe = new Vue({
			el : "#bidsList",
			data : {
				bidsList : []
			}
		});

		//加载数据
		function findSubscribe() {
			var param = {
				page : pageIndex,
				rows : pageSize,
				trackerId : trackerId
			}
			$.ajax({
				type : 'POST',
				url : '/biddingMobile.subscribeList.do',
				dataType : 'json',
				data : param,
				async : true,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
				success : function(data) {
					for (var i = 0; i < data.rows.length; i++) {
						subscribe.bidsList.push(data.rows[i]);
					}
					
					pageTotal = (data.total - 1) / pageSize + 1;
					if (pageIndex == 1) {
						mui('#isGrade').pullRefresh().endPulldownToRefresh();
					} else {
						mui('#mui-scroll-wrapper').pullRefresh()
								.endPullupToRefresh();
					}
				}
			});
		}
	</script>
</body>

</html>