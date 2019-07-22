<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

 <%@ include file="../common/header.jsp"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>中汇招标----专题页</title>
    <link rel="shortcut icon" href="${skin}front/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/header.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/topic.css">
</head>

<body>
   
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
    <div class="main">
		<div class="main_content clearfix" id="columnData" v-cloak>
			<div class="main_box fl" v-for="columns in columnCategorys">
				<h3>{{columns.columnName}}</h3>
				<div class="main_list">
					<ul>
						<li v-for="item in columns.list"><a :href='item.url'
							@click='leixing(item.columnName)'  >{{item.columnName}}</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
    <!-- banner -->
    <div class="banner">
        <a href="#"><img src="${skin}front/img/gysbtn.png" alt=""></a>
    </div>
    <div class="advantage w">
        <div class="">
            <h3>我们的服务优势</h3>
            <hr>
            <div class="advantage_content">
                <p>中汇招标网提供最新供应商资讯，供货商信息，供应商名录，推荐优秀供应商，代理信息发布，推广和汇聚企业品牌。拥有更多的供应商
                    资源，提供更多的产品展示曝光机会，提供供应商更全面的信息，获取专属定制化采购招标信息；提供高级采购方，提供更多商机。
                </p>
            </div>
        </div>
    </div>
    <div class="advantage w">
        <div class="">
            <h3>三大功能</h3>
            <hr>
            <div class="info_num w clearfix">
                <div class="l">
                    <div class="num">1</div>
                    <p>采购供应商管理，提供采购SaaS工具，海量精选供应商，寻源大数据参谋帮助企业采购降本曾</p>
                </div>
                <div class="l">
                    <div class="num">2</div>
                    <p>发布招标信息公告，修改信息，不限制发布信息次数</p>
                </div>
                <div class="l">
                    <div class="num">3</div>
                    <p>提供采购方，供应商全面的企业商品展示，商品管理等</p>
                </div>
            </div>
        </div>
        
    </div>
    <div class="under">
            <img src="${skin}front/img/gysbg.jpg" alt="">
        </div>
    <div class="advantage w">
        <div class="">
            <h3>海量数据&nbsp;精准搜索</h3>
            <hr>
            <div class="info_img_num clearfix">
                <div class="l">
                    <img src="${skin}front/img/gys1.jpg" alt="">
                    <div class="img_num">
                        <p>9824545</p>
                        <span>注册商户</span>
                    </div>
                </div>
                <div class="l">
                    <img src="${skin}front/img/gys2.jpg" alt="">
                    <div class="img_num">
                        <p>24545</p>
                        <span>认证供应商</span>
                    </div>
                </div>
                <div class="l">
                    <img src="${skin}front/img/gys3.jpg" alt="">
                    <div class="img_num">
                        <p>74545</p>
                        <span>优质企业</span>
                    </div>
                </div>
                <div class="l">
                    <img src="${skin}front/img/gys4.jpg" alt="">
                    <div class="img_num">
                        <p>26545</p>
                        <span>采购商</span>
                    </div>
                </div>
                <div class="l">
                    <img src="${skin}front/img/gys5.jpg" alt="">
                    <div class="img_num">
                        <p>324124545</p>
                        <span>成交额</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 公共底部 -->
   <%@ include file="../common/footer.jsp"%>
   
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script src="${skin}front/js/search.js"></script>
    <script>

    var columnData = new Vue({
		el: "#columnData",
		data: {
    	columnCategorys:[]
        },
        methods:{
        	leixing:function(leixing){
    				if(leixing){
    					localStorage.setItem("lx", leixing);
    				}
        	}
        	
        },
        created: function ()
        {
            var self = this;
            var res = localStorage.getItem("columnCategorysKey");
            if(res)
            {
            	self.columnCategorys = JSON.parse(res);
            }
            else
            {
            	$.ajax({
 	                url: '/columnCategory.listAll.do',
 	                type: 'post'
 	            }).then(function (res){
 	                self.columnCategorys = JSON.parse(res);
 	                localStorage.setItem("columnCategorysKey",res)
 	                
 	            }).fail(function () {});
            }
	 	},
	});
        $(function () 
        {
            $('.banner>a>img').click(function ()
            {
            	var id = '${user.id}';
            	if(id.length==32)
            	{
            		 window.location.href="/application.entry.do"
            	}
            	else
            	{
            		Login_res();
            	}
			})
        });
    </script>
</body>

</html>