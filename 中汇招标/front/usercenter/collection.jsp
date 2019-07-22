<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心----我的收藏</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <link rel="stylesheet" href="${skin}front/css/base.css">
    <link rel="stylesheet" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/personal.css">
    <link rel="stylesheet" href="${skin}front/css/p-collection.css">
	<style type="text/css">
	.r{
	
		display: block !important;
	}
	[v-cloak] {
	    display: none;
	}
	#tdd {
		display:inline-block;
		width:880px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	
	</style>
</head>


<body>
    <!-- 顶部 -->
    <div class="top">
        <div class="header w clearfix">
            <!-- logo区域 -->
            <div class="logo l">
            	<a href="/main.index.do" style="display: inline-block;">
                <img src="${skin}front/img/logo.png" alt=""></a>
            </div>
            <!-- 导航部分 -->
            <div class="nav l">
                <ul class="clearfix">
	    		 <li class="l"><a href="/userQd.center.do">个人中心</a></li>
	             <li class="l"><a href="/userQd.tenderserver.do">在线客服</a></li>
	             <li class="l"><a href="/userQd.memberserver.do">会员服务</a></li>
	             <li class="l"><a href="/userQd.promotionserver.do">推广服务</a></li>
	             <li class="l"><a href="/orderInfo.index.do">发票申请</a></li>
                </ul>
            </div>
            <!-- 个人中心部分 -->
            <div class="personal r">
                <div class="detail clearfix">
                    <div class="l">
            <a href="/systemQd.systeminformation.do"><img src="${skin}front/img/icon-email.jpg" alt=""></a>
          </div>
          <div class="l">
            <a href="/systemQd.paymentInstruction.do"><img src="${skin}front/img/icon-rang.jpg" alt=""></a>
          </div>
                    <div class="l">
						<img src="${user.portraitUrl}" alt=""> <span>${user.showName}</span> <i class="fa fa-angle-down"></i>
                    </div>
                    <ul class="ul">
                        <li>
                            <a href="/userQd.accountInformationIndex.do">账号信息</a>
                        </li>
                        <li>
                             <a href="/userQd.changePwdIndex.do">安全设置</a>
                        </li>
                        <li>
                            <a href="/userQd.logout.do">退出登录</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 主体部分 -->
    <div class="main">
        <div class="middle w clearfix">
            <!-- 左侧 -->
            <div class="left l">
        <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
          <li class="layui-nav-item"><a href="userQd.center.do">基本信息</a></li>
          <li class="layui-nav-item">
            <a href="javascript:;">招标服务</a>
            <dl class="layui-nav-child">
              <dd><a href="/trackerFront.page.do">跟踪信息</a></dd>
              <dd><a href="/designedinfo.listIndex.do">项目专盯</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;">供应商库</a>
            <dl class="layui-nav-child">
              <dd><a href="/application.entry.do">申请入驻</a></dd>
              <dd><a href="/application.listShow.do">产品展示</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;">发布信息</a>
            <dl class="layui-nav-child">
              <dd><a href="/publishInformation.index.do">发布信息</a></dd>
              <dd><a href="/mangerelease.index.do">管理发布</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item"><a href="/userCollection.listIndex.do">我的收藏</a></li>
          <li class="layui-nav-item"><a href="/browsingHistory.listIndex.do">浏览历史</a></li>
        </ul>
      </div>
            <!-- 右侧 -->
            <div class="right r">
                <div class="t_right" id="userCollectionList" v-cloak>
                    <div class="t_top">
                        <h3>我的收藏</h3>
                    </div>
                    <ul>
                        <li class="clearfix" v-for="userCollection in userCollectionList" :key="userCollection.id" >
                            <a  id="tdd" :href="'bidsFront.details.do?id=' +userCollection.biddinginfoId" class="l">{{userCollection.biddinginfoTitle}}</a>
                            <span class="r"  @click="delt(userCollection.id)">删除</span>
                        </li>

			  			
                    </ul>
                    <!-- 分页容器 -->
						<div id="paging"></div>
                </div>
                
          
            </div>
        </div>
    </div>
    
    <!-- 底部 -->
   	<%@ include file="../common/footer.jsp"%>

    </div>
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="${skin}front/js/wangEditor-3.1.1/wangEditor-3.1.1/release/wangEditor.min.js"></script>
    
    <script type="text/javascript">
  //定义全局变量
	var pageIndex = 1;
	var pageSize = 16;
	var totalCount = 0;
  	var userCollection = new Vue({
		el : "#userCollectionList",
		data : {
			userCollectionList : null
		},
		created:function(){
			this.$nextTick()
		},
        methods:{
            delt:function(index){
            	layer.confirm('您是否确定删除？', {
            		  btn: ['是','否'] //按钮
            		}, function(){
            			var param = {
                    			id : index
                    	};
                    	$.ajax({
        			        type: 'POST',
        			        url: '/userCollection.delete.do',
        			        data: param,
        			        success: function (data)
        			        {
        			        	if(data =="succ"){
        			        		layer.msg('删除成功', {
                             		    icon: 1,
                             		    shade: [0.8, '#393D49'] // 透明度  颜色
                             		});
            						pageIndex=1;
            						loadList();
        			        	}else{
        			        		layer.msg('删除失败', {
                             		    icon: 2,
                             		    shade: [0.8, '#393D49'] // 透明度  颜色
                             		});
            						pageIndex=1;
            						loadList();
        			        	}


        			        }
	
        			    });
            		 
            		}, function(){
            			
            		});
            }
        }
  	});
    
  	function loadList() {
		//查询条件
		var param = {
			page : pageIndex,
			rows : pageSize,

		};
		$.ajax({
			type : 'POST',
			url : '/userCollection.Userlist.do',
			dataType : 'json',
			data : param,
			
			success : function(data) {
				userCollection.userCollectionList = data.rows;
				totalCount = data.total;
				layui.use('laypage', function() {
					laypage = layui.laypage;
					laypage.render({
						elem : 'paging',
						count : totalCount,
						curr : pageIndex,
						theme : '#c8302e',
						limit : pageSize,
						limits: [16],
						layout : [ 'count', 'prev', 'page', 'next',
								'limit', 'refresh', 'skip' ],
						jump : function(obj, first) {
							//点击非第一页页码时的处理逻辑。比如这里调用了ajax方法，异步获取分页数据
							if (!first) {
								pageIndex = obj.curr;
								pageSize = obj.limit;
								loadList();
			
							}
						}
					});
				});
			}

		});
	};
    
    </script>
    
    <script>
        //入口函数
        $(function () {
      	 	loadList();
            // 手风琴导航
            $('.parentWrap>.menuGroup:nth-child(4)>.groupTitle').css({
                "background-color": "#e8f5fc",
                "color": "#ba3f44",
                "border-left": "4px solid #ba3f44"
            });
            $('.parentWrap>.menuGroup>.groupTitle').click(function () {
                $(this).css({
                    "background-color": "#e8f5fc",
                    "color": "#ba3f44",
                    "border-left": "4px solid #ba3f44"
                });
                $(this).siblings().slideDown();
                $(this).parent().siblings().children('div').slideUp();
                $(this).parent().siblings().children('span').css({
                    "background-color": "",
                    "color": "",
                    "border-left": ""
                });
            });
            // 下拉菜单部分
            // 1.鼠标进入一级菜单后，显示二级菜单
            $('.top .personal .detail div:nth-child(3)').mouseover(function () {
                $(this).siblings('ul').show();
            });
            // 2.鼠标离开一级菜单后，隐藏二级菜单
            $('.top .personal .detail div:nth-child(3)').mouseout(function () {
                $(this).next().hide();
            });
            // 3.鼠标进入二级菜单，显示二级菜单
            $('.detail>.ul').mouseover(function () {
                $(this).show();
            });
            // 4.鼠标离开二级菜单，隐藏二级菜单
            $('.detail>.ul').mouseout(function () {
                $(this).hide();
            });
            // 鼠标移入显示移除隐藏删除按钮
            $('.t_right li').mouseenter(function() {
                $(this).children('span').show();
            });
            $('.t_right li').mouseleave(function() {
                $(this).children('span').hide();
            });
        });
    </script>
</body>

