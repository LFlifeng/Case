<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心----项目专盯</title>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/css/base.css">
    <link rel="stylesheet" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/personal.css">
    <link rel="stylesheet" href="${skin}front/css/p-projectedesigned.css">
    <style type="text/css">
        [v-cloak] {
		    display: none;
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
                    <img src="${skin}front/img/logo.png" alt="">
                </a>
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
            <div class="right r" id="projectDesignedsList" v-cloak>
                <div class="t_right">
                    <div class="t_top clearfix">
                        <h3 class="l">项目专盯</h3>
                        <div class="l title"  v-if="grade === '0'" >
                            <span>您是普通用户，无法享受专盯服务，想要专盯更多项目请<a href="/userQd.serviceStandards.do">升级会员</a></span>
                        </div>
                        <div class="l title" v-else-if="grade === '1'">
                            <span>您是普通会员，没有专盯服务次数，想要专盯更多项目请<a href="/userQd.serviceStandards.do">升级会员</a></span>
                        </div>
                        <div class="l title" v-else-if="grade === '2'">
                            <span>您是高级会员，享受5次专盯服务，想要专盯更多项目请<a href="/userQd.serviceStandards.do">升级会员</a></span>
                        </div>
                        <div class="l title" v-else-if="grade === '3'">
                            <span>您是VIP高级会员，享受10次专盯服务，想要专盯更多项目请<a href="/userQd.serviceStandards.do">升级会员</a></span>
                        </div>
                        <div class="l title" v-else-if="grade === '4'">
                            <span>您是砖石会员，享受15次专盯服务，恭喜您已经享受最高级别的服务</span>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped" >
                            <thead>
                                <tr>
                                	<th>序号</th>
                                    <th>项目名称</th>
                                    <th>专盯情况</th>
                                    <th>跟进人</th>
                                    <th>备注</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(projectDesigneds,index) in projectDesignedsList" :key="projectDesigneds.id">
                                    <td>{{index+1}}</td>
                                    <td><a :href="'biddinginfo.details.do?id=' +projectDesigneds.id" target="blank" >{{projectDesigneds.projectsName}}</a></td>
                                    
                                    <td>{{projectDesigneds.designedinfo}}</td>
                                    <td>{{projectDesigneds.people}}</td>
                                    <td>{{projectDesigneds.remark}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
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
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <script type="text/javascript">
  //定义全局变量
	var pageIndex = 1;
	var pageSize = 7;
	var totalCount = 0;
  	var projectDesigneds = new Vue({
		el : "#projectDesignedsList",
		data : {
			projectDesignedsList : null,
			grade:'${user.grade}'
		},
		created:function(){
			this.$nextTick()
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
			url : '/designedinfo.Userlist.do',
			dataType : 'json',
			data : param,
			
			success : function(data) {
				projectDesigneds.projectDesignedsList = data.rows;
				totalCount = data.total;
				layui.use('laypage', function() {
					laypage = layui.laypage;
					laypage.render({
						elem : 'paging',
						count : totalCount,
						curr : pageIndex,
						theme : '#c8302e',
						limit : pageSize,
						limits: [7],
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
            $('.parentWrap>.menuGroup:nth-child(1)>.groupTitle').css({
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

        });
    </script>
</body>

</html>