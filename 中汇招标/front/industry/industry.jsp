<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>行业分类</title>
		<script src="${skin}front/js/jquery-3.3.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
		<link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="${skin}front/css/base.css">
		<link rel="stylesheet" type="text/css" href="${skin}front/css/header.css">
		<link rel="stylesheet" type="text/css" href="${skin}front/css/footer.css">
		<style>
			.position_nav {
				width: 1200px;
				height: 50px;
				line-height: 50px;
				margin: 0 auto;
			}
			.position_nav p {
				text-align: left;
				font-size: 14px;
				color: #505050;
			}
			.position_nav a {
				padding: 1px 8px;
				
			}
			/* 行业导航样式*/
			
			.nav_content {
				width:1178px;
				margin: 0 auto 20px;
				padding: 20px;
				border: 1px solid #e6e6e6;
			}
			.nav_content_l {
				padding: 0px 0px;
			}
			.industry_class {
			    font-weight: 600; 
				padding-left: 6px;
				font-size:14px;
				height: 34px;
				border-left:3px solid #008FED;
			}
			.nav_content_l li {
				padding: 20px 0px;
			}
			.nav_content_l li a {
				padding: 10px;
				color:#505050;
			}
			.nav_content_l li a:hover {
				color:#008FED;
				}
			.nav_content_l div{
			    color:#646464;
			}	
			[v-cloak] {
			    display: none;
			}
		</style>
	</head>
	<body>
		<!-- 公共头部 -->
		<%@ include file="../common/header.jsp" %>
			
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
		<div class="position_nav">
			当前位置：<a href="#">首页</a>><a href="#">行业导航</a>
		</div>


        <!--列表详情部分-->
		<div class="nav_content">
			<ul class="nav_content_l" id="data" v-cloak>
			   <div v-for="industry in industrys">
					<label  class="industry_class">
			                {{ industry.name }}    
			    	</label>
			    	<li>
						 <a v-for="item in industry.list" href="bids.listIndex.do"  @click='classification(item)'>
			     	 	    {{item}}
                     	 </a>
			    	</li> 
		         </div>
			</ul>
		</div>


		<!-- 公共底部 -->
		<%@ include file="../common/footer.jsp" %>
			
		<script type="text/javascript">
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
	            created: function (){
	            var res=localStorage.getItem("bidsCategoryQd")
	            this.industrys=industrys = JSON.parse(res);
	            }
			 });
		</script>
	</body>
</html>
