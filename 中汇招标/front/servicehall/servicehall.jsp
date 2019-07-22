<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>服务大厅</title>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="${skin}js/layui/layui.js"></script>
<script src="${skin}font/js/common.js"></script>
<link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="${skin}js/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/servicehall.css">
	
<style type="text/css">
.head_nav .nav ul li:nth-child(7) a {
	background-color: #505050;
	color: #fff;
}
</style>
</head>

<body>
	<!-- 公共头部 -->
	<%@ include file="../common/header.jsp"%>
    <!-- 头部导航 -->
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
    <!-- banner -->
    <div class="banner">
        <img src="${skin}front/img/serverbanner.jpg" alt="">
    </div>
    <div class="advantage">
        <!-- 产品核心优势 -->
        <div class="w">
            <h3>产品核心优势</h3>
            <hr>
            <div class="advantage_content clearfix">
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/servericon1.jpg" alt="">
                    </div>
                    <div class="r">
                        <h4>准确性和权威性</h4>
                        <p>中汇招标网与国家有关部委及所属单位、各地市政府采购中心和国内多家招标公司有着长期密切和广泛的合作，获取最为全面和准确的招标、采购及项目信息。</p>
                    </div>
                </div>
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/servericon2.jpg" alt="">
                    </div>
                    <div class="r">
                        <h4>丰富的信息数量</h4>
                        <p>每天提供的国内招标信息数量上万条，中标结果上万条，每天信息更新总量达到5000-7000条，处于行业领先地位。</p>
                    </div>
                </div>
            </div>
            <div class="advantage_content clearfix">
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/servericon3.jpg" alt="">
                    </div>
                    <div class="r">
                        <h4>信息快捷和准确</h4>
                        <p>VIP独家项目、拟在建项目、招标预告与招标公告相结合，提高企业把握项目的能力和提前调配资源时间。让客户在第一时间掌握所需信息，提高公司的中标率，使公司能更全面了解行业内的动态。
                        </p>
                    </div>
                </div>
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/servericon4.jpg" alt="">
                    </div>
                    <div class="r">
                        <h4>多渠道展现</h4>
                        <p>全面覆盖1000多个行业全国地区，各个行业所有信息全面提供给您，让您掌握更多商机和信息，开拓业务！</p>
                    </div>
                </div>
            </div>
            <div class="advantage_content clearfix">
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/servericon5.jpg" alt="">
                    </div>
                    <div class="r">
                        <h4>强大的技术力量与专业的团队</h4>
                        <p>
                            中汇招标网拥有包括信息收集、整理、发布的一系列技术解决方案，可以为客户提供稳定可靠的服务。为您提供最及时、全面、准确的招标公告，信息预告。招标咨询等一系列服务。
                        </p>
                    </div>
                </div>
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/servericon6.jpg" alt="">
                    </div>
                    <div class="r">
                        <h4>优质的服务</h4>
                        <p>我们将会为您提供一对一客服，帮助您搜索到您想要的信息，筛选过滤后并且及时地以电话、客户移动端等方式通知您，有效地帮助您避免因工作繁忙或其他原因没有及时得到消息，而遭受损失。</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 专业 -->
        <div class="major">
            <div class="title">
                找专业的人&nbsp做专业的事
            </div>
            <div class="list clearfix w">
                <div class="l">
                    <h3>平台权威认证</h3>
                    <img src="${skin}front/img/server1.png" alt="">
                    <p>平台与三方认证机构合作，保证您合作的载体合法。</p>
                </div>
                <div class="l">
                    <h3>监管信息协同</h3>
                    <img src="${skin}front/img/server2.png" alt="">
                    <p>监督平台上的信息来源，严格审核信息，确保业务的真实性。</p>
                </div>
                <div class="l">
                    <h3>丰富优质资源</h3>
                    <img src="${skin}front/img/server3.png" alt="">
                    <p>平台上优质的供应商多达数千家每日发布招标数量日均过万。</p>
                </div>
            </div>
        </div>
        <!-- 及时高效服务 -->
        <div class="w">
            <h3>及时 高效 服务</h3>
            <hr>
            <div class="advantage_content clearfix">
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/i1.jpg" alt="">
                    </div>
                    <div class="r">
                        <p>海量数据库</p>
                    </div>
                </div>
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/i2.jpg" alt="">
                    </div>
                    <div class="r">
                        <p>智能检测企业招标动态</p>
                    </div>
                </div>
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/i3.jpg" alt="">
                    </div>
                    <div class="r">
                        <p>近千家供应商、采购商库</p>
                    </div>
                </div>
            </div>
            <div class="advantage_content clearfix">
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/i4.jpg" alt="">
                    </div>
                    <div class="r">
                        <p>微信公众号、pc、邮件三端展示</p>
                    </div>
                </div>
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/i5.jpg" alt="">
                    </div>
                    <div class="r">
                        <p>随时随地 私人定制查询</p>
                    </div>
                </div>
                <div class="l clearfix">
                    <div class="l">
                        <img src="${skin}front/img/i6.jpg" alt="">
                    </div>
                    <div class="r">
                        <p>免费发布招标信息</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
  
	<%@ include file="../common/footer.jsp"%>

</body>

</html>