<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>中汇招标注册页面</title>
<link rel="shortcut icon" href="${skin}front/img/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/registe.css">
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
</head>
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
<script>
	  $(function(){
			  /* 去除input记忆 */
			  $("input").attr({"autocomplete":"off"});
			  /* 监听输入框事件 */
			  $("body").bind("input onpropertychange",function()
				{
					$("#notice_id").html("")
				})
			/* 监听回车 */
			 $(document).keyup(function(event){
				  if(event.keyCode ==13){
				    $(".submit").trigger("click");
				  }
				});
	  })
	  
	 
		function registe()
		{ 
          	var contacts=$("#contacts").val(); //联系人
          	var pwd=$("#pwd").val();           //密码
          	var phone=$("#phone").val();       //手机号
          	var i_code=$("#i_code").val();     //验证码
          	var clause=$('#clause').prop('checked') //是否同意协议
          	var url="userQd.doregister.do";    //注册接口
          	//判断是否有没填入的元素
          	var emptysize=0;
          	//遍历选中的checkbox给角色赋值
          	var param={
          	           contacts:contacts,
          	           phone:phone,
          	           code:i_code,
          	           password:pwd
          	          }
          	
          	if (contacts.trim().length < 1 ||  contacts.trim().length > 10) 
            {
          		 if(null == contacts.trim() || "" == contacts.trim()) 
                 {
    			    $("#notice_id").html("请您输入联系人")
    			    return;
                 }
            	   $("#notice_id").html("联系人不能超过10位，请您重新输入")
            	   return;
               
            }
           
           if (pwd.trim().length < 6 ||  pwd.trim().length > 12) 
           {
        	   if (null == pwd.trim() || "" == pwd.trim()) 
               {
   			    $("#notice_id").html("请您输入密码")
   			    return;
              }else{
            	$("#notice_id").html("请您输入6-12位的密码")
  			    return; 
              } 
           }
           
           if(!/^1[3|4|5|7|8][0-9]\d{8,11}$/.test(phone)){
        	   if (null == phone || "" == phone) 
               {
   			    $("#notice_id").html("请您输入手机号")
   			    return;
              }
        	   else{
             	  $("#notice_id").html("请您正确的手机号")
             	  return;
               } 
           }
           if (i_code.trim().length != 5) 
           {
        	   if (null == i_code || "" == i_code) 
               {
   			    $("#notice_id").html("请您输入验证码")
   			    return;
              }else{
            	$("#notice_id").html("验证码有误，请您重新输入")
            	  return;
              }
           }
           
           if (null == clause || "" == clause) 
            {
            	$("#notice_id").html("请同意协议")
            	return;	
           }
           if(emptysize==0){
   				$.ajax( {
				url : '/userQd.doregister.do',
				type : 'POST',
				data : param,
				error : function() 
				{
					alert("系统出错")
				},
				success : function(res)
				{
                   if (res == "succ") 
                   {
                       window.location.href="userQd.login.do?phone="+phone;

                   }else{
                   	$("#notice_id").html(res)
                   }
				}});
           }
        }
         var count = 0;
        var isWait = false;
        var t1;
        //获取验证码
        function getCode()
        {
        	
        	
        	
        	 if(isWait)
        	 {
        	 	return;
        	 }
        	 isWait = true;
        	 var phone=$("#phone").val().trim();
        	 
        	 if(phone != '' && phone.length == 11)
        	 {
        	 	 $.post("userQd.getCode.do",{phone:phone},function(res)
                {
                      $("#notice_id").html(res);
                })
                //倒计时60秒
                count = 60;
            	t1=window.setInterval(showCode, 1000);
               $("#getCode").addClass("yzm");
        	 }
        	 else
        	{
        		 
        		 isWait = false;
        		 $("#notice_id").html("请输入正确的手机号")
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
        
        function intoLogo()
        {
        	window.location.href="/main.index.do";
        }
        function agreement()
        {
        	 layui.use('layer', function () 
         	    	  {
         	               var layer = layui.layer;
         	               layer.open({
         	                 title: ['《中汇招标网用户服务条款》'],
         	                 type: 2,
         	                 content: "/userQd.agreement.do",
         	                 offset: 'auto',
         	                 area: ['650px', '600px'],
         	                 shadeClose: true, //开启遮罩关闭
         	                 end: function () 
         	                 {
         	                	      var flag=localStorage.getItem("agreeDeal");
	         	                	  localStorage.removeItem("agreeDeal");
	         	                	   if(flag)
	         	                	   {
	         	                		  $("#clause").prop("checked",true);
	         	                	   }
         	                 },
         	               });
         	           });
        }
	</script>
<body>
	<div class="registe_top">
		<div class="registe_logo">
			<img onclick="intoLogo();" src="${skin}front/img/logo.png">
		</div>
	</div>
	<div class="registe_content clearfix">
		<div class="w">
		<div class="registe_center r">
			<div class="registe_registe">
				<h2>注册</h2>
				<form action="#" method="post">
					<div class="contacts">
						<span>姓名</span> <input id='contacts' type="text"
							placeholder="请输入姓名">
					</div>
					<div class="pwd">
						<span>密码</span> <input type="password" name="" id="pwd"
							placeholder="请输入密码">
					</div>
					<div class="phone">
						<span>手机号</span> <input type="text" name="" id="phone"
							placeholder="请输入手机号"> <span id='getCode'
							onclick='getCode();'>获取验证码</span>
					</div>
					<div class="i_code">
						<span>验证码</span> <input type="text" id='i_code'>
					</div>
					<div class="clause">
						<input type="checkbox" 'name="" id="clause">我已阅读并接受 <a
							href="#" onclick="agreement();">《中汇招标网用户服务条款》</a> <span
							id='notice_id'
							style="color: red; width: 100%; text-align: center;"></span>
					</div>
					<div class="registe submit" onclick="registe();">注册</div>
					<div id="reg" class='reg'>
						<a href="/userQd.login.do"><i>已有账号?</i>立即登录</a>
					</div>
			</div>
		</div>
		<div class="content r">
			<div class="title clearfix">
				<h1 class="l">及时</h1>
				<h1 class="l">高效</h1>
				<h1 class="l">服务</h1>
			</div>
			<div class="text clearfix">
				<p class="l">
					<span><i>◆</i>海量信息数据库</span> <span><i>◆</i>订阅后及时推送信息</span> <span><i>◆</i>微信公众号、pc、邮件三端展示</span>
					<span><i>◆</i>免费发布招标信息</span>
				</p>
				<p class="l">
					<span><i>◆</i>近千家供应商、采购商库</span> <span><i>◆</i>随时随地&nbsp;私人定制查询</span>
					<span><i>◆</i>一对一资深客服对接</span> <span><i>◆</i>智能检测企业招标动态</span>
				</p>
			</div>
		</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
