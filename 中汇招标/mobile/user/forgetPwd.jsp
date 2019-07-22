<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>中汇招标----忘记密码</title>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
    <link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}mobile/css/base.css">
    <link rel="stylesheet" href="${skin}mobile/css/forgetpwd.css">
    <style>
    .login .login_login{
		   line-height:0 !important;
        }
        .msg{
	        top: -6px;
	        position: relative;
	        text-align: center;
        }
        .msg span{
            color:red;
        }
    </style>
</head>

<body>
    <div class="zh_layout">
        <header class="zh_topBar clearfix">
            <a href="javascript:history.back()" class="icon_back fa fa-times l"></a>
            <span>忘记密码</span>
        </header>
        <form action="/m.forgetupdatePwd.do" method="POST" onsubmit="return aa()">
        <div class="zh_container">
            <div class="login">
                <h3>设定新密码</h3>
                <div class="pwd">
                    <input id="pass" type="password"  placeholder="请输入新密码">
                </div>
                <div class="pwd">
                    <input id="repwd" name='password' type="password" placeholder="再次输入密码">
                    <div class="msg">
                    <span id="repwdMsg" ></span>
                    </div>
                </div>
                <button type="submit" class="login_login">立即登录</a>
            </div>
        </div>
        </form>
    </div>
    <script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}mobile/res/mui/js/mui.min.js"></script>
    <script type="text/javascript">
        mui.init()
        
        //验证两次密码是否一致
        function aa(){
    	if($("#pass").val().trim().length < 6){
    		$("#repwdMsg").html("请输入超过6位的新密码")
    		return false;
    	}
    	if($("#repwd").val().trim().length < 6){
    		$("#repwdMsg").html("确认密码有误")
    		return false;
    	}
    	if($("#repwd").val().trim() != $("#pass").val()){
    		$("#repwdMsg").html("两次密码不一致,请重新输入")
    		return false;
    	}
    	$("#repwdMsg").html("")
    	return true;
    }
    </script>
</body>

</html>