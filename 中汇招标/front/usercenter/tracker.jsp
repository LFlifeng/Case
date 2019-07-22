<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>个人中心----跟踪信息</title>
  <link rel="shortcut icon" href="${skin}front/img/favicon.ico" type="image/x-icon">
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.22/dist/vue.js"></script>
  <link rel="stylesheet" href="${skin}front/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${skin}front/js/layui-v2.4.5/layui/css/layui.css">
  <link rel="stylesheet" href="${skin}front/js/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${skin}front/css/base.css">
  <link rel="stylesheet" href="${skin}front/css/footer.css">
  <link rel="stylesheet" href="${skin}front/css/personal.css">
  <link rel="stylesheet" href="${skin}front/css/p-trackInformation.css">
</head>
<style>
[v-cloak] {
    display: none;
}
</style>
<body>
  <!-- 顶部 -->
  <div class="top">
    <div class="header w clearfix">
      <!-- logo区域 -->
      <div class="logo l">
      	<a href="/main.index.do" style="display: inline-block;">
        <img src="${skin}front/img/logo.png" alt=""></a>
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
            <h3 class="l">跟踪信息</h3>
            <div class="l">可新建六组跟踪数据</div>
            <button id="add_button_id" class="r addButton" >+新建跟踪</button>
           
          </div>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>序号</th>
                  <th>追踪器名称</th>
                  <th>所属地区</th>
                  <th>关键词</th>
                  <th>检索模式</th>
                  <th>订阅方式</th>
                  <th>修改</th>
                </tr>
              </thead>
              <tbody id="trackerList" v-cloak>
                <tr v-for="(tracker,index) in trackers">
                  <td>{{index + 1 }}</td>
                  <td><span>{{tracker.trackerName}}</span></td>
                  <td><span>{{tracker.regionStr}}</span></td>
                  <td><span>{{tracker.keywords}}</span></td>
                  <td>{{tracker.searchTypeStr}}</td>
                  <td><span>{{tracker.subscribe}}</span></td>
                  <td>
                    <button type="button" class="btn btn-sm btn-success"  @click="clickEdit(tracker.id)">编辑</button>
                    <button type="button" class="btn btn-sm btn-danger" @click="clickDelete(tracker.id)">删除</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="right r">
        <div class="t_right">
          <div class="t_top">
            <h3>列表信息</h3>
          </div>
          <!--tab切换模块-->
          <div class="tab">
            <!--切换按钮-->
            <ul class="tab-control clearfix" id="trackerNames" v-cloak>
              <li  v-for="(obj,index) in objs" @click="clickItem(obj.id,$event)">
              	{{obj.name}}
              </li>
            </ul>
            <!--切换项-->
            <div class="tab-content" id="tab_content"  style="height:530px">
              <div class="tab-content-item active">
                <div class="table-responsive" id="table-responsive">
                  <table class="table table-striped" style="table-layout: fixed;">
                    <thead>
                      <tr>
                        <th style="width: 15%;">项目类别</th>
                        <th style="width: 60%;">项目名称</th>
                        <th style="width: 10%;">所在地区</th>
                        <th style="width: 15%;">日期</th>
                      </tr>
                    </thead>
                    <tbody id="bids" v-cloak>
                      <tr  v-for="bid in bids">
                        <td>{{bid.projectType}}</td>
                        <td style="text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><a
								:href="'bidsFront.details.do?id=' +bid.id" target="blank">{{bid.projectName}}</a>
						</td>
                        <td>{{bid.province}}</td>
                        <td>{{bid.ctime}}</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 分页 -->
        <div id="demo1"></div>
        
        
        <!-- 提示层 -->
      <div class="tishi" style="display:none;">
        <div style="text-align:center;margin-top:36px"><img src="${skin}front/img/tishi.png"></div>
        <div style="color:#505050;font-size:20px;font-weight:700;width:460px;text-align:center;margin-top:20px;">提示
        </div>
        <p style="text-align: center;margin-top: 20px;color: #969696;font-size: 16px;">查看功能详情<span
            style="color: #969696;font-size: 16px;margin-left: 20px;">请咨询<i
              style="color: #ff2c36;font-size:18px;font-weight:700;margin-bottom:36px;">400-486-1234</i></span></p>
      </div>
        
      </div>
    </div>
    
       <!-- 底部 -->
   <%@ include file="../common/footer.jsp"%>
   
    <script src="${skin}front/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}front/js/layui-v2.4.5/layui/layui.all.js"></script>
    <script>
      var layer;
      var grade = parseInt('${user.grade}');
      //入口函数
      $(function ()
      {
    	  localStorage.removeItem("addOrEditTrackerSuccessKey");
        // 手风琴导航
        $('.parentWrap>.menuGroup:first-child>.groupTitle').css({
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
        //tab栏切换
        // 1. 获取一组li
        var lis = document.querySelectorAll('.tab-control li');
        // 2. 获取一组div显示项
        var divs = document.querySelectorAll('.tab-content-item');
        // 3. for循环遍历给每一个li注册一个点击事件，给每一个li添加一个index属性，表示li的下标
        for (var i = 0; i < lis.length; i++) {
          // 3.1 给每一个li添加一个index属性
          lis[i].index = i;
          // 3.2 注册事件
          lis[i].onclick = function () {
            // 4. 在事件处理程序中，① 切换li  ② 切换div
            // 4.1 循环遍历去掉所有li 和 所有div的类名active
            for (var j = 0; j < lis.length; j++) {
              lis[j].className = '';
              divs[j].className = 'tab-content-item';
            }
            // 4.2 给当前点击的li添加类名active
            this.className = 'active';
            // 4.3 获取当前点击的li的下标
            var num = this.index;
            // 找到对应的div项，显示
            divs[num].className = 'tab-content-item active';
          };
        }
        //控制遮罩层----新建跟踪
        
        layui.use(['laypage', 'layer','form'], function () {
            var laypage = layui.laypage, layer = layui.layer;
            
            laypage.render({
              elem: 'demo1',
              count: 0,
              theme : '#ba3f44',
              jump: function (obj)
              {
              	
              }
            });
          });
        //add_button_id
     	// $("#add_button_id").click(clickAddButton);
        
        $("#add_button_id").click(clickAddButton);
      });
     
      var trackerList = new Vue({
			el: "#trackerList",
			data: {
			trackers: []
          },
          methods:
          {
        	  clickEdit:function(id)
        	  {
        		  layui.use('layer', function () 
   		    	  {
   		               var layer = layui.layer;
   		               layer.open({
   		                 title: [''],
   		                 type: 2,
   		                 content: "/trackerFront.editTracker.do?id="+id,
	   		             offset: 'auto',
	   	                 area: ['850px','650px'],
	   	                 scrollbar: true,
	   	                 iframeScrolling:true,
	   	                 shadeClose: true, //开启遮罩关闭
   		                 end: function () 
   		                 {
   		                	 if(localStorage.getItem("addOrEditTrackerSuccessKey"))
	   		            	 {
	   		            		  localStorage.removeItem("addOrEditTrackerSuccessKey")
	   		            		  loadList();
	   		            	 }
   		                 },
   		               });
   		           });
        	  },
        	  clickDelete:function(id)
        	  {
        		  var index = layer.open({
        			  content: '您确定要删除吗?'
        			  ,btn: ['删除',"取消"]
        			  ,yes: function(index, layero)
        			  {
        				  $.ajax({
                              url: '/trackerFront.delete.do?id='+id,
                              type: 'post'
                          }).then(function (res) 
                          {
                        	  parent.layer.close(index)
                        	  if(res=="succ")
                        	  {
                        		  loadList();
                        	  }
                        	  else
                        	  {
                        		  layer.msg('保存失败', { icon: 1,shade: [0.8, '#393D49'] }); 
                        	  }
                          	
                          }).fail(function () {});
        			  }
        			  ,btn2: function(index, layero)
        			  {
        				  var index = parent.layer.getFrameIndex(window.name);  
        				  parent.layer.close(index);
        			  }
        			  ,cancel: function()
        			  { }
        			});
        		  
        	  }
          },
          created: function ()
          {
        	  loadList();
		  }});
      var trackerNames = new Vue({
			el: "#trackerNames",
			data: {
			objs: []
          },
          methods:
          {
        	  clickItem:function(id,e)
        	  {
        		 if(!$(e).hasClass("active"))
        		 {
        			 $("#trackerNames > li").removeClass("active"); 
            		 $(e.target).addClass("active");
            		 currentPage = 1;
            		 trackerId = id;
            		 loadSearchList();
        		 }
        	  }
          },
          created: function ()
          {
	   }});
      var bids = new Vue({
			el: "#bids",
			data: {
			bids: []
        },
        created: function ()
        {
	   }});
      var currentPage = 1;
      var trackerId ="";
      function loadSearchList()
      {
    	  $.ajax({
              url: '/biddinginfoFront.list.do',
              type: 'post',
              data:
              {
            	  page:currentPage,
            	  rows:10,
            	  id:trackerId
              }
          }).then(function (res) 
          {
        	  var data = JSON.parse(res);
        	  bids.bids = data.rows;
        	  layui.use(['laypage'], function () 
        	  {
                  var laypage = layui.laypage;
                  laypage.render({
                    elem: 'demo1',
                    count: data.total,
                    curr : currentPage,
					theme : '#ba3f44',
					limit : "10",
                    jump: function (obj,first)
                    {
                    	if (!first)
                    	{
                    		currentPage = obj.curr;
                        	loadSearchList();
						}
                    }
                  });
                });
        	  
          }).fail(function () {});
      }
      function loadList() 
      {
    	  var self = this;
    	  $.ajax({
                url: '/trackerFront.list.do',
                type: 'post'
            }).then(function (res) 
            {
            	var trackers = JSON.parse(res).rows;
            	trackerList.trackers = trackers;
            	var array = new Array();
            	for(var i=0;i<trackers.length && i < 20;i++)
            	{
            		var name = trackers[i].trackerName;
            		if(name.length > 4)
            		{
            			name = name.substring(0,4);
            		}
            		var id = trackers[i].id;
            		array.push(Object.create({name:name,id:id}));
            	}
            	trackerNames.objs = array;
            	if(array.length >= 6)
            	{
            		 $("#add_button_id").unbind('click',clickAddButton);
            		$("#add_button_id").click(clickNoticeButton);
            	}
            	setTimeout(function()
                 {
            		 $("#trackerNames li").each(function(i,e)
            		 {
            			 if(i==0)
            			 {
            				$(e).click();
            			 }
            		 });
                 	
                 }, 200);
            	
            }).fail(function () {});
       }
      
      function clickAddButton()
      {
    	  layui.use('layer', function () {
              var layer = layui.layer;
              layer.open({
                title: [''],
                type: 2,
                content: ["/trackerFront.addTracker.do"],
                offset: 'auto',
                area: ['850px','650px'],
                scrollbar: true,
                iframeScrolling:true,
                shadeClose: true, //开启遮罩关闭
                end: function () 
                {
              	  if(localStorage.getItem("addOrEditTrackerSuccessKey"))
              	  {
              		  localStorage.removeItem("addOrEditTrackerSuccessKey")
              		  loadList();
              	  }
                },
              });
            });
      }
      function clickNoticeButton()
      {
    	  layui.use('layer', function () { //独立版的layer无需执行这一句
              var $ = layui.jquery, layer = layui.layer;
              layer.open({
                type: 1,
                title: false,
                closeBtn: false,
                area: '[460px,260px]',
                id: 'LAY_layuipro',
                btn: ['知道了'],
                btnAlign: 'c',
                content: $('.tishi'),
                resize: false,//禁止拉伸
                end: function () {
                  $(".tishi").hide();
                },
              })
            });
      }
    </script>
</body>

</html>