<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>中汇招标----找回密码</title>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
    <link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}mobile/css/base.css">
    <link rel="stylesheet" href="${skin}mobile/css/foundpwd.css">
    <style>
	    .yzm{
	   	  color:#CDCDCD!important;
		}
		.msg{
		    height: 1px;
		    margin-top: 11px;
		    display: inherit;
		    text-align: center;
		    color: red;
		}
		.login .login_login{
		   line-height:0 !important;
        }
	</style>
</head>

<body>
    <div class="zh_layout">
        <header class="zh_topBar clearfix">
            <a href="/m.login.do" class="icon_back fa fa-times l"></a>
            <span>找回密码</span>
        </header>
      <form  action="/m.forgetPwd.do" method="POST" onsubmit="return validateForm();">
        <div class="zh_container">
            <div class="login">
                <h3>找回密码</h3>
                <div class="pwd">
                    <input id="phone" name='phone' type="tel" value='${phone}' placeholder="请输入手机号">
                    <a id="yzm" href="javaScript:;">获取验证码</a>
                </div>
                <div class="pwd">
                    <input id="yzm" name='yzm' type="number" placeholder="请输入验证码">
                </div>
                <span id="msg" class="msg">${msg}</span>
                <button type='submit' class="login_login">下一步</button>
            </div>
        </div>
      </form>
    </div>
    <script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}mobile/res/mui/js/mui.min.js"></script>
    <script type="text/javascript">
        mui.init()
        
        /* 获取验证码 */
        var count = 0;          //验证码剩余秒数
        var isWait = false;
        var t1;                 //定时事件
        $("#yzm").on("tap",function(){
        {
        	 if(isWait)
        	 {
        	 	return;
        	 }
        	 isWait = true;
        	 var phone=$("#phone").val().trim();
        	 
        	  if(/^1[3|4|5|7|8][0-9]\d{8,11}$/.test(phone)){
	                $.post("userQd.getCode.do",{phone:phone},function(res)
	                {
	                      $("#yzm").html(res);
	                })  
	                //倒计时60秒
	                count = 60;
	            	t1=window.setInterval(function(){
	            		 //显示验证码失效时间
	            		count = count - 1;
	                	if(count==0)
	                	{
	                		 $("#yzm").removeClass("yzm");
	                		isWait = false;
	        				clearInterval(t1);
	                		$("#yzm").html("获取验证码");
	                	}
	                	else
	                	{
	                		var text = count+"秒后重试";
	                		$("#yzm").html(text);
	                	}
            	    }, 1000);
                    $("#yzm").addClass("yzm");
        	 }
        	 else
        	 {
        		 isWait = false;
        		 $("#msg").html("请输入正确的手机号")
        	 }
        }})
        
        var phone;
    	var code;
    	
        //验证手机号密码格式
        function validateForm()
	    {
	    	var yzm=$("#code").val();
	    	var phone=$("#phone").val();
	      	 var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
	          if (!myreg.test(phone.trim())) 
	          {
	          	  $("#msg").html("请输入正确的手机号")
	          	  return false;
	          }
	          if(yzm.length != 5 || yzm == "")
	          {
	        	  $("#msg").html("请输入正确的验证码")
	  				return false;
	      	    }
		        return true;
	    }
    </script>
</body>

</html>