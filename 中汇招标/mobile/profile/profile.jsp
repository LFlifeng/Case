<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>中汇招标----我的</title>
	<meta name="viewport"
		content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
	<link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${skin}mobile/css/base.css">
	<link rel="stylesheet" href="${skin}mobile/css/user.css">
</head>

<body>
	<div class="zh_layout">
		<header class="zh_topBar clearfix">
			<a href="javascript:history.back()" class="icon_back fa fa-chevron-left l"></a>
			<a href="/m.set.do" class="fa fa-gear r"></a>
		</header>
		<div class="zh_container">
			<div class="user clearfix" style="display:none;">
			<c:if test="${user.portraitUrl == null || user.portraitUrl == '' }">
			     <img src="${skin}mobile/img/pczw.png" alt="" class="l">
			</c:if>
			<c:if test="${user.portraitUrl != null || user.portraitUrl != '' }">
			     <img src="${user.portraitUrl}" alt="" class="l">
			</c:if>
				<div class="user_info l">
					<h4 id='username'></h4>
					<span>会员等级：<span></span></span>
				</div>
			</div>
			<div class="user clearfix" style="display:block;">
				<a href="/m.login.do"><img src="${skin}mobile/img/pczw.png" alt="" class="l">
				<div class="user_info l">
					<h4 style="margin-top: 20px;">未登录</h4>
				</div></a>
			</div>
			<ul class="mui-table-view">
				<li style="display:none" class="mui-table-view-cell">
					<a href="/m.member.do" class="mui-navigate-right">
						<img src="${skin}mobile/img/wxicon1.png" alt="">
						我的购买
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a href="/m.designed.do" class="mui-navigate-right">
						<img src="${skin}mobile/img/wxicon6.png" alt="">
						我的专盯
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a href="/m.collection.do" class="mui-navigate-right">
						<img src="${skin}mobile/img/wxicon2.png" alt="">
						我的收藏
					</a>
				</li>
			</ul>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell">
					<a href="/m.help.do" class="mui-navigate-right">
						<img src="${skin}mobile/img/wxicon3.png" alt="">
						帮忙与反馈
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a href="/m.service.do" class="mui-navigate-right">
						<img src="${skin}mobile/img/wxicon4.png" alt="">
						客服中心
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a href="/m.about.do" class="mui-navigate-right">
						<img src="${skin}mobile/img/wxicon5.png" alt="">
						关于我们
					</a>
				</li>
			</ul>
			<button type="button" id='logOut' class="mui-btn" style="display:none;">退出</button>
			<button type="button" id='login' class="mui-btn" style="display:none;">去登录</button>
		</div>
		<!-- 底部工具栏 -->
		<footer class="zh_tabs">
			<a href="/m.index.do" class="tab_home fa fa-home"><span>首页</span></a>
			<a href="/m.trackerList.do" class="tab_bookmark fa fa-bookmark"><span>推送</span></a>
			<a href="/m.profile.do" class="tab_user fa fa-user now"><span class="now">我的</span></a>
		</footer>
	</div>
	<script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
	<script src="${skin}mobile/res/mui/js/mui.min.js"></script>
	<script type="text/javascript">
	
		mui.init()
		//显示用户信息级别
		UserMessage();
		
		/* 判断用户是否登录 */
		function UserMessage() 
		{
			var sessionUser = '${user}';
			var grade = '${user.grade}';
			 	if (sessionUser != null && sessionUser != "")
				{
			 		$(".zh_container").find(".user:first").show();
					$(".zh_container").find(".user:first").next().hide();
					$("#logOut").show();
					$("#login").hide();
					$(".user_info #username").html('${user.showName}');
					switch (grade) 
					{
						case "0":
							$(".user_info span span").html("普通用户");
							break;
						case "1":
							$(".user_info span span").css({"background-position":'0 0px'}).html("普通会员");
							break;
						case "2":
							$(".user_info span span").css({"background-position":'0 -15px'}).html("高级会员");
							break;
						case "3":
							$(".user_info span span").css({"background-position":'0 -35px'}).html("vip高级会员 ");
							break;
						case "4":
							$(".user_info span span").css({"background-position":'0 15px'}).html("钻石会员");
							break;
					}
				}
	  }
		
		/*登录功能*/
		$("#login").on("tap",function()
	    {
			window.location.href="/m.login.do"
		})
		
		/* 退出登录功能 */
		$("#logOut").on("tap",function()
		{
			window.location.href="m.logout.do"
		})
		
	</script>
</body>

</html>