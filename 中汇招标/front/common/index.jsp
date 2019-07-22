<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>中汇招标网-招标|采购|拟建项目|招标采购信息服务平台</title>
<meta name="keywords"
	content="中汇招标网,招标,招投标,采购,招标网,采购网,采购信息,企业采购,招标信息,供应商,招标公告,采购平台,招标平台">
<meta name="description"
	content="中汇招标网致力于为企业提供招标、采购、拟在建项目信息及网上招标采购等一系列商务服务。中汇招标网为政府、供应商、招标单位提供精准匹配的招标采购信息，同时提供招标信息免费发布、投标咨询、标书制作等服务。">
<meta charset="utf-8">
<link rel="shortcut icon" href="${skin}front/img/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/header.css">
<link rel="stylesheet" type="text/css" href="${skin}front/css/index.css">
<link rel="stylesheet" type="text/css" href="${skin}front/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${skin}front/css/footer.css">
<link rel="stylesheet"
	href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
<script src="https://cdn.bootcss.com/countup.js/1.9.3/countUp.js"></script>
<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
<script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
<script src="${skin}front/js/common.js"></script>
<script src="${skin}front/js/search.js"></script>
<script src="${skin}front/js/main.js"></script>

<style>
.head_nav .nav ul li:first-child a {
	background-color: #505050;
	color: #fff;
}

#tdd {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

