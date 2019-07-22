<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>中汇招标----招商服务</title>
    <link rel="shortcut icon" href="${skin}front/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="${skin}/front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}/front/css/animate.css">
    <link rel="stylesheet" type="text/css" href="${skin}/front/css/base.css">
    <link rel="stylesheet" type="text/css" href="${skin}/front/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${skin}/front/css/attractInvestment.css">
</head>

<body>
    <!-- 头部导航 -->
    <div class="head_nav">
        <div class="nav clearfix">
            <a  class="l" href="/main.index.do"><img src="${skin}/front/img/logo.png" alt=""></a>
            <ul class="l">
            	<li><a href="main.index.do">首页</a></li>
				<li><a href="bids.listIndex.do">招标信息</a></li>
				<li><a href="bids.listIndex.do" onclick="toPurchaseIndex()">采购信息</a></li>
				<li><a href="biddinginfo.listIndex.do">项目中心</a></li>
				<li><a href="application.listIndex.do">供应商</a></li>
            </ul>
        </div>
    </div>
    <!-- banner -->
    <div class="banner">
        <img src="${skin}/front/img/zhzb.jpg" alt="">
        <div class="w">
            <div class="b_title wow fadeInUpBig">
                <p>中汇招标合作渠道招募正式开启</p>
                <p>ZhongHui&nbsp;Tendering&nbsp;Cooperation&nbsp;Channel&nbsp;Recrultment&nbsp;Officially&nbsp;Opened
                </p>
                <p>加入我们<span><i class="fa fa-phone-square" aria-hidden="true"></i>${systemInfo.servicePhone}</span></p>
            </div>
        </div>
    </div>
    <div class="advantage">
        <!-- 六大优势 -->
        <div class="w">
            <h3>六大优势</h3>
            <hr>
            <div class="advantage_content">
                <div class="t_advantage_content clearfix">
                    <div class="l">
                        <img src="${skin}/front/img/z1.jpg" alt="">
                        <span>准确性和权威性</span>
                    </div>
                    <div class="l">
                        <img src="${skin}/front/img/z2.jpg" alt="">
                        <span>丰富的信息数量</span>
                    </div>
                    <div class="l">
                        <img src="${skin}/front/img/z3.jpg" alt="">
                        <span>信息快捷和准确</span>
                    </div>
                </div>
                <div class="t_advantage_content">
                    <div class="l">
                        <img src="${skin}/front/img/z4.jpg" alt="">
                        <span>多渠道展现</span>
                    </div>
                    <div class="l">
                        <img src="${skin}/front/img/z5.jpg" alt="">
                        <span>强大的技术力量与专业的团队</span>
                    </div>
                    <div class="l">
                        <img src="${skin}/front/img/z6.jpg" alt="">
                        <span>优质的服务</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- 权威认证 -->
        <div class="major">
            <div class="w">
                <h3>权威认证</h3>
                <hr>
                <div class="a_content">
                    <div class="t_advantage_content clearfix">
                        <div class="l">
                            <img src="${skin}/front/img/quanwei.png" alt="">
                            <span>平台权威认证</span>
                        </div>
                        <div class="l">
                            <img src="${skin}/front/img/jianguan.png" alt="">
                            <span>监管信息协同</span>
                        </div>
                        <div class="l">
                            <img src="${skin}/front/img/ziyuan.png" alt="">
                            <span>丰富优质资源</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 合作分布 -->
        <div class="w">
            <h3>合作分布</h3>
            <hr>
            <div class="ad_content">
                <i class="fa fa-star" aria-hidden="true"></i>
                <div id="ad_content" style="width:1200px;height:800px;">
                
                </div>
            </div>
        </div>
    </div>
    <!-- 公共底部 -->
    <%@ include file="../common/footer.jsp"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.2.1/echarts.min.js"></script>
    <script src="${skin}/front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}/front/js/wow.min.js"></script>
    <script src="${skin}/front/js/china.js"></script>
    <script src="${skin}/front/js/map.js"></script>
    <script>
        $('.advantage_content .t_advantage_content>div').hover(function () {
            $(this).css({
                'background-color':'#000',
                'opacity':'0.8'
            })
        }, function () {
            $(this).css({
                'background-color':'',
                'opacity':''
            })
        })
        new WOW().init();
        
    </script>
</body>

</html>