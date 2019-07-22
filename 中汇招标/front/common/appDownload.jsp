<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>APP下载</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/css/animate.css">
    <link rel="stylesheet" href="${skin}front/css/base.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/appDownload.css">
</head>

<body>
    <div class="fullpage">
        <div class="w">
            <h4><a href="/main.index.do">进入首页</a></h4>
            <div class="app_main clearfix">
                <div class="app_left l wow fadeInLeftBig">
                    <div class="img">
                        <img src="${skin}front/img/phone1.png" alt="">
                        <img src="${skin}front/img/phone2.png" alt="">
                        <img src="${skin}front/img/phone3.png" alt="">
                        <!-- 虚线 -->
                        <div><span></span></div>
                        <div><span></span></div>
                        <div><span></span></div>
                    </div>
                </div>
                <div class="app_right r wow fadeInRightBig">
                    <h2 class="wow fadeInDown">随时查看最新项目</h2>
                    <h3 class="wow fadeInDown">招标订阅 项目专盯 抢占先机 您招标采购的得力助手</h3>
                    <img src="${systemInfo.officialAccountPictureUrl}" alt="">
                    <p>关注公众号</p>
                    <a class="phone" href="#">
                        <img src="${skin}front/img/iphone.png" alt="">
                        <span>iPhone端下载</span>
                    </a>
                    <a class="phone" href="#">
                        <img src="${skin}front/img/android.png" alt="">
                        <span>Android端下载</span>
                    </a>
                </div>
            </div>
        </div>
        <!-- <div class="line"></div> -->
    </div>
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
</body>

</html>