[v-cloak] {
	display: none;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
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
	<div class="main">
		<div class="main_content clearfix" id="columnData" v-cloak>
			<div class="main_box fl" v-for="columns in columnCategorys">
				<h3>{{columns.columnName}}</h3>
				<div class="main_list">
					<ul>
						<li v-for="item in columns.list"><a :href='item.url'
							@click='leixing(item.columnName)'>{{item.columnName}}</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 头部导航 end-->
	<div class="content clearfix">
		<!-- 招标分类 -->
		<div class="sub_menu fl" id="data" v-cloak>
			<div class="sub_menu_more">
				<span>热门招标分类</span> <a class="" href="/industry.detail.do">更多</a>
			</div>
			<ul>
				<li v-for="(industry,position) in industrys" v-if=" position < 7">
					<h3 v-cloak>{{ industry.name }}</h3>
					<p class="lb" v-for="(item,index) in industry.list"
						v-if=" index < 3">
						<a href="bids.listIndex.do" @click='classification(item)'>{{item}}&nbsp;</a>
					</p>
				</li>
			</ul>
		</div>
		<!-- 轮播图部分 -->
		<div class="did_new fl fl10">
			<div class="layui-carousel" id="test1"
				style="height: 210px; width: 100%;">
				<div carousel-item>
					<div>
						<a href="/userQd.topic.do"><img
							src="${skin}front/img/banner01.jpg" class="img" alt=""></a>
					</div>
					<div>
						<a href="/search.index.do"><img class="img"
							src="${skin}front/img/11.jpg" alt=""></a>
					</div>
					<div>
						<a href="/userQd.attractInvestment.do"><img src="${skin}front/img/banner02.jpg" alt=""></a>
					</div>
					<%-- <div>
						<img src="${skin}front/img/banner03.jpg" alt="">
					</div> --%>
				</div>
			</div>

			<div class="app">
				<div id="app" v-cloak>
					<ul class="tab-tilte">
						<li @click="cur=0" :class="{active:cur==0}" onclick="todayBids()">今日招标</li>
						<li @click="cur=1" :class="{active:cur==1}" onclick="todayNews()">实时新闻</li>
						<li @click="cur=2" :class="{active:cur==2}">推荐公告</li>
						<li @click="cur=3" :class="{active:cur==3}">优秀供应商</li>
					</ul>
					<div class="tab-content">
						<div v-show="cur==0">
							<ul class="did_news_list" v-for="bids in todayBidsList"
								:key="bids.id">
								<li id="tdd"><a :href="'bids.details.do?id=' +bids.id"
									v-cloak>{{bids.name}}</a></li>
							</ul>
							<a href="bids.listIndex.do" class="more"> 更多 </a>
						</div>
						<div v-show="cur==1">
							<ul class="did_news_list" v-for="news in todayNewsList"
								:key="news.id">
								<li id="tdd"><a :href="'news.details.do?id=' +news.id"
									v-cloak>{{news.title}}</a></li>

							</ul>
						</div>
						<div v-show="cur==2">
							<ul class="did_notice_list" v-for="bids in recommendBidsList"
								:key="bids.id">
								<li id="tdd"><a :href="'bids.details.do?id=' +bids.id"
									v-cloak>{{bids.name}}</a></li>
							</ul>
						</div>
						<div v-show="cur==3">
							<ul class="did_business_list"
								v-for="application in excellentSuppliersList"
								:key="application.id">
								<li id="tdd"><a
									:href="'/application.applicationShow.do?id=' +application.id"
									v-cloak>{{application.enterpriseName}}</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 用户登陆注册部分 -->
		<div class="user_center fl fl10">
			<div class="user_info">
				<div class="user_info_head clearfix" style="display: block">
					<img src="${skin}front/img/head_placeholder.png" class="l" style="">
					<div class="user_jj l">
						<div class="user_name">
							<a class='notlogin' href="#">未登录</a>
						</div>
						<div class="login_res">
							<a href="/userQd.login.do">登录</a> <a href="/userQd.register.do">注册</a>
						</div>
					</div>
				</div>
				<div class="user_info_head clearfix" style="display: none">
					<img src="${user.portraitUrl}" class="l">
					<div class="user_jj l">
						<div id="user_name" class="user_name">
							<a href="${centerUrl}" style="color: #ba3e43;"></a>
						</div>
						<div id="user_level" class="user_level" style="color: #969696;">
							会员级别：<span></span>
						</div>
					</div>
				</div>
				<div class="user_fun">
					<ul class="clearfix">
						<li><a href="/trackerFront.page.do"> <span>我的跟踪</span>
						</a></li>
						<li><a href="/userCollection.listIndex.do"> <span>我的收藏</span>
						</a></li>
						<li><a href="/designedinfo.listIndex.do"> <span>我的专盯</span>
						</a></li>
						<li><a href="/systemQd.paymentInstruction.do"> <span>我的消息</span>
						</a></li>
						<li><a href="/userQd.serviceStandards.do"> <span>升级购买</span>
						</a></li>
						<li><a href="${centerUrl}"> <span>个人中心</span>
						</a></li>
					</ul>
				</div>
			</div>

			<div class="bidding_info">
				<div>
					<p>今日更新企业数据</p>
					<span id="numBox">158238492</span>
					<span style="font-size: 16px">次</span>
				</div>
				<div>
					<p>今日更新招标数据</p>
					<span id="numBox1">56384</span>
					<span style="font-size: 16px">次</span>
				</div>
			</div>
			<div class="send">
				<i class="fa fa-pencil"></i> <input class="send_btn" type="button"
					value="发布信息">
			</div>
		</div>
		<div class="cl"></div>
		<div class="tracker w">
			<div class="title clearfix">
				<div class="jingxuan l">精选项目追踪</div>
				<div class="gengduo jxxm r">
					<a id='project_vip' href="/biddinginfo.listIndex.do">展开 <i class="fa fa-angle-double-down"></i></a>
				</div>
			</div>
			<table id="jxxm_"class="jxxm">
				<tbody>
					<tr v-for="jxProjects in jxProjectlist" :key="jxProjects.id">
						<td style="width: 58%"><a href="javascript:;" :href="'biddinginfo.details.do?id=' +jxProjects.id"
								target="blank">{{jxProjects.projectName}} </a></td>
						<td style="width: 7%"><a id='project_vip' href="/biddinginfo.listIndex.do">VIP精选</a></td>
						<td><img src="${skin}front/img/next.png" alt=""></td>
						<td style="width: 7%"><a id='project_nj' href="/biddinginfo.listIndex.do">拟建</a></td>
						<td><img src="${skin}front/img/next.png"></td>
						<td style="width: 7%"><a id='project_yg' href="/biddinginfo.listIndex.do">预告</a></td>
						<td><img src="${skin}front/img/next.png"></td>
						<td style="width: 7%"><a id='project_gg' href="/biddinginfo.listIndex.do">公告</a></td>
						<td><img src="${skin}front/img/next.png"></td>
						<td style="width: 7%"><a id='project_bg' href="/biddinginfo.listIndex.do">变更</a></td>
						<td><img src="${skin}front/img/next.png"></td>
						<td style="width: 7%"><a id='project_zb' href="/biddinginfo.listIndex.do">中标</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="didding">
			<div class="did_L">
				<div class="didding_news" style="width: 272px" id="bc" v-cloak>
					<div class="didding_news_title">
						招标资讯<a class="fr fr10" href="bids.listIndex.do">更多</a>
					</div>
					<ul class="didding_news_con">
						<li v-for="bids in bidsConsultationList" :key="bids.id"><a
							:href="'bids.details.do?id=' +bids.id" target="blank">{{bids.name}}</a>
						</li>
					</ul>
				</div>
				<div class="logo_ad">
					<li class="r10"><a href="#"><img
							src="${skin}front/img/g1.jpg"></a></li>
					<li><a href="#"><img src="${skin}front/img/g2.jpg"></a></li>
					<li class="r10 t10"><a href="#"><img
							src="${skin}front/img/g3.jpg"></a></li>
					<li class="t10"><a href="#"><img
							src="${skin}front/img/g4.jpg"></a></li>

				</div>
			</div>
			<div class="didding_content fl fl10">
				<div id="did" v-cloak>
					<ul class="did-tab-title">
						<li @click="cur1=0" :class="{active:cur1==0}"
							onclick="typeBids('招标公告')">招标公告</li>
						<li @click="cur1=1" :class="{active:cur1==1}"
							onclick="typeBids('预审公告')">预审预告</li>
						<li @click="cur1=2" :class="{active:cur1==2}"
							onclick="typeBids('变更公告')">变更公告</li>
						<li @click="cur1=3" :class="{active:cur1==3}"
							onclick="typeBids('中标公告')">中标公告</li>
					</ul>
					<div class="did-tab-content">
						<div v-show="cur1==0">
							<ul class="did_project_list">
								<li>
									<table>
										<tbody>
											<tr v-for="bids in typeBidsList" :key="bids.id">
												<td style="width: 85%; text-align: left"><a
													:href="'bids.details.do?id=' +bids.id" target="_blank">{{bids.name}}</a>
												</td>

												<td style="width: 15%;">{{bids.time}}</td>
											</tr>
										</tbody>

									</table>
								</li>
							</ul>
						</div>
						<div v-show="cur1==1">
							<ul class="did_project_list">
								<li>
									<table>
										<tbody>
											<tr v-for="bids in typeBidsList" :key="bids.id">
												<td style="width: 85%; text-align: left"><a
													:href="'bids.details.do?id=' +bids.id" target="_blank">
														{{bids.name}} </a></td>

												<td style="width: 15%;">{{bids.time}}</td>
											</tr>
										</tbody>

									</table>
								</li>
							</ul>
						</div>
						<div v-show="cur1==2">
							<ul class="did_project_list">
								<li>
									<table>
										<tbody>
											<tr v-for="bids in typeBidsList" :key="bids.id">
												<td style="width: 85%; text-align: left"><a
													:href="'bids.details.do?id=' +bids.id" target="_blank">
														{{bids.name}} </a></td>

												<td style="width: 15%;">{{bids.time}}</td>
											</tr>
										</tbody>

									</table>
								</li>
							</ul>
						</div>
						<div v-show="cur1==3">
							<ul class="did_project_list">
								<li>
									<table>
										<tbody>
											<tr v-for="bids in typeBidsList" :key="bids.id">
												<td style="width: 85%; text-align: left"><a
													:href="'bids.details.do?id=' +bids.id" target="_blank">{{bids.name}}</a></td>

												<td style="width: 15%;">{{bids.time}}</td>
											</tr>
										</tbody>

									</table>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="didding_right fl fl10" style="width: 306px">
				<div class="did_free" id='freeBids' v-cloak>
					<div class="did_free_tit">
						免费公告<a class="fr fr10" href="bids.listIndex.do">更多</a>
					</div>
					<ul class="did_free_tit_li">

						<li v-for="bids in freeBidsList" :key="bids.id"><a
							:href="'bids.details.do?id=' +bids.id" target="blank">{{bids.name}}</a>
						</li>
					</ul>
				</div>
				<div class="did_free t10" style="width: 306px" id="winBids" v-cloak>
					<div class="did_free_tit">
						中标公告<a class="fr fr10" href="bids.listIndex.do"
							onclick="setLeixing('中标公告')">更多</a>
					</div>
					<ul class="did_free_tit_li">
						<li v-for="bids in winBidsList" :key="bids.id"><a
							:href="'bids.details.do?id=' +bids.id" target="blank">{{bids.name}}</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="cl"></div>
		<a href='/userQd.appDownload.do'><div class="index_AD01"></div></a>
		<div class="did_buy">
			<div class="did_reg fl" style="width: 260px;">
				<div class="did_reg_title">地区选择</div>
				<div class="reg">
					<h3>华北地区</h3>
					<span><a href="#" onclick="queryByRegion('北京')">北京</a></span><span><a
						href="#" onclick="queryByRegion('天津')">天津</a></span><span><a
						href="#" onclick="queryByRegion('河北')">河北</a></span><span><a
						href="#" onclick="queryByRegion('山西')">山西</a></span><span><a
						href="#" onclick="queryByRegion('内蒙古')">内蒙古</a></span>
				</div>
				<div class="reg">
					<h3>华东地区</h3>
					<span><a href="#" onclick="queryByRegion('上海')">上海</a></span><span><a
						href="#" onclick="queryByRegion('江苏')">江苏</a></span><span><a
						href="#" onclick="queryByRegion('浙江')">浙江</a></span><span><a
						href="#" onclick="queryByRegion('安徽')">安徽</a></span><span><a
						href="#" onclick="queryByRegion('江西')">江西</a></span><span><a
						href="#" onclick="queryByRegion('山东')">山东</a></span><span><a
						href="#" onclick="queryByRegion('福建')">福建</a></span>
				</div>
				<div class="reg">
					<h3>华南地区</h3>
					<span><a href="#" onclick="queryByRegion('广东')">广东</a></span><span><a
						href="#" onclick="queryByRegion('广西')">广西</a></span><span><a
						href="#" onclick="queryByRegion('海南')">海南</a></span>
				</div>
				<div class="reg">
					<h3>华中地区</h3>
					<span><a href="#" onclick="queryByRegion('湖南')">湖南</a></span><span><a
						href="#" onclick="queryByRegion('湖北')">湖北</a></span><span><a
						href="#" onclick="queryByRegion('河南')">河南</a></span>
				</div>
				<div class="reg">
					<h3>东北地区</h3>
					<span><a href="#" onclick="queryByRegion('辽宁')">辽宁</a></span><span><a
						href="#" onclick="queryByRegion('吉林')">吉林</a></span><span><a
						href="#" onclick="queryByRegion('黑龙江')">黑龙江</a></span>
				</div>
				<div class="reg">
					<h3>西北地区</h3>
					<span><a href="#" onclick="queryByRegion('陕西')">陕西</a></span><span><a
						href="#" onclick="queryByRegion('甘肃')">甘肃</a></span><span><a
						href="#" onclick="queryByRegion('青海')">青海</a></span><span><a
						href="#" onclick="queryByRegion('宁夏')">宁夏</a></span><span><a
						href="#" onclick="queryByRegion('新疆')">新疆</a></span>
				</div>
				<div class="border_bottom_none reg">
					<h3>西南地区</h3>
					<span><a href="#" onclick="queryByRegion('重庆')">重庆</a></span><span><a
						href="#" onclick="queryByRegion('四川')">四川</a></span><span><a
						href="#" onclick="queryByRegion('贵州')">贵州</a></span><span><a
						href="#" onclick="queryByRegion('云南')">云南</a></span><span><a
						href="#" onclick="queryByRegion('西藏')">西藏</a></span>
				</div>
			</div>
			<div class="did_buy_news_content fl">
				<div class="did_buy_news">
					<div id="buy" v-cloak>
						<ul class="buy-tab-title">
							<li @click="cur=0" :class="{active:cur==0}"
								onclick="typePurchase('企业采购')">企业采购</li>
							<li @click="cur=1" :class="{active:cur==1}"
								onclick="typePurchase('政府采购')">政府采购</li>
							<li @click="cur=2" :class="{active:cur==2}"
								onclick="typePurchase('中标采购')">中标采购</li>
							<li @click="cur=3" :class="{active:cur==3}"
								onclick="typePurchase('合同采购')">合同采购</li>
						</ul>
						<div class="buy-tab-content">
							<div v-show="cur==0">
								<ul class="did_company_list">
									<li id="tdd" v-for="purchaseInfo in typePurchaseList"
										:key="purchaseInfo.id"><a
										:href="'bids.details.do?id=' +purchaseInfo.id" target="blank">{{purchaseInfo.name}}</a></li>
								</ul>
							</div>
							<div v-show="cur==1">
								<ul class="did_company_list">
									<li id="tdd" v-for="purchaseInfo in typePurchaseList"
										:key="purchaseInfo.id"><a
										:href="'bids.details.do?id=' +purchaseInfo.id" target="blank">{{purchaseInfo.name}}</a></li>
								</ul>
							</div>
							<div v-show="cur==2">
								<ul class="did_company_list">
									<li id="tdd" v-for="purchaseInfo in typePurchaseList"
										:key="purchaseInfo.id"><a
										:href="'bids.details.do?id=' +purchaseInfo.id" target="blank">{{purchaseInfo.name}}</a></li>
								</ul>
							</div>
							<div v-show="cur==3">
								<ul class="did_company_list">
									<li id="tdd" v-for="purchaseInfo in typePurchaseList"
										:key="purchaseInfo.id"><a
										:href="'bids.details.do?id=' +purchaseInfo.id" target="blank">{{purchaseInfo.name}}</a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>

				<div class="mingqi" id="mingqi" v-cloak>
					<div class="mingqi_title">名企采购</div>
					<ul class="mingqi_icon">
						<li id="tdd" v-for="company in famousCompanyList"
							:key="company.id"><img :src="company.portraitUrl"
							style="border-radius: 21px;" />
							<p>
								<a :href="'/application.applicationShow.do?id=' +company.id">{{company.enterpriseName}}</a>
							</p></li>

					</ul>
				</div>
			</div>
			<div class="did_buy_show fl10" id="famousCompany" v-cloak>
				<div class="did_buy_mingqishow">名企展示墙</div>
				<ul class="mingqishow">
					<li id="tdd" v-for="company in famousCompanyWallList"
						:key="company.id"><img :src="company.portraitUrl"
						style="border-radius: 100%;" />
						<p>
							<a :href="'/application.applicationShow.do?id=' +company.id">{{company.enterpriseName}}</a>
						</p></li>
				</ul>
			</div>

		</div>
	</div>
	</div>
	<div class="cl"></div>
	<div class="did_pm">
		<div class="pm_did_doc fl" id="ProposedProject" v-cloak>
			<div class="pm_did_doc_title" style="width: 250px;">拟在建项目</div>
			<ul class="doc">
				<li v-for="biddingInfo in ProposedProjectList" :key="biddingInfo.id">
					<a :href="'biddinginfo.details.do?id=' +biddingInfo.id"
					target="blank">{{biddingInfo.projectName}}</a>
				</li>

			</ul>
		</div>
		<div class="pm_content fl fl10">
			<div class="pm_news">
				<div id="pm" v-cloak>
					<ul class="pm-tab-title">
						<li @click="cur=0" :class="{active:cur==0}"
							onclick="findBidingInfoByType('VIP精选')">VIP精选</li>
						<li @click="cur=1" :class="{active:cur==1}"
							onclick="findBidingInfoByType('审批项目')">审批项目</li>
						<li @click="cur=2" :class="{active:cur==2}"
							onclick="findBidingInfoByType('政府项目')">政府项目</li>
						<li @click="cur=3" :class="{active:cur==3}"
							onclick="findBidingInfoByType('商业项目')">商业项目</li>
						<li @click="cur=4" :class="{active:cur==4}"
							onclick="findBidingInfoByType('业主项目')">业主项目</li>
					</ul>
					<div class="pm-tab-content">
						<div v-show="cur==0">
							<ul class="did_pm_list">
								<li id='tdd' v-for="biddingInfo in typeBiddingInfoList"
									:key="biddingInfo.id"><a
									:href="'biddinginfo.details.do?id=' +biddingInfo.id"
									target="blank">{{biddingInfo.projectName}}</a></li>
							</ul>
						</div>
						<div v-show="cur==1">
							<ul class="did_pm_list">
								<li id='tdd' v-for="biddingInfo in typeBiddingInfoList"
									:key="biddingInfo.id"><a
									:href="'biddinginfo.details.do?id=' +biddingInfo.id"
									target="blank">{{biddingInfo.projectName}}</a></li>
							</ul>
						</div>
						<div v-show="cur==2">
							<ul class="did_pm_list">
								<li id='tdd' v-for="biddingInfo in typeBiddingInfoList"
									:key="biddingInfo.id"><a
									:href="'biddinginfo.details.do?id=' +biddingInfo.id"
									target="blank">{{biddingInfo.projectName}}</a></li>
							</ul>
						</div>
						<div v-show="cur==3">
							<ul class="did_pm_list">
								<li id='tdd' v-for="biddingInfo in typeBiddingInfoList"
									:key="biddingInfo.id"><a
									:href="'biddinginfo.details.do?id=' +biddingInfo.id"
									target="blank">{{biddingInfo.projectName}}</a></li>
							</ul>
						</div>
						<div v-show="cur==4">
							<ul class="did_pm_list">
								<li id='tdd' v-for="biddingInfo in typeBiddingInfoList"
									:key="biddingInfo.id"><a
									:href="'biddinginfo.details.do?id=' +biddingInfo.id"
									target="blank">{{biddingInfo.projectName}}</a></li>
							</ul>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="pm_did_doc fl fl10" style="width: 314px" id="bidDatumList">
			<div class="pm_did_doc_title">
				投标资料<a class="fr fr10" href="/bidDatum.listIndex.do">更多</a>
			</div>
			<ul class="doc">
				<li v-for="bidDatum in bidDatumList" :key="bidDatum.id"><a
					:href="'bidDatum.details.do?id=' +bidDatum.id" style="width:286px">{{bidDatum.tltle}}</a></li>
			</ul>
		</div>
	</div>
	<div class="cl"></div>
	<div class="index_AD04"></div>
	<div class="did_news">
		<div class="did_news_content fl">
			<div class="hy_news fl" id="hy" v-cloak>
				<div class="hy_news_title">
					行业资讯<a class="fr fr10" href="news.listIndex.do"
						onclick="setCategory('行业资讯')">更多</a>
				</div>
				<ul class="did_news_l">
					<li v-for="news in hyNewsList" :key="news.id"><a
						:href="'news.details.do?id=' +news.id">{{news.title}}</a></li>
				</ul>
			</div>
			<div class="jiedu fl fl10" id="jiedu" v-cloak>
				<div class="jiedu_title">
					政策解读<a class="fr fr10" href="news.listIndex.do"
						onclick="setCategory('新规解读')">更多</a>
				</div>
				<ul class="did_news_l">
					<li v-for="news in jieduNewsList" :key="news.id"><a
						:href="'news.details.do?id=' +news.id">{{news.title}}</a></li>
				</ul>

			</div>
			<div class="zhanhui fl t10" id="zhanhui" v-cloak>
				<div class="zhanhui_title">
					近期展会<a class="fr fr10" href="news.listIndex.do"
						onclick="setCategory('近期展会')">更多</a>
				</div>
				<ul class="did_news_l">
					<li v-for="news in zhanhuiNewsList" :key="news.id"><a
						:href="'news.details.do?id=' +news.id">{{news.title}}</a></li>
				</ul>
			</div>
			<div class="baoguang fl fl10 t10" id="baoguang" v-cloak>
				<div class="baoguang_title">
					曝光台<a class="fr fr10" href="news.listIndex.do"
						onclick="setCategory('曝光台')">更多</a>
				</div>
				<ul class="did_news_l">
					<li v-for="news in baoguangNewsList" :key="news.id"><a
						:href="'news.details.do?id=' +news.id">{{news.title}}</a></li>
				</ul>
			</div>
		</div>
		<div class="did_news_AD fl fl10">
			<div class="ad03">
				<div class="container">
					<div class="title">招标日历</div>
					<div class="top">
						<div class="sel1">
							<div class="prev">&lt;</div>
							<input type="text">
							<div class="next">&gt;</div>
						</div>
						<div class="sel2">
							<div class="prev">&lt;</div>
							<input type="text">
							<div class="next">&gt;</div>
						</div>
						<div class="btn btn1">跳转</div>
						<div class="btn btn2">今天</div>
					</div>
					<div class="date">
						<ul class="level1ul">
							<li>
								<ul class="level2ul day">
									<li>日</li>
									<li>一</li>
									<li>二</li>
									<li>三</li>
									<li>四</li>
									<li>五</li>
									<li>六</li>
								</ul>
							</li>
							<li>
								<ul class="level2ul level2ul1">
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
								</ul>
							</li>
							<li>
								<ul class="level2ul level2ul2">
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
								</ul>
							</li>
							<li>
								<ul class="level2ul level2ul3">
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
								</ul>
							</li>
							<li>
								<ul class="level2ul level2ul4">
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
								</ul>
							</li>
							<li>
								<ul class="level2ul level2ul5">
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
								</ul>
							</li>
							<li>
								<ul class="level2ul level2ul6">
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
									<li><a href="javascript:;" class="msg1"></a> </li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="ad04 t10">
				<a href="/service.index.do">
					<img src="${skin}front/img/ad02.jpg" />
				</a>
			</div>
		</div>
	</div>
	<div class="cl"></div>
	<div class="brother">
		<div class="brother_title">合作伙伴</div>
		<ul class="brother_list">
			<li><a href="http://www.cicdi.com/"><img
					src="${skin}front/img/b1.jpg" /></a></li>
			<li><a href="http://www.hbzhan.com/st156836/"><img
					src="${skin}front/img/b2.jpg" /></a></li>
			<li><a href="http://www.chyixin.com/"><img
					src="${skin}front/img/b3.jpg" /></a></li>
			<li><a href="http://www.bj5j.com/"><img
					src="${skin}front/img/b4.jpg" /></a></li>
			<li><a href="https://cn.made-in-china.com/showroom/352078861"><img
					src="${skin}front/img/b5.jpg" /></a></li>
			<li><a href="http://www.hbexqt.com/"><img
					src="${skin}front/img/b6.jpg" /></a></li>
			<li><a href="http://lxdj57816.b2bvip.com/"><img
					src="${skin}front/img/b7.jpg" /></a></li>
			<li><a href="http://www.jfinfo.com/"><img
					src="${skin}front/img/b8.jpg" /></a></li>
			<li><a href="https://www.ygzykj.com/home/yangguang.do"><img
					src="${skin}front/img/b9.jpg" /></a></li>
			<li><a href="http://www.crtketai.com/"><img
					src="${skin}front/img/b10.jpg" /></a></li>
		</ul>
	</div>
	<div class="link">
		<div class="link_title">友情链接</div>
		<ul class="link_link">
			<a href="http://www.zz91.com/">再生塑料</a>
			<a href="https://www.alu.cn/">中国铝业</a>
			<a href="http://www.zhizhu35.com/">蜘蛛商务网</a>
			<a href="http://www.rdzjw.com/">弱电之家</a>
			<a href="http://bbs.zhulong.com/101020/">景观园林</a>
			<a href="http://www.chinafloor.cn/knowledge/">地板知识</a>
			<a href="http://www.chinammw.cn/">中国木门网</a>
			<a href="http://www.chinachugui.com/">中国橱柜网</a>
			<a href="https://www.tuzhuhu.com/">基础工程</a>
			<a href="http://www.jiaguboshi.com/">地基处理</a>
			<a href="http://www.jiaguboshi.com/">建造师培训</a>
			<a href="http://cd.zhuangku.com/">成都装修公司</a>
			<a href="http://www.58zulin.com/">设备租赁</a>
			<a href="http://agent.jc001.cn/">建材招商</a>
			<a href="http://www.huajx.com/">化工机械</a>
			<a href="http://www.bf35.com/">阀门商务网</a>
		</ul>
	</div>
	<%@ include file="footer.jsp"%>
	<!-- 侧边服务 -->
	<div class="suspension">
		<a href="#" class="conslut" target="" title="在线客服">
			<div class="suspension-list" style="display: none;">
				<div class="suspension-list-content">
					<ul>
						<li>
							<div class="service-phone" href="javascript:;">
								<p class="info-name">客服热线</p>
								<p class="info-value">${systemInfo.servicePhone}</p>
							</div>
						</li>
						<li>
							<div class="service-qq" href="javascript:;">
								<p class="info-name">在线客服</p>
								<p class="info-value">353225790</p>
							</div>
						</li>
						<li>
							<div class="service-list-bottom" href="javascript:;">
								<p class="info-name">投诉与建议</p>
								<p class="info-value">最快10分钟内回应</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</a> <a href="" class="cart" title="关注微信公众号">
			<div class="pic" style="display: none;">
				<div class="pic-content">
					<img src="${systemInfo.officialAccountPictureUrl}" alt="">
				</div>
			</div>
		</a> <a href="javascript:;" class="back-top" title="返回顶部"
			style="display: none;"> </a>
		<!-- //反馈与建议 -->
		<div class="suggest">
			<textarea name="" id="question" cols="54" rows="10"></textarea>
			<button id="complaint_submit">提交</button>
		</div>
	</div>
	<script type="text/javascript">
		UserMessage();
		var columnData = new Vue({
			el : "#columnData",
			data : {
				columnCategorys : []
			},
			methods : {
				leixing : function(leixing) {
					if (leixing) {
						localStorage.setItem("lx", leixing);
					}
				}

			},
			created : function() {
				var self = this;
				var res = localStorage.getItem("columnCategorysKey");
				if (res) {
					self.columnCategorys = JSON.parse(res);
				} else {
					$.ajax({
						url : '/columnCategory.listAll.do',
						type : 'post'
					}).then(function(res) {
						self.columnCategorys = JSON.parse(res);
						localStorage.setItem("columnCategorysKey", res)

					}).fail(function() {
					});
				}
			},
		});
		//在用户
		function UserMessage() {
			var sessionUser = '${user}';
			var grade = '${user.grade}';
			if (sessionUser != null && sessionUser != "") {

				$("#user_name a").html('${user.showName}');
				switch (grade) {
				case "0":
					$("#user_level span").css({
						"background" : 'none'
					}).html("普通用户");
					break;
				case "1":
					$("#user_level span").css({
						"background-position" : '0 0px'
					})
					break;
				case "2":
					$("#user_level span").css({
						"background-position" : '0 -16px'
					})
					break;
				case "3":
					$("#user_level span").css({
						"background-position" : '0 -35px'
					})
					break;
				case "4":
					$("#user_level span").css({
						"background-position" : '0 -50px'
					})
					break;
				}
				$(".user_info_head").eq(1).toggle();
				$(".user_info_head").eq(2).toggle();

			}
		}

		var app = new Vue({
			el : "#app",
			data : {
				cur : 0, //默认选中第一个tab
				todayBidsList : null,
				todayNewsList : null,
				recommendBidsList : null,
				excellentSuppliersList : null
			},
		});

		var did = new Vue({
			el : "#did",
			data : {
				cur1 : 0, //默认选中第一个tab
				typeBidsList : null
			}
		});
		var buy = new Vue({
			el : "#buy",
			data : {
				cur : 0,
				typePurchaseList : []
			}
		});

		var pm = new Vue({
			el : "#pm",
			data : {
				cur : 0,
				typeBiddingInfoList : null
			//默认选中第一个tab
			}
		});
		var bc = new Vue({
			el : "#bc",
			data : {
				cur : 0, //默认选中第一个tab
				bidsConsultationList : null
			}
		});
		var winBids = new Vue({
			el : "#winBids",
			data : {
				cur : 0, //默认选中第一个tab
				winBidsList : null
			}
		});
		var freeBids = new Vue({
			el : "#freeBids",
			data : {
				cur : 0, //默认选中第一个tab
				freeBidsList : null
			}
		});
		var hyNews = new Vue({
			el : "#hy",
			data : {
				cur : 0, //默认选中第一个tab
				hyNewsList : null
			}
		});
		var jieduNews = new Vue({
			el : "#jiedu",
			data : {
				cur : 0, //默认选中第一个tab
				jieduNewsList : null
			}
		});
		var zhanhuiNews = new Vue({
			el : "#zhanhui",
			data : {
				cur : 0, //默认选中第一个tab
				zhanhuiNewsList : null
			}
		});
		var baoguangNews = new Vue({
			el : "#baoguang",
			data : {
				cur : 0, //默认选中第一个tab
				baoguangNewsList : null
			}
		});

		var ProposedProject = new Vue({
			el : "#ProposedProject",
			data : {
				ProposedProjectList : null
			}
		});
		var famousCompany = new Vue({
			el : "#famousCompany",
			data : {
				famousCompanyWallList : null
			}
		});
		var mingqi = new Vue({
			el : "#mingqi",
			data : {
				famousCompanyList : null
			}
		});
		var bidDatum = new Vue({
			el : "#bidDatumList",
			data : {
				bidDatumList : []
			},
			created : function() {
				fidnbidDatumList();

			}
		});
		var data = new Vue({
			el : "#data",
			data : {
				industrys : []
			},
			methods : {
				classification : function(type) {
					if (type) {
						localStorage.setItem("type", type);
					}

				}

			},
			created : function() {
				var self = this;
				//获取缓存数据
				var res = localStorage.getItem("bidsCategoryQd")
				if (res) {
					self.industrys = JSON.parse(res);
				} else {
					$.ajax({
						url : '/bidsCategoryQd.list.do',
						type : 'post'
					}).then(function(res) {
						self.industrys = JSON.parse(res);
						//将获取到的列表数据存到本地localStorage，通过localStorage.getItem("bidsCategoryQd")获取的列表数据，用到的时候需手动localStorage.getItem("bidsCategoryQd")转成对象
						localStorage.setItem("bidsCategoryQd", res)

					}).fail(function() {
					});
				}
			}
		});

		function IsPC() {
			var userAgentInfo = navigator.userAgent;
			var Agents = [ "Android", "iPhone", "SymbianOS", "Windows Phone",
					"iPad", "iPod" ];
			var flag = true;
			for (var v = 0; v < Agents.length; v++) {
				if (userAgentInfo.indexOf(Agents[v]) > 0) {
					flag = false;
					break;
				}
			}
			return flag;
		}
		$(function() {
			var ispc = IsPC();
			if (ispc == false) {
				location.href = "/m.index.do"
				return;
			}
			//招标信息板块
			todayBids();
			typeBids();
			findBidsConsultation();
			findWinBids();
			findFreeBids();
			//采购信息板块
			findFamousCompany();
			findFamousCompanyWall();
			findExcellentSuppliers();
			typePurchase();
			//项目中心板块
			findBidingInfoByType();
			findProposedProject();
			//行业资讯板块
			findHyNews();
			findJieduNews();
			findZhanhuiNews();
			findBaoguangNews();
			todayNews()
			//获取缓存存活时间
			var time = localStorage.getItem("lastTime");
			if (time) {
				//缓存存活时间是否大于一天如果大于则删除缓存
				var savetime = new Date().getTime() - time;
				if (savetime > 43200000) {
					localStorage.clear();
					localStorage.setItem("lastTime", new Date().getTime());
				}
			} else {
				localStorage.setItem("lastTime", new Date().getTime());
			}

			if (window.history && window.history.pushState) {
				$(window).on('popstate', function() {
					window.history.pushState('forward', null, '');
					window.history.forward(1);
				});
			}
			window.history.pushState('forward', null, ''); //在IE中必须得有这两行
			window.history.forward(1);
			/*精选项目类型入口*/
			$("body").on("click",".jxxm a",function()
			{
				localStorage.setItem("jxsmtype",$(this).attr("id"));
			})
		});
		//查询今日招标
		function todayBids() {
			$.ajax({
				type : 'POST',
				url : '/bids.todayBids.do',
				dataType : 'json',
				success : function(data) {
					app.todayBidsList = data;
				}

			});
		}
		var leixing = '招标公告';
		//查询招标公告
		function typeBids(type) {
			if (type) {
				leixing = type;
			}
			var param = {
				type : leixing
			};
			$.ajax({
				type : 'POST',
				url : '/bids.typeBids.do',
				dataType : 'json',
				data : param,
				success : function(data) {
					did.typeBidsList = data;
				}

			});
		}

		//查询招标公告
		function typePurchase(type) {
			leixing = '企业采购';
			if (type) {
				leixing = type;
			}
			var param = {
				type : leixing
			};
			$.ajax({
				type : 'POST',
				url : '/bids.typeBids.do',
				dataType : 'json',
				data : param,
				success : function(data) {
					buy.typePurchaseList = data;
				}
			});
		}

		//查询招标资讯
		function findBidsConsultation() {
			$.ajax({
				type : 'POST',
				url : '/bids.bidsConsultation.do',
				dataType : 'json',
				success : function(data) {

					bc.bidsConsultationList = data;
					app.recommendBidsList = data;
				}

			});
		}

		//查询中标公告
		function findWinBids() {

			var type = '中标公告';

			var param = {
				type : type
			};
			$.ajax({
				type : 'POST',
				url : '/bids.freeAndWinBids.do',
				dataType : 'json',
				data : param,
				success : function(data) {
					winBids.winBidsList = data;
				}
			});
		}

		//查询免费公告
		function findFreeBids() {
			var type = '';

			var param = {
				type : type
			};
			$.ajax({
				type : 'POST',
				url : '/bids.freeAndWinBids.do',
				dataType : 'json',
				data : param,
				success : function(data) {
					freeBids.freeBidsList = data;
				}
			});
		}

		//跳转到采购信息页面
		function toPurchaseIndex() {
			localStorage.setItem("leixing", "采购公告");
		}

		//跳转到行业资讯页面
		function setCategory(data) {
			localStorage.setItem("category", data);

		}

		//跳转到招标信息页面
		function setLeixing(data) {
			localStorage.setItem("leixing", data);

		}
		var category = '';
		//查询行业资讯
		function findHyNews() {
			category = '行业资讯';

			var param = {
				category : category
			};
			$.ajax({
				type : 'POST',
				url : '/news.findByCategory.do',
				dataType : 'json',
				data : param,
				success : function(data) {

					hyNews.hyNewsList = data;
				}

			});
		}

		//查询政策解读
		function findJieduNews() {
			category = '新规解读';

			var param = {
				category : category
			};
			$.ajax({
				type : 'POST',
				url : '/news.findByCategory.do',
				dataType : 'json',
				data : param,
				success : function(data) {

					jieduNews.jieduNewsList = data;
				}

			});
		}
		//查询近期展会
		function findZhanhuiNews() {
			category = '近期展会';

			var param = {
				category : category
			};
			$.ajax({
				type : 'POST',
				url : '/news.findByCategory.do',
				dataType : 'json',
				data : param,
				success : function(data) {

					zhanhuiNews.zhanhuiNewsList = data;
				}

			});
		}
		//查询曝光台
		function findBaoguangNews() {
			category = '曝光台';

			var param = {
				category : category
			};
			$.ajax({
				type : 'POST',
				url : '/news.findByCategory.do',
				dataType : 'json',
				data : param,
				success : function(data) {

					baoguangNews.baoguangNewsList = data;
				}

			});
		}

		//查询实时新闻
		function todayNews() {
			$.ajax({
				type : 'POST',
				url : '/news.todayNews.do',
				dataType : 'json',
				success : function(data) {
					app.todayNewsList = data;
				}

			});
		}
		//首页地区查询公告
		function queryByRegion(region) {
			//   localStorage.setItem("leixing", "采购公告");
			localStorage.setItem("region", region);
			window.location.href = "bids.listIndex.do";
		}

		var proType = 'VIP精选';
		//根据类型查询项目
		function findBidingInfoByType(type) {
			if (type) {
				proType = type;
			}
			var param = {
				proType : proType
			};
			$.ajax({
				type : 'POST',
				url : '/biddinginfo.findBidingInfoByType.do',
				dataType : 'json',
				data : param,
				success : function(data) {
					pm.typeBiddingInfoList = data;
				}

			});
		}
		/* 			//根据行业类型查询项目
		 function findBidingInfgByIndustry(type){
		 if(type){
		 localStorage.setItem("type", type);
		 }
		
		 } */
		//跳转发布信息页面
		function toPublishInformationIndex() {
			window.location.href = "publishInformation.index.do";
		}
		//查询拟在建项目			
		function findProposedProject() {
			proType = "拟建项目";
			var param = {
				proType : proType
			};
			$.ajax({
				type : 'POST',
				url : '/biddinginfo.findBidingInfoByType.do',
				dataType : 'json',
				data : param,
				success : function(data) {
					ProposedProject.ProposedProjectList = data;
				}

			});
		}
		//查询名企采购展示墙
		function findFamousCompany() {
			$.ajax({
				type : 'POST',
				url : '/application.famousCompany.do',
				dataType : 'json',

				success : function(data) {
					mingqi.famousCompanyList = data;
				}

			});
		}
		//查询名企采购展示墙
		function findFamousCompanyWall() {
			$.ajax({
				type : 'POST',
				url : '/application.famousCompanyWall.do',
				dataType : 'json',

				success : function(data) {
					famousCompany.famousCompanyWallList = data;

				}

			});
		}
		//查询优秀供应商
		function findExcellentSuppliers() {
			$.ajax({
				type : 'POST',
				url : '/application.excellentSuppliers.do',
				dataType : 'json',
				success : function(data) {
					app.excellentSuppliersList = data;
				}

			});
		}
		//查询招标资料
		function fidnbidDatumList() {
			$.ajax({
				type : 'POST',
				url : '/bidDatum.fidnbidDatumList.do',
				dataType : 'json',
				success : function(data) {
					bidDatum.bidDatumList = data;
				}

			});

		}

		//顶部导航栏查询
		function findByName() {
			var business = document.getElementById("topClassification");
			var titles = document.getElementById("titles").value;
			if (business.innerHTML) {
				if (business.innerHTML == "招标信息") {
					localStorage.setItem("title", titles);
					window.location.href = "bids.listIndex.do";
				}
				if (business.innerHTML == "采购信息") {
					localStorage.setItem("title", titles);
					localStorage.setItem("leixing", "采购公告");
					window.location.href = "bids.listIndex.do";
				}
				if (business.innerHTML == "项目中心") {
					localStorage.setItem("title", titles);
					window.location.href = "biddinginfo.listIndex.do";
				}
				if (business.innerHTML == "行业资讯") {
					localStorage.setItem("title", titles);
					window.location.href = "news.listIndex.do";
				}
			}
		}
	</script>
	<script type="text/javascript">
	var numB = document.getElementById('numBox')
	var numB1 = document.getElementById('numBox1')
	var options = {
        useEasing: true, 
        useGrouping: true, 
        separator: ',', 
        decimal: '.', 
    };
    var demo = new CountUp('numBox', 0, numB.innerText, 0, 2.5, options);
    if (!demo.error) {
        demo.start();
    } else {
        console.error(demo.error);
    }
	var demo1 = new CountUp('numBox1', 0, numB1.innerText, 0, 2.5, options);
    if (!demo1.error) {
        demo1.start();
    } else {
        console.error(demo1.error);
    }
		// 入口函数
		$(function() {
			// 轮播效果
			layui.use('carousel', function() {
				var carousel = layui.carousel;
				//建造实例
				carousel.render({
					elem : '#test1',
					width : '100%', //设置容器宽度
					height : '210px',
					arrow : 'always', //始终显示箭头

				// anim: 'updown' //切换动画方式
				});
			});

		});
		$('.service-list-bottom')
				.click(
						function() {
							layui
									.use(
											'layer',
											function() {
												var layer = layui.layer;
												layer
														.open({
															title : [ '投诉与建议' ],
															type : 1,
															content : $('.suggest'),
															area : [ '400px',
																	'400px' ],
															shade : 0,
															CloseDiv : true,
															shadeClose : true, //开启遮罩关闭
															resize : false,//禁止拉伸
															end : function() {
																layer
																		.close(layer.index);
															},
															success : function(
																	index,
																	layero) {
																$("body")
																		.on(
																				"click",
																				"#complaint_submit",
																				function() {
																					var content = document
																							.getElementById("question").value;
																					if (content == ""
																							|| content == null) {
																						layer
																								.msg(
																										'内容不能为空',
																										{
																											icon : 2,
																											time : 1000, //1s后自动关闭
																											shade : [
																													0.8,
																													'#393D49' ]
																										// 透明度  颜色
																										});
																						return;
																					}
																					var param = {
																						content : content
																					};
																					$
																							.ajax({
																								type : 'POST',
																								url : '/complaintSuggestionMobile.add.do',
																								data : param,
																								success : function(
																										data) {
																									if (data == "succ") {
																										layer
																												.msg(
																														'提交成功，谢谢您的反馈',
																														{
																															icon : 1,
																															time : 1000, //1s后自动关闭
																															shade : [
																																	0.8,
																																	'#393D49' ]
																														// 透明度  颜色
																														});
																										window
																												.setTimeout(
																														function() {
																															$(
																																	"#question")
																																	.val(
																																			"");
																															layer
																																	.closeAll();
																														},
																														1000)

																									} else if (data == "fail") {
																										layer
																												.msg(
																														'提交失败',
																														{
																															icon : 2,
																															time : 1000, //1s后自动关闭
																															shade : [
																																	0.8,
																																	'#393D49' ]
																														// 透明度  颜色
																														});

																									}else if(data == "用户未登录"){
																										layer.msg('您未登录，请登录',
																										{
																											icon : 2,
																											time : 1000, //1s后自动关闭
																											shade : [
																													0.8,
																													'#393D49' ]
																										// 透明度  颜色
																										})
																									} 
																									else {
																										layer
																												.msg(
																														JSON
																																.parse(data).msg,
																														{
																															icon : 1,
																															time : 1000, //1s后自动关闭
																															shade : [
																																	0.8,
																																	'#393D49' ]
																														// 透明度  颜色
																														});

																										window
																												.setTimeout(
																														function() {
																															$(
																																	"#question")
																																	.val(
																																			"");
																															layer
																																	.closeAll();
																														},
																														1000)
																									}
																								}
																							});
																				})
																/* var body = layer.getChildFrame('body', index).contents().serialize();
																update(body, table, _cur_page, index); */

															}
														});
											});
						});
		$(".send_btn").click(function() {
			window.location.href = "/publishInformation.index.do";
		})
		/*根据精选项目列表后边的类型存进缓存项目中心页面用*/
		var  jxProject=new Vue({
			el:'#jxxm_',
			data:{
                  jxProjectlist:[]			
			},
			created:function(){
				var self = this
				var param = {
						page : 1,
						rows : 3,
					};
				$.ajax({
					type : 'POST',
					url : '/biddinginfo.list.do',
					dataType : 'json',
					data : param,
					async : true,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
					success : function(data) {
						self.jxProjectlist=data.rows;
					}
			   })
		    }
		})
		
		/*招标日历*/
		$(".level2ul .msg1").click(function(){
			var year=$(".sel1 input").val();
			var month=formataDate($(".sel2 input").val());
			var time=formataDate($(this).text());
			var date=year+"-"+month+"-"+time;
			localStorage.setItem("dateList",date);
			window.location.href="/bids.listIndex.do";
		})
		/*格式化时间*/
		function formataDate(date){
			return date.length == 1?"0"+date:date;
		}
	</script>
</body>
</html>