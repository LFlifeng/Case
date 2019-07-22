<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>海量政府企业采购供应商尽在中汇招标网</title>
	<meta name="keywords" content="供应商库,供应商采购商,供应商厂家名录">
	<meta name="description" content="找供应商采购商平台,汇聚海量供应商采购商以及各种产品的供求等等">
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/header.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${skin}front/css/supplier.css">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
	<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
	<script src="${skin}js/layui/layui.js"></script>
    <style type="text/css">
    [v-cloak] {
	    display: none;
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
    <!-- 招标主要分类 -->
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
    <!-- 最新发布 -->
    <div class="new_infos">
        <div class="w clearfix">
            <div class="release l" id="latestRelease" v-cloak style="width:250px;height:363px;">
                <div class="release_title">最新发布&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:#fff;" href="/bids.listIndex.do">更多</a></div>
                
                <ul class="release_title_content">
                    <li v-for="bids in  latestReleaseList" :key="bids.id">
                    	<a :href="'bids.details.do?id=' +bids.id">{{bids.name}}</a></li>
                </ul>
            </div>
            <div class="img l">
                <img src="${skin}front/img/sup_banner.jpg" alt="">
            </div>
			<div class="s_menu l" id="data" v-cloak v-cloak style="width:296px;height:363px;">
                <div class="sub_menu_more">
                    <span>热门行业分类</span>
                    <a class="" href="/industry.detail.do">更多</a>
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
        </div>
    </div>
    <!-- 优秀供应商 -->
    <div class="supplier">
        <div class="w clearfix">
            <!-- 优秀供应商推荐 -->
            <div class="l supplier_info" id="excellentApplication" v-cloak>
                <div class="supplier_info_title">优秀供应商推荐</div>
               	<div v-if="excellentApplicationList !== undefined && excellentApplicationList!==null && excellentApplicationList!==''">
                <div class="supplier_info_list clearfix" v-for="application in excellentApplicationList" :key="application.id">
                    <div class="supplier_img l">
                        <img :src="application.portraitUrl" alt="" style="border-radius: 100px">
                    </div>
                    <div class="supplier_info_business l">
                        <h3>{{application.enterpriseName}}</h3>
                        <div class="supplier_address">
                            <span>地区：</span>
                            <span>{{application.address}}</span>
                            <span>所属行业：</span>
                            <span>{{application.industryOne}}</span>
                        </div>
                        <div class="business">
                            <span>主营业务：</span>
                            <span>
                                {{application.product}}
                            </span>
                        </div>
                    </div>
                    <div class="r">    
                        <a :href="'/application.applicationShow.do?id=' +application.id">进入主页</a>
                    </div>
                </div>
                </div>

            </div>
                            			<!-- 分页容器 -->
			<div id="paging"></div>

        </div>
    </div>
    <!-- 公共底部 -->
	<%@ include file="../common/footer.jsp"%>
    <!-- 弹出层 -->
    
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script src="${skin}front/js/search.js"></script>
    
    <script type="text/javascript">
	//定义全局变量
	var pageIndex = 1;
	var pageSize = 5;
	var totalCount = 0;
	 //查询最新发布项目
    var latestRelease = new Vue({
    		el:"#latestRelease",
    		data:{
    			latestReleaseList:null
    		},
            created: function ()
            {
            	 $.ajax({
     		        type: 'POST',
     		        url: '/bids.findLatestRelease.do',
     		        dataType: 'json',	      
     		        success: function (data)
     		        {
     		        	latestRelease.latestReleaseList = data;
     		        }
          			
     		    });
            }
    });
	//热门行业分类
    var data = new Vue({
		el: "#data",
		data: {
    	industrys: []
        },
        methods:{
        	classification:function(type){
    				if(type){
    					localStorage.setItem("type", type);
    				}
    		
        	}
        	
        },    
        created: function ()
        {
            var self = this;
            //获取缓存数据
            var res=localStorage.getItem("bidsCategoryQd")
            if(res)
            {
            	self.industrys = JSON.parse(res);
            }
            else
            {
            	 $.ajax({
 	                url: '/bidsCategoryQd.list.do',
 	                type: 'post'
 	            }).then(function (res) {
 	                self.industrys = JSON.parse(res);
 	                //将获取到的列表数据存到本地localStorage，通过localStorage.getItem("bidsCategoryQd")获取的列表数据，用到的时候需手动localStorage.getItem("bidsCategoryQd")转成对象
 	                 localStorage.setItem("bidsCategoryQd",res)
 	                
 	            }).fail(function () {});
            }
	 }}); 
	 
	 
	//查询优秀供应商
    var excellentApplication = new Vue({
		el:"#excellentApplication",
		data:{
			excellentApplicationList:null
		},
        created: function ()
        {
        	findExcellentApplication();
        }
	});

    function findExcellentApplication(){
    	var param = {
				page : pageIndex,
				rows : pageSize,
			};
		 $.ajax({
		        type: 'POST',
		        url: '/application.findExcellentApplication.do',
		        dataType: 'json',	
		        data:param,
		        success: function (data)
		        {
		        	excellentApplication.excellentApplicationList = data.rows;
					totalCount = data.total;
					layui.use('laypage', function() {
						laypage = layui.laypage;
						laypage.render({
							elem : 'paging',
							count : totalCount,
							curr : pageIndex,
							theme : '#c8302e',
							limit : pageSize,
							limits: [5],
							layout : [ 'count', 'prev', 'page', 'next',
									'limit', 'refresh', 'skip' ],
							jump : function(obj, first) {
								//点击非第一页页码时的处理逻辑。比如这里调用了ajax方法，异步获取分页数据
								if (!first) {
									pageIndex = obj.curr;
									pageSize = obj.limit;
									findExcellentApplication();
								}
							}
						});
					});
		        }
	 			
		 });
    }
    </script>
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
	                type: 'post',
	            }).then(function (res){
	                self.columnCategorys = JSON.parse(res);
	                localStorage.setItem("columnCategorysKey",res)
	                
	            }).fail(function () {});
           }
	 	},
	});
   
	//把新闻分类放在页面缓存
	function setCategory(category) {
		if (category) {
			localStorage.setItem("category", category);
		}
	}
	//把公告类型和新闻类型放在页面缓存
	function setLeixing(leixing) {
		if (leixing) {
			localStorage.setItem("lx", leixing);
		}
	}

    </script>
</body>

</html>