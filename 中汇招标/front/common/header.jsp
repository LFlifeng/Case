<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
		<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
		<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
		<script src="${skin}js/layui/layui.js"></script>
		<script src="${skin}front/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
		<link rel="stylesheet" type="text/css"href="${skin}front/css/header.css">
		<link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css"href="${skin}front/css/footer.css">
		<link rel="stylesheet" type="text/css"href="${skin}front/css/index.css">
</head>
<body>
	<div class="header clearfix">
	<div class="t_top">
		<div class="top_content">
			<span>欢迎来到中汇招标网站</span>
			<c:if test="${user.grade == null}">
				<span><a href="/userQd.login.do" style="margin-left: 10px">登录</a></span>
				<span><a href="/userQd.register.do" style="color:#ba3f44">请注册</a></span>
			</c:if>
			<c:if test="${user.grade != null}">
				<span><a href="javascript:;" style="margin-left: 10px;color:#ba3f44">已登录</a></span>
			</c:if>
			<!-- <div class="city top_info">[切换城市：<a href="#" class="oBtn_link">北京</a>&nbsp;] </div> -->
			<div class="top_info r">
				<span class="r10">客服电话：${systemInfo.servicePhone }</span>
				<span class="web_map r10"><a href="/service.index.do" class="">服务标准</a>
				</span>
				<span id="userHead_1"style="display:none;">
					<a href="" id="userName" style="width:127px;display:inline-block;text-align:center"></a>
					<i class="fa fa-angle-down"></i>
					<div id="userHead_2"class="info" style="display:none;">
						<div class="user_info_head clearfix">
							<img src="${user.portraitUrl}" class="l">
							<div class="user_jj l">
								<div class="user_level" id="user_lv">会员级别：<span></span></div>
								<c:if test="${user.grade != 0}">
								<div class="user_date" id="effectiveTime">有效期至:${user.ptime }</div>
								</c:if>
							</div>
						</div>
						<div class="user_info_footer">
							<a href="/userQd.center.do">个人中心</a>
							<a href="/userQd.logout.do">退出登录</a>
						</div>
					</div>
				</span>
			</div>
		</div>
	</div>
	<div class="logo">
		<div class="logo_icon fl">
			<a href="/main.index.do"><img src="${skin}front/img/logo.png" alt=""></a>
		</div>
		<div class="search fl">
			<div class="search_box">
				<div id="search">
					<div id="search_box" class="l" >
						<span class="select_txt"  id="topClassification">招标信息</span>
						<span class="select-icon"></span>
						<ul class="option">
							<li>招标信息</li>
							<li>采购信息</li>
							<li>项目中心</li>
						</ul>
					</div>
				</div>
				<input type="hidden" name="" value="招标信息" id="select_value">
				<input class="search-border" type="text" name="search_name" id="titles" placeholder="请输入招标、采购或者项目名称" />
				<input class="search_btn" type="button" value="搜索"  id="submit"onclick="findByName()" />
			</div>
			<div class="hot"><label style="color:#ccc;">热门项目：</label>
			<label class="r10"><a href="bids.listIndex.do" onclick="classification('医疗')">医疗</a></label>
			<label class="r10"><a href="bids.listIndex.do" onclick="classification('建筑')">建筑</a></label>
			<label class="r10"><a href="bids.listIndex.do" onclick="classification('绿化')">绿化</a></label>
			</div>
				</div>
			<div class="wachat fl">
					<div class="app fl">
						<img src="${systemInfo.appPictureUrl}" style="width: 80px;height: 80px;" alt="">
						<span style="width: 80px;text-align: center;" >APP下载</span>
					</div>
					<div class="weixin fl">
					<img src="${systemInfo.officialAccountPictureUrl}" style="width: 80px;height: 80px;" alt="">
					<span style="width: 80px;text-align: center;">中汇公众号</span>
				</div>
			</div>
	</div>
	<div class="cl"></div>

	</div>
	<script type="text/javascript">
		//热门项目查询
		function classification(type)
		{
			if(type){
				localStorage.setItem("type", type);
			}
		}
		$(function(){
			var userName = '${user.showName}';
			var grade='${user.grade}';
			if(userName){
				$("#userHead_1").css("display","inline-block");  
		  	    $("#userName").html(userName);
		  	  switch (grade)
	  	        {
	  	         case "0":
					$("#user_lv span").css({"background":'none'}).html("普通用户");
					break;
				case "1":
					$("#user_lv span").css({"background-position":'0 0px'})
					break;
				case "2":
					$("#user_lv span").css({"background-position":'0 -17px'})
					break;
				case "3":
					$("#user_lv span").css({"background-position":'0 -33px'})
					break;
				case "4":
					$("#user_lv span").css({"background-position":'0 -51px'})
					break;
				}
			}else{
				$("#userHead_1").css("display","none");     
				$("#userHead_2").css("display","none");     
			}
		});
		
		//顶部导航栏查询
		function findByName()
		{
			var business = document.getElementById("topClassification");
			var titles = document.getElementById("titles").value;
			if(business.innerHTML){
				if(business.innerHTML == "招标信息"){
					localStorage.setItem("title", titles);
			    	window.location.href="bids.listIndex.do"; 
				}
				if(business.innerHTML == "采购信息"){
					localStorage.setItem("title", titles);
				    localStorage.setItem("leixing", "采购公告");
				    window.location.href="bids.listIndex.do"; 
				}
				if(business.innerHTML == "项目中心"){
					localStorage.setItem("title", titles);
					window.location.href="biddinginfo.listIndex.do"; 
				}
			}
		}
		
		$(document).keyup(function(event){
			  if(event.keyCode ==13){
			    $("#submit").trigger("click");
			  }
			});
		
		(function() {
		    $("body").on('click','#search_box',function (event) {
		        event.stopPropagation();
		        $(this).find(".option").toggle();
		        $(this).parent().siblings().find(".option").hide();
		    });
		    $(document).click(function(event){
		        var eo=$(event.target);
		        if($("#select_box").is(":visible") && eo.attr("class")!="option" && !eo.parent(".option").length)
		        $('.option').hide();                                    
		    });
		    $("body").on('click','.option li',function(){
		        var check_value=$(this).text();
		        var zlValue = $('.option li:eq(0)').html();
		        var bqValue = $('.option li:eq(1)').html();
		        var bpValue = $('.option li:eq(2)').html();
		        $(this).parent().siblings(".select_txt").text(check_value);
		        $("#select_value").val(check_value);
		        if(check_value == zlValue) {
		            $('.search-border').prop('placeholder','请输入招标名称');
		        }else if(check_value == bqValue) {
		            $('.search-border').prop('placeholder','请输入采购名称');
		        }else if(check_value == bpValue){
		            $('.search-border').prop('placeholder','请输入项目名称');
		        }
		    });
		})()
	
	</script>
	
</body>

</html>

