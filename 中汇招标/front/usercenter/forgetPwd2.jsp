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
  <style type="text/css">
        .code{
			    height: 28px;
			    display: inline-block;
			    line-height: 28px;
        		cursor:pointer;
       		    width: 120px;
			    border: #ddd 1px solid;
			    background: #f1f1f1;
			    text-align: center;
			    cursor: pointer;
			    font-size: 14px;
			    color: #666;
        	}
        	.yzm{
        		    color: #7D7D7D!important;
    				border: 1px solid #CDCDCD!important;
    				font-weight: bolder;
        	}
	    	.promptMessage{
	        	    width: 100%;
				    position: absolute;
				    color: red;
				    text-indent: 7px;
				    line-height: 29px;
	        	     }
  </style>
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
  <!-- 找回密码 -->
  <div class="content">
    <div class="web-width">
      <div class="for-liucheng">
        <div class="liulist for-cur"></div>
        <div class="liulist for-cur"></div>
        <div class="liulist"></div>
        <div class="liulist"></div>
        <div class="liutextbox">
          <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
          <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
          <div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
          <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
        </div>
      </div>
      <!--for-liucheng/-->
      <form action="userQd.ValidateCode.do" method="post" class="forget-pwd" onsubmit="return valildataCode();">
        <dl>
          <dt>验证方式：</dt> 
          <dd>
            <select class="selyz" name="type" id="validateType"> 
              <option value="0">已验证手机</option>
        </select><span id="msg" class="promptMessage">${msg}</span>
          </dd>
          <div class="clears"></div>
        </dl>
        
    <!--     <dl>
          <dt>用户名：</dt>
          <dd><input type="text" /></dd>
          <div class="clears"></div>
        </dl> -->
        <dl class="sel-yzsj">
          <dt>已验证手机：</dt>
          <dd><input id="phone" type="text" readonly/><span class="promptPhoneMessage promptMessage">
          <input id="oldphone" name="phone"type="hidden" value=""/>
          </span></dd>
          <div class="clears"></div>
          <br>
          <dt>手机校验码：</dt>
          <dd><input id="phonecode" type="text" name="phoneCode"/><a onclick="getCode();"id="getCode" class="code">获取手机验证码</a></dd>
          <div class="clears"></div>
       </dl>
        <dl class="sel-yzyx">
          <dt>已验证邮箱：</dt>
          <dd><input type="text" value="${email}" readonly/><span class="promptEmailMessage promptMessage"></span></dd>
          <div class="clears"></div>
          <br>
          <dt>邮箱校验码：</dt>
          <dd><input type="text" name="emailCode"/> <a onclick="getEmailCode();"id="getEmailCode" class="code">获取邮箱验证码</a></dd>
          <div class="clears"></div>
        </dl>
        <div class="subtijiao"><input type="submit" value="下一步" /></div>
      </form>
    </div>
  </div>
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script src="${skin}front/js/search.js"></script>
  <script>
      var phone='${phone}';
      $("#oldphone").val(phone);
	  var email = '${email}';
	  var reg=/(\d{3})\d{4}(\d{4})/;
	  //格式化手机号
	  $("#phone").val(phone.replace(reg, "$1****$2"));
	  defaultSelect();
	  function defaultSelect()
	  {
		  var selval = $(".selyz").find("option:selected").val();
	      if (selval == "0") {
	        $(".sel-yzsj").show()
	        $(".sel-yzyx").hide()
	      }
	      else if (selval == "1") {
	        $(".sel-yzsj").hide()
	        $(".sel-yzyx").show()
	      }
	  }
	  
	   
     $(function () 
     {
	      //验证手机 邮箱 
	      $(".selyz").change(function () {
	        var selval = $(this).find("option:selected").val();
	        if (selval == "0") {
	          $(".sel-yzsj").show()
	          $(".sel-yzyx").hide()
	        }
	        else if (selval == "1") {
	          $(".sel-yzsj").hide()
	          $(".sel-yzyx").show()
	        }
	      })
	      if(email.length>0)
	      {
	    	  $("#validateType").append("<option value='1'>已验证邮箱</option>")
	      }
    });
     
     //验证手机验证码是否输入
     function valildataCode(){
    	  var code=$("#phonecode").val();
    	  var emailcode=$("##emailCode").val();
    	 if((code.length != 5 || code == "") && (emailcode.length != 5 || emailcode == ""))
          {
       	    $(".promptMessage").html("请输入正确的验证码")
 				return false;
     	    } 
    	     return true;
         }
     var count = 0;
     var isWait = false;
     var t1;
     //获取验证码
     function getCode()
     {
    	 $("#msg").html("");
     	 if(isWait)
     	 {
     	 	return;
     	 }
     	 isWait = true;
     	 if(phone != '' && phone.length == 11)
     	 {
     	 	  $.post("userQd.getCode.do",{phone:phone},function(res)
             {
                   $(".promptPhoneMessage").html(res);
                   
             }) 
             //倒计时60秒
             count = 60;
         	t1=window.setInterval(showCode, 1000);
            $("#getEmailCode").addClass("yzm"); 
     	 }
     	 else
     	{
     		 isWait = false;
     	}
     }
     //显示验证码失效时间
     function showCode()
     {
     	count = count - 1;
     	if(count==0)
     	{
     		 $("#getCode").removeClass("yzm");
     		  isWait = false;
			  clearInterval(t1);
     		$("#getCode").html("获取验证码");
     	}
     	else
     	{
     		var text = count+"秒后重试";
     		$("#getCode").html(text);
     	}
     } 
     var counts = 0;
     var isWaits = false;
     var t2;
     
   //获取邮箱验证码
     function getEmailCode()
     {
	   $("#msg").html("");
     	 if(isWait)
     	 {
     	 	return;
     	 }
     	 isWait = true;
     	 if(phone != '' && phone.length == 11)
     	 {
     	 	   $.post("userQd.getEmailCode.do",{email:email},function(res)
             {
                   $(".promptEmailMessage").html(res);
                   
             }) 
             //倒计时60秒
             counts = 60;
         	t2=window.setInterval(showEmailCode, 1000);
            $("#getEmailCode").addClass("yzm"); 
     	 }
     	 else
     	{
     		 isWait = false;
     	}
     }
     //显示验证码失效时间
     function showEmailCode()
     {	
     	counts = counts - 1;
     	if(counts==0)
     	{
     		 $("#getEmailCode").removeClass("yzm");
     		  isWait = false;
			  clearInterval(t2);
     		$("#getEmailCode").html("获取验证码");
     	}
     	else
     	{
     		var text = counts+"秒后重试";
     		$("#getEmailCode").html(text);
     	}
     } 
     

  </script>
</body>

</html>