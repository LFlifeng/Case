<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>中汇招标----注册成功</title>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="shortcut icon" href="${skin}mobile/favicon.ico" type="image/x-icon">
    <link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}mobile/css/base.css">
    <link rel="stylesheet" href="${skin}mobile/css/suss_regist.css">
</head>

<body>
    <div class="zh_layout">
        <header class="zh_topBar clearfix">
            <a href="/m.register.do" class="icon_back fa fa-times l"></a>
            <span>注册成功</span>
        </header>
        <div class="zh_container">
            <div class="login">
                <div class="tip">
                    <img src="${skin}mobile/img/success.png" alt="">
                    <p>恭喜您！账户注册成功了。</p>
                </div>
                <a href="/m.login.do" class="login_login">立即登录</a>
            </div>
        </div>
    </div>
    <script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}mobile/res/mui/js/mui.min.js"></script>
    <script type="text/javascript">
        mui.init()
    </script>
</body>

</html>