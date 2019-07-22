<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>找回密码</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/header.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/index.css">
    <link type="text/css" href="${skin}front/css/foundpwd.css" rel="stylesheet" />
</head>

<body>
  <%@ include file="../common/header.jsp"%>
	<!-- 头部导航 begin-->
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
    <!-- 招标主要分类 -->
    <div class="main">
		<div class="main_content clearfix">
			<div class="main_box fl">
				<h3>招标</h3>
				<div class="main_list">
					<ul>
						<li><a href="bids.listIndex.do" onclick="leixing('招标公告')">招标公告</a></li>
						<li><a href="bids.listIndex.do" onclick="leixing('预审公告')">预审公告</a></li>
						<li><a href="bids.listIndex.do" onclick="leixing('变更公告')">变更公告</a></li>
						<li><a href="bids.listIndex.do" onclick="leixing('中标公告')">中标公告</a></li>
						<li><a href="bids.listIndex.do" onclick="leixing('政府招标')">政府招标</a></li>
						<li><a href="bids.listIndex.do" onclick="leixing('名企招标')">名企招标</a></li>
					</ul>
				</div>
			</div>
			<div class="main_box fl">
				<h3>采购</h3>
				<div class="main_list">
					<ul>
						<li><a href="bids.listIndex.do" onclick="leixing('中标采购')">中标采购</a></li>
						<li><a href="bids.listIndex.do" onclick="leixing('政府采购')">政府采购</a></li>
						<li><a href="bids.listIndex.do" onclick="leixing('名企采购')">名企采购</a></li>
						<li><a href="bids.listIndex.do" onclick="leixing('业主采购')">业主采购</a></li>
						<li><a href="bids.listIndex.do" onclick="leixing('在线询价')">在线询价</a></li>
						<li><a href="bids.listIndex.do" onclick="leixing('海外采购')">海外采购</a></li>
					</ul>
				</div>
			</div>
			<div class="main_box fl">
				<h3>项目</h3>
				<div class="main_list">
					<ul>
						<li><a href="biddinginfo.listIndex.do"
							onclick="leixing('VIP精选')">VIP精选</a></li>
						<li><a href="biddinginfo.listIndex.do"
							onclick="leixing('拟建项目')">拟建项目</a></li>
						<li><a href="biddinginfo.listIndex.do"
							onclick="leixing('审批项目')">审批项目</a></li>
						<li><a href="biddinginfo.listIndex.do"
							onclick="leixing('政府项目')">政府项目</a></li>
						<li><a href="biddinginfo.listIndex.do"
							onclick="leixing('商业项目')">商业项目</a></li>
						<li><a href="biddinginfo.listIndex.do"
							onclick="leixing('业主项目')">业主项目</a></li>
					</ul>
				</div>
			</div>
			<div class="main_box fl">
				<h3>资讯</h3>
				<div class="main_list">
					<ul>
						<li><a href="news.listIndex.do" onclick="setCategory('行业资讯')">行业资讯</a></li>
						<li><a href="news.listIndex.do" onclick="setCategory('新规解读')">新规解读</a></li>
						<li><a href="news.listIndex.do" onclick="setCategory('近期展会')">近期展会</a></li>
						<li><a href="news.listIndex.do" onclick="setCategory('曝光台')">曝光台</a></li>
					</ul>
				</div>
			</div>
			<div class="main_box fl">
				<h3>服务</h3>
				<div class="main_list" style="border: none;">
					<ul>
						<li><a href="#">信息定制</a></li>
						<li><a href="#">代理招标</a></li>
						<li><a href="#">服务介绍</a></li>
						<li><a href="#">标书代写</a></li>
						<li><a href="#">实地考察</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
    <div class="content">
        <div class="web-width">
            <div class="for-liucheng">
                <div class="liulist for-cur"></div>
                <div class="liulist"></div>
                <div class="liulist"></div>
                <div class="liulist"></div>
                <div class="liutextbox">
                    <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
                    <div class="liutext"><em>2</em><br /><strong>验证身份</strong></div>
                    <div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
                    <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
                </div>
            </div>
            <form class="forget-pwd" action="/userQd.forgetpwd.do" method="POST" onsubmit="return validateForm();">
                <dl>
                    <dt>账户名：</dt>
                    <dd><input id='phone'name="phone"type="text" value="${phone }"/> <span id="msg" style="position: absolute;
                    line-height: 31px;width: 100%;text-indent: 20px;color: red;">${msg}</span></dd>
                    <div class="clears"></div>
                </dl>
                <dl>
                    <dt>验证码：</dt>
                    <dd>
                        <input id='yzm'name='yzm'  id='VerificationCode'type="text" /> 
                        <div class="yanzma">
                            <img src="/userQd.code.do" /> <a href="javascript:;">换一换</a>
                        </div>
                    </dd>
                    <div class="clears"></div>
                </dl>
                <div class="subtijiao"><input  type="submit" value="下一步" /></div>
            </form>
        </div>
    </div>
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script src="${skin}front/js/search.js"></script>
    <script>
    function validateForm()
    {
    	 var code=$("#yzm").val();
      	 var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
          if (!myreg.test($("#phone").val().trim())) 
          {
          	  $("#msg").html("请输入正确的手机号")
          	  return false;
          }
          if(code.length != 5 || code == "")
          {
        	  $("#msg").html("请输入正确的验证码")
  				return false;
      	    }
        
	        return true;
    }
      //验证码换一换
    $(".yanzma a").click(function()
    {
    	$(".yanzma img").attr("src","/userQd.code.do?time="+ new Date().getTime()); 
    })
    </script>
</body>

</html>