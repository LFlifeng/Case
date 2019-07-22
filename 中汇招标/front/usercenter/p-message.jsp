<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心----系统信息</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
    <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}front/css/base.css">
    <link rel="stylesheet" href="${skin}front/css/footer.css">
    <link rel="stylesheet" href="${skin}front/css/personal.css">
    <link rel="stylesheet" href="${skin}front/css/p-message.css">
    <style>

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
            <img src="${user.portraitUrl}" alt="">
            <span>${user.showName}</span>
            <i class="fa fa-angle-down"></i>
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
                <!-- 手风琴效果 -->
 				<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
		          <li class="layui-nav-item"><a href="/systemQd.systeminformation.do">系统信息</a></li>
		          <li class="layui-nav-item"><a href="/systemQd.paymentInstruction.do">消息通知</a></li>
                </ul>
            </div>
            <!-- 右侧 -->
            <div class="right r">
                <div class="t_right" id="system_vue">
                    <div class="t_top">
                        <h3>消息通知</h3>
                    </div>
                    <ul>
                        <li class="clearfix" v-for="system in systemLists" :key="system.id">
                            <a v-bind:href="system.url" class="l">{{system.msg}}</a>
                           	 <span  v-if="system.state=='1'" class="r" @click="a(system.id)">删除</span>
						</li>
                    </ul>
                    <br>
                    <div id="paging"></div>
                </div>
            </div>
        </div>
    </div>
    
  <!-- 底部 -->
  <%@ include file="../common/footer.jsp" %> 
  
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script src="${skin}front/js/wangEditor-3.1.1/wangEditor-3.1.1/release/wangEditor.min.js"></script>
    <script src="${skin}front/js/common.js"></script>
    <script>
    var pageIndex = 1;
	var pageSize = 16;
	var totalCount = 0;
        //入口函数
        $(function () {
            // 引入公共底部
            // 手风琴导航
            $('.parentWrap>.menuGroup>.groupTitle').click(function () {
                $(this).css({
                    "background-color": "#e8f5fc",
                    "color": "#ba3f44",
                    "border-left": "4px solid #ba3f44"
                });
                $(this).siblings().show();
                $(this).parent().siblings().children('div').hide();
                $(this).parent().siblings().children('span').css({
                    "background-color": "",
                    "color": "",
                    "border-left": ""
                });
            });
            // 鼠标移入显示移除隐藏删除按钮
            $('.t_right li').mouseenter(function () {
                $(this).children('span').show();
            });
            $('.t_right li').mouseleave(function () {
                $(this).children('span').hide();
            });
        });
        list();
        var c=new Vue({
        	 el:'#system_vue',
        	 data:{
        		 systemLists:[]
        	 },
        	methods:{
        		   a:function(ids){
        			$.ajax({
            			url:'/systemQd.deleteSystemById.do',
                        data:{id:ids},
            			success:function(data){
            				list();
            			}
            		})
        		}
        	}
        })

		
        
       
     //初始化界面数据
     function list(){
        	var param = {
        			page : pageIndex,
        			rows : pageSize,
        			type:'2'
        		};
    		$.ajax({
    			url:'/systemQd.list.do',
    			data:param,
    			dataType:'json',
    			success:function(data){
    				c.systemLists=data.rows;
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
    								list();
    							}
    						}
    					});
    				});
    			}
    		})
    	}
    </script>
</body>
</html>