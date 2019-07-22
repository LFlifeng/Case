<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>个人中心----管理发布</title>
  <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
  <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
  <link rel="stylesheet" href="${skin}front/css/base.css">
  <link rel="stylesheet" href="${skin}front/css/footer.css">
  <link rel="stylesheet" href="${skin}front/css/personal.css">
  <link rel="stylesheet" href="${skin}front/css/p-mangerelease.css">
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
        <div class="t_right">
          <div class="t_top clearfix">
            <h3 class="l">管理发布</h3>
          </div>
          <div class="table-responsive" id="biddingInfolist" v-cloak>
            <table   class="table table-striped" id="bidingInfo">
              <thead>
                <tr>
 			      <th >序号</th>
                  <th >项目类型</th>
                  <th >项目名称</th>
                  <th >所属地区</th>
                  <th >截止日期</th>
                  <th >状态</th>
                  <th >编辑</th>
                </tr>
              </thead>
              <tbody>
                <tr  v-for="(biddingInfo,index) in biddingInfolist" :key="biddingInfo.id">
       			  <td>{{index+1}}</td>
                  <td>{{biddingInfo.projectType}}</td>
                  <td>
                  <a href="javascript:;" :href="'biddinginfo.details.do?id=' +biddingInfo.id"
								target="blank">{{biddingInfo.projectName}} </a>
                  </td>
                  <td>{{biddingInfo.province}}</td>
                  <td>{{biddingInfo.deadline}}</td>
                  <td v-if="biddingInfo.state === '0'">审核中</td>
                  <td v-else-if="biddingInfo.state === '1'">审核通过</td>
                  <td v-else-if="biddingInfo.state === '2'">审核失败</td>
                  <td>
                    <button  style="margin-top: -5px" type="button" class="btn btn-sm btn-danger"  @click="delt(biddingInfo.id)">删除</button>
                  </td>
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

  <!-- 公共底部 -->
  <%@ include file="../common/footer.jsp"%>
  </div>
  <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
  <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
  <script src="${skin}front/js/wangEditor-3.1.1/wangEditor-3.1.1/release/wangEditor.min.js"></script>
  
  <script type="text/javascript">
	//定义全局变量
	var pageIndex = 1;
	var pageSize = 10;
	var totalCount = 0;
  	var BinddingInfo = new Vue({
		el : "#biddingInfolist",
		data : {
			biddingInfolist : null
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
        			        url: '/biddinginfo.delete.do',
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
			url : '/biddinginfo.Userlist.do',
			dataType : 'json',
			data : param,
			
			success : function(data) {
				BinddingInfo.biddingInfolist = data.rows;
				totalCount = data.total;
				layui.use('laypage', function() {
					laypage = layui.laypage;
					laypage.render({
						elem : 'paging',
						count : totalCount,
						curr : pageIndex,
						theme : '#c8302e',
						limit : pageSize,
						limits: [10],
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
      $('.parentWrap>.menuGroup:nth-child(3)>.groupTitle').css({
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
      //控制遮罩层----修改信息
      $('.t_right .table-responsive .btn-success').click(function () {
        layui.use('layer', function () {
          var layer = layui.layer;
          layer.open({
            title: [''],
            type: 1,
            content: $('.mask'),
            offset: 'auto',
            area: ['1000px', '800px'],
            shadeClose: true, //开启遮罩关闭
            end: function () {
              $(".mask").hide();
            },
          });
        });
      });
      // 日期设置
      layui.use('laydate', function () {
        var laydate = layui.laydate;
        //初始赋值
        laydate.render({
          elem: '#test5',
          type: 'datetime'
        });
      });
      // 上传附件
      layui.use('upload', function () {
        var $ = layui.jquery, upload = layui.upload;
        //设定文件大小限制
        upload.render({
          elem: '#test7'
          , url: '/upload/'
          , size: 2048 //限制文件大小，单位 KB
          , done: function (res) {
          }
        });
      });
      // 富文本编辑器
      var E = window.wangEditor;
      var editor = new E('#editor');
      // 或者 var editor = new E( document.getElementById('editor') )
      editor.create();
    });
  </script>
</body>

</html>