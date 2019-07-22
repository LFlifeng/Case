<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title id="title">中汇招标----登录</title>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
    <link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}mobile/css/base.css">
    <link rel="stylesheet" href="${skin}mobile/css/login.css">
     <style>
        input{
         font-size:12px;
        }
     </style>
</head>
<body>
    <div class="zh_layout">
        <header class="zh_topBar clearfix">
            <a href="/m.profile.do" class="icon_back fa fa-times l"></a>
            <span>中汇招标网</span>
        </header>
        <div class="zh_container">
            <div class="login">
                <h3 id="title_one">用户登录</h3>
                <div class="phone">
                    <span>手机号</span>
                    <input id="phone" type="tel" placeholder="请输入手机号">
                </div>
                <div class="pwd">
                    <span>密码</span>
                    <input id="password" type="password" placeholder="请输入密码">
<%--                     <input id="openId" name="openId" type="hidden"  value="${openId}"> --%>
                </div>
                <span class="clearfix">
                    <a href="/m.register.do" class="l">立即注册</a>
                    <a href="/m.foundPwd.do" class="r">找回密码?</a>
                </span>
                <p id='msg' style="color:red;margin-bottom: 0px;height:0px"></p>
                <div class="login_login submit"  id="btn">登录</div>
          <%--       <p>
                    <span></span>
                    <i>第三方登录</i>
                    <span></span>
                </p>
                <a class="img">
                    <img src="${skin}mobile/img/weixin.png" alt="">
                </a>
                <span class="wechat">
                    <a href="/m.register.do">注册</a>
                    <span></span>
                    <a href="/m.login.do">密码登录</a>
                </span> --%>
            </div>
        </div>
    </div>
    <script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}mobile/res/mui/js/mui.min.js"></script>
    <script type="text/javascript">
        mui.init()
        
     	var openId;
        var unionId;
        $(function(){
        	openId = '${openId}';
        	unionId = '${unionId}';
        	if(openId){
        		$("#title").text("中汇招标----绑定账号");
        		$("#title_one").text("绑定账号");
        		$("#btn").text("绑定");
        	}
        }); 
        
        
        $(document).keyup(function(event){
			  if(event.keyCode ==13){
			    $(".submit").trigger("tap");
			  }
			});
        /* 登录功能 */
        $(".login_login").on("tap",function()
        {
            //获取手机号密码
        	var phone=$("#phone").val();
        	var password=$("#password").val();
        	
            //验证手机号格式
            if (phone.trim().length < 11 ||  phone.trim().length > 13) 
            {
         	   if (null == phone || "" == phone) 
                {
    			    $("#msg").html("请您输入手机号")
    			    return;
               }else{
             	  $("#msg").html("请输入正确手机号")
             	  return;
               } 
            }
            if (password.trim().length < 6 ||  password.trim().length > 12) 
            {
         	   if (null == password.trim() || "" == password.trim()) 
                {
    			    $("#msg").html("请您输入密码")
    			    return;
               }else{
             	$("#msg").html("用户名密码错误")
   			    return; 
               } 
            }
             
              //如果验证通过调用登录接口
				$.ajax({
		                 url:'m.doLogin.do',
		                 data:{
	       			         phone:phone,
	       	                 password:password,
       	              		 openId:openId,
       	              		 unionId:unionId
	        	          },
		                 type:'POST',
		                 dataType:'text',
		                 success:function(res)
		                 {
			                  if(res=="succ")
			                  {
			                	  window.location.href="/m.index.do";
			                  }
			                  else{
			                	  $("#msg").text(res)
			                  }
		                 }
		            })
       })
       
       
       
       
       
        
        
    </script>
</body>

</html>