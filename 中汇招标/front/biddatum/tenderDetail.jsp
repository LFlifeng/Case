<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>标书详情</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/header.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/tenderDetail.css">
    
    <style type="text/css">
    [v-cloak] {
    display: none;
}
    </style>
</head>

<body>
	<%@ include file="../common/header.jsp"%>
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
    <div class="position_nav">
        当前位置：<a href="/main.index.do">首页</a>>
    </div>
    <div class="arc_content clearfix">
        <!-- 项目标书详细 -->
        <div class="l">
            <div class="arc">
                <div class="arc_title">
                   ${detail.tltle}
                </div>
                <div class="arc_time">
                    <span>发布于：${detail.ctime}</span>
                    <span>来源：${detail.source}</span>
                </div>
                <div class="arc_cont">
                    <span>${detail.accessory}</span>
                    <div class="download"><a  href="${detail.attaUrl}">点击下载</a></div>
                </div>
            </div>
            <!-- 版权 -->
            <div class="copyright">
                <p>版权声明：</p>
                <p> 1、本网站中的文章（包括转贴文章）的版权仅归原作者所有，若作者有版权声明的或文章从其它网站转载而附带有原所有站的版权声明者，其版权归属以附带声明为准。</p>
                <p>2、本网站转载于网络的资讯内容及文章，我们会尽可能注明出处，但不排除来源不明的情况。如果您觉得侵犯了您的权益，请通知我们更正。若未声明，则视为默许。由此而导致的任何法律争议和后果，本站不承担任何责任。</p>
                <p>3、如有问题可联系编辑部，电话：010-58851111-390，电子邮件：editor@ebnew.com 。</p>
            </div>
        </div>
        <!-- 独家招标信息 -->
        <div class="sidebar_right l fl10">
            <div class="new_did" id="exclusiveBids"  v-cloak>
				<div class="new_did_title">
					独家招标信息 <a class="new_did_title_more" href="bids.listIndex.do">更多</a>
				</div>
				<ul class="new_did_l" >
					<li id="lia" v-for="bids in exclusiveBidsList" :key="bids.id"><a :href="'bids.details.do?id=' +bids.id">{{bids.name}}</a></li>
				</ul>
            </div>
        </div>
    </div>
    <!-- 公共底部 -->
    <%@ include file="../common/footer.jsp"%>

    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <script src="${skin}front/js/search.js"></script>
    <script>
	var exclusiveBids = new Vue({
		el : "#exclusiveBids",
		data : {
			exclusiveBidsList : null
		},
		created:function (){
			findExclusiveBids();	
		}
	});
    
	//查询独家招标
	function findExclusiveBids(){
		 $.ajax({
		        type: 'POST',
		        url: '/bids.exclusiveBids.do',
		        dataType: 'json',
		      
		        success: function (data)
		        {
		        	exclusiveBids.exclusiveBidsList = data;
		        }
        			
		    });
	}

    </script>
</body>
</html